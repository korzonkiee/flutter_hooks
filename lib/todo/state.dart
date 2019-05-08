import 'package:hooks_examples/todo/todo.dart';

class AppState {
  final List<Todo> todos;

  AppState(this.todos);
}

final initialState = new AppState([]);
