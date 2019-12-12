import 'package:json_annotation/json_annotation.dart';
part "todo.g.dart";
@JsonSerializable(explicitToJson: true)
class Todo {
  final String id;
  final String name;
  final bool done;
  final bool editing;

  Todo(this.id, this.name, {this.done = false, this.editing = false});


  @override
  String toString() {
    return 'Todo{id: $id, name: $name, done: $done, editing: $editing}';
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
