import 'package:hooks_examples/todo/todo.dart';

abstract class Action {}

class ResetAction extends Action {
  final List<Todo> todos;

  ResetAction(this.todos);
}

class AddAction extends Action {
  final Todo todo;

  AddAction(this.todo);
}

class CompleteTodo extends Action {
  final int id;

  CompleteTodo(this.id);
}

class UpdateTodo extends Action {
  final Todo todo;

  UpdateTodo(this.todo);
}

class DeleteAction extends Action {
  final int id;

  DeleteAction(this.id);
}
