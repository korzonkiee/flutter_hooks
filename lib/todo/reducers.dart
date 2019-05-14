import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/todo/actions.dart';
import 'package:hooks_examples/todo/state.dart';

Reducer<AppState, Action> appReducer = (state, action) {
  if (action is Add) {
    return new AppState(state.todos..add(action.todo));
  } else if (action is Delete) {
    return new AppState(state.todos
      ..removeWhere((todo) {
        return todo.id == action.id;
      }));
  } else if (action is Complete) {
    return new AppState(state.todos
      ..forEach((todo) {
        if (todo.id == action.id) {
          todo.completed = !todo.completed;
        }
      }));
  } else if (action is Update) {
    return new AppState(state.todos
      ..forEach((todo) {
        if (todo.id == action.todo.id) {
          todo.text = action.todo.text;
        }
      }));
  } else if (action is Reset) {
    return new AppState(action.todos);
  }

  return new AppState([]);
};
