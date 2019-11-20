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

class TodoOrderChangedAction {
  final String id;
  final int oldIndex;
  final int newIndex;

  TodoOrderChangedAction(this.id, this.oldIndex, this.newIndex);

  @override
  String toString() {
    return 'TodoOrderChangedAction{id: $id, oldIndex: $oldIndex, newIndex: $newIndex}';
  }
}

class ItemAddedAction {
  final String itemText;

  ItemAddedAction(this.itemText);

  @override
  String toString() {
    return 'ItemAddedAction{itemText: $itemText}';
  }
}
