import 'package:hooks_examples/todo/todo.dart';

abstract class Action {}

class Reset extends Action {
  final List<Todo> todos;

  Reset(this.todos);
}

class Add extends Action {
  final Todo todo;

  Add(this.todo);
}

class Complete extends Action {
  final int id;

  Complete(this.id);
}

class Update extends Action {
  final Todo todo;

  Update(this.todo);
}

class Delete extends Action {
  final int id;

  Delete(this.id);
}
