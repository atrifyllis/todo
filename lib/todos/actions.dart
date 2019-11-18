import 'model/todo.dart';

class TodosLoadedAction {
  final List<Todo> todos;

  TodosLoadedAction(this.todos);

  @override
  String toString() {
    return 'TodosLoadedAction{todos: $todos}';
  }
}

class TodosNotLoadedAction {}

class TodoUpdatedAction {
  final String id;
  final bool done;

  TodoUpdatedAction(this.id, this.done);

  @override
  String toString() {
    return 'UpdateTodoAction{id: $id, done: $done}';
  }
}
