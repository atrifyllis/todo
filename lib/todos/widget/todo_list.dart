import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/todos/widget/AddItemTextField.dart';

import '../model/todo.dart';
import 'todo_row.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function onValueChanged;
  final Function onOrderChanged;
  final Function onItemAdded;
  final Function onItemDeleted;
  final Function onItemEdited;


  const TodoList(
      {Key key, this.todos, this.onValueChanged, this.onOrderChanged, this.onItemAdded, this.onItemDeleted, this.onItemEdited})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ReorderableListView(
            children: _buildTodoRows(context),
            onReorder: (int oldIndex, int newIndex) {
              onOrderChanged(todos[oldIndex], oldIndex, newIndex);
            },
          ),
        ),
        AddItemTextField(onItemAdded)
      ],
    );
  }


  List<TodoRow> _buildTodoRows(BuildContext context) {
    return todos.map((todo) =>
    new TodoRow(
      key: GlobalKey(),
      onValueChanged: onValueChanged,
      onItemDeleted: onItemDeleted,
      onItemEdited: onItemEdited,
      todo: todo,)).toList();
  }
}


