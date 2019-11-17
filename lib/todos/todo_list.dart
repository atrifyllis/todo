import 'package:flutter/material.dart';

import 'model/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  const TodoList({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildTodoRows(),
    );
  }

  Row _buildTodoRow(Todo todo) {
    return Row(
      children: <Widget>[Text(todo.name)],
    );
  }

  _buildTodoRows() {
    return todos.map((todo) => _buildTodoRow(todo)).toList();
  }
}
