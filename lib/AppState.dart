import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import 'todos/model/todo.dart';
import 'package:json_annotation/json_annotation.dart';

part "AppState.g.dart";

@immutable
@JsonSerializable(explicitToJson: true)
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
        Todo(uuid.v4(), "item 4"),
        Todo(uuid.v4(), "item 5"),
        Todo(uuid.v4(), "item 6"),
        Todo(uuid.v4(), "item 7"),
        Todo(uuid.v4(), "item 8"),
        Todo(uuid.v4(), "item 9"),
        Todo(uuid.v4(), "item 10"),
        Todo(uuid.v4(), "item 11"),
        Todo(uuid.v4(), "item 12"),
        Todo(uuid.v4(), "item 13"),
        Todo(uuid.v4(), "item 14"),
        Todo(uuid.v4(), "item 15"),
      ]);

  @override
  String toString() {
    return 'AppState{todos: $todos}';
  }

  /// A necessary factory constructor for creating a new AppState instance
  /// from a map. Pass the map to the generated `_$AppStateFromJson()` constructor.
  /// The constructor is named after the source class, in this case, AppState.
  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$AppStateToJson`.
  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}
