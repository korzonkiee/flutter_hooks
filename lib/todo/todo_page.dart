import 'dart:convert';
import 'package:hooks_examples/common/button.dart';
import 'package:hooks_examples/common/container.dart';
import 'package:hooks_examples/common/text_field.dart';
import 'package:hooks_examples/todo/actions.dart';
import 'package:hooks_examples/todo/hooks.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/todo/reducers.dart';
import 'package:hooks_examples/todo/state.dart';
import 'package:hooks_examples/todo/todo.dart';

class TodoPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final store = useReducer(appReducer, initialState: initialState);
    final todos = store.state.todos;

    useEffect(() {
      SharedPreferences.getInstance().then((prefs) {
        String data = prefs.getString("todos");
        final cachedTodos = Todo.listFromJson(data);

        store.dispatch(Reset(cachedTodos));
      });
    }, []);

    useEffect(() {
      String data = json.encode(todos);
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString("todos", data);
      });
    }, [store.state]);

    return MaterialApp(
      title: 'Flutter Demo',
      home: AppContainer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                AppButton(
                    text: "Add",
                    onPressed: () {
                      store.dispatch(Add(Todo()));
                    }),
                Expanded(
                  child: Provider.value(
                    value: store,
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (ctx, idx) => TodoCell(todos[idx]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodoCell extends HookWidget {
  final Todo todo;

  TodoCell(this.todo);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store<AppState, Action>>(context);
    final controller = useTextEditingController();

    controller.text = todo.text;
    controller.selection =
        TextSelection.fromPosition(TextPosition(offset: todo.text.length));

    return Dismissible(
      key: Key(todo.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (dir) {
        if (dir == DismissDirection.endToStart) {
          store.dispatch(Delete(todo.id));
        }
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: AppTextField(
              controller: controller,
              onChanged: (val) {
                store.dispatch(Update(todo..text = val));
              },
            ),
          ),
          Checkbox(
            value: todo.completed,
            onChanged: (val) {
              store.dispatch(Complete(todo.id));
            },
          )
        ],
      ),
    );
  }
}
