import 'package:flutter/material.dart';

import 'model/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function onValueChanged;

  const TodoList({Key key, this.todos, this.onValueChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildTodoRows(),
    );
  }

  CheckboxListTile _buildTodoRow(Todo todo) {
    return CheckboxListTile(
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
