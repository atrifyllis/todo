import 'package:json_annotation/json_annotation.dart';
import 'todo.dart';

part 'actions.g.dart';

@JsonSerializable()
class TodosLoadedAction {
  final List<Todo> todos;

  TodosLoadedAction(this.todos);

  @override
  String toString() {
    return 'TodosLoadedAction{todos: $todos}';
  }
}

@JsonSerializable()
class TodosNotLoadedAction {}

@JsonSerializable()
class TodoUpdatedAction {
  final String id;
  final bool done;

  TodoUpdatedAction(this.id, this.done);

  @override
  String toString() {
    return 'UpdateTodoAction{id: $id, done: $done}';
  }
}

@JsonSerializable()
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

@JsonSerializable()
class ItemAddedAction {
  final String itemText;

  ItemAddedAction(this.itemText);

  @override
  String toString() {
    return 'ItemAddedAction{itemText: $itemText}';
  }
}

class ItemDeletedAction {
  final String todoId;

  ItemDeletedAction(this.todoId);

  @override
  String toString() {
    return 'ItemDeletedAction{todoId: $todoId}';
  }


}
