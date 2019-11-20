import 'package:flutter/material.dart';
import 'package:todo/todos/AddItemTextField.dart';

import 'model/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function onValueChanged;
  final Function onOrderChanged;
  final Function onItemAdded;


  const TodoList(
      {Key key,
      this.todos,
      this.onValueChanged,
      this.onOrderChanged,
      this.onItemAdded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ReorderableListView(
            children: _buildTodoRows(),
            onReorder: (int oldIndex, int newIndex) {
              onOrderChanged(todos[oldIndex], oldIndex, newIndex);
            },
          ),
        ),
        AddItemTextField(onItemAdded)
      ],
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

  List<CheckboxListTile> _buildTodoRows() {
    return todos.map((todo) => _buildTodoRow(todo)).toList();
  }
}
