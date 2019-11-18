class Todo {
  final String id;
  final String name;
  final bool done;

  Todo(this.id, this.name, {this.done = false});

  @override
  String toString() {
    return 'Todo{id: $id, name: $name, done: $done}';
  }
}
