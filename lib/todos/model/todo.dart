class Todo {
  String name;
  bool done;

  Todo(this.name, {this.done = false});

  @override
  String toString() {
    return 'Todo{name: $name, done: $done}';
  }


}
