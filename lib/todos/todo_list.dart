import 'package:flutter/material.dart';

import 'model/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function onValueChanged;
  final Function onOrderChanged;

  const TodoList(
      {Key key, this.todos, this.onValueChanged, this.onOrderChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: _buildTodoRows(),
      onReorder: (int oldIndex, int newIndex) {
        onOrderChanged(todos[oldIndex], oldIndex, newIndex);
      },
    );
  }

  CheckboxListTile _buildTodoRow(Todo todo) {
    return CheckboxListTile(
        key: UniqueKey(),
        title: Text(todo.name),
        value: todo.done,
        onChanged: (complete) {
          onValueChanged(todo, complete);
        });
  }

  _buildTodoRows() {
    return todos.map((todo) => _buildTodoRow(todo)).toList();
  }
}
