import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import 'todos/model/todo.dart';

@immutable
class AppState {
  static Uuid uuid = Uuid();
  final List<Todo> todos;

  AppState({this.todos = const []});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          todos == other.todos;

  @override
  int get hashCode => todos.hashCode;

  factory AppState.mock() => AppState(todos: [
        Todo(uuid.v4(), "item1"),
        Todo(uuid.v4(), "item 2"),
        Todo(uuid.v4(), "item 3"),
      ]);

  @override
  String toString() {
    return 'AppState{todos: $todos}';
  }


}
