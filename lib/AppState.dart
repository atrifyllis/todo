import 'package:meta/meta.dart';

import 'todos/model/todo.dart';

@immutable
class AppState {
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
        Todo("item1"),
        Todo("item 2"),
        Todo("item 3"),
      ]);
}
