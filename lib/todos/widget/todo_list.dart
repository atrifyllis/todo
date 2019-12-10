import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/todos/widget/AddItemTextField.dart';

import '../model/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function onValueChanged;
  final Function onOrderChanged;
  final Function onItemAdded;
  final Function onItemDeleted;


  const TodoList(
      {Key key, this.todos, this.onValueChanged, this.onOrderChanged, this.onItemAdded, this.onItemDeleted})
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

  Row _buildTodoRow(Todo todo, BuildContext context) {
    return Row(
      key: UniqueKey(),
      children: <Widget>[
        Icon(Icons.drag_handle,color: Theme.of(context).primaryColor,),
        Checkbox(value: todo.done, onChanged: (complete) {
          onValueChanged(todo, complete);
        },),
        Text(todo.name),
        Spacer(),
        IconButton(
            color: Theme.of(context).errorColor,
            highlightColor: Theme.of(context).accentColor,
            splashColor: Theme.of(context).accentColor,
            icon: Icon(Icons.delete),
            onPressed: () {
              onItemDeleted(todo.id);
            }),
      ],
    );
  }

  List<Row> _buildTodoRows(BuildContext context) {
    return todos.map((todo) => _buildTodoRow(todo, context)).toList();
  }
}
