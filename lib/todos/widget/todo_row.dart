import 'package:flutter/material.dart';
import 'package:todo/todos/model/todo.dart';
import 'package:todo/todos/widget/AddItemTextField.dart';

class TodoRow extends StatefulWidget {
  const TodoRow({
    Key key,
    @required this.todo,
    @required this.onValueChanged,
    @required this.onItemDeleted,
    @required this.onItemEdited,
  }) : super(key: key);

  final Todo todo;
  final Function onValueChanged;
  final Function onItemDeleted;
  final Function onItemEdited;

  @override
  _TodoRowState createState() => _TodoRowState();
}

class _TodoRowState extends State<TodoRow> {
  TextEditingController _textEditingController;

  FocusNode editFieldFocusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.todo.name);
    editFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    editFieldFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      key: UniqueKey(),
      children: <Widget>[
        Icon(
          Icons.drag_handle,
          color: Theme
              .of(context)
              .primaryColor,
        ),
        Checkbox(
          value: widget.todo.done,
          onChanged: (complete) {
            widget.onValueChanged(widget.todo, complete);
          },
        ),
//        widget.todo.editing
//            ?
        Expanded(
            child: TextField(
//              enabled: widget.todo.editing,
                focusNode: editFieldFocusNode,
                controller: _textEditingController,
//                onTap: () {
//                  widget.onItemEditing(widget.todo.id);
//                },
                onEditingComplete: () {
                  widget.onItemEdited(
                      widget.todo, _textEditingController.text);
//                  _textEditingController.clear();
                  FocusScope.of(context).unfocus();
                }))
//            : FlatButton(
//                child: Text(widget.todo.name),
//                onPressed: () {
//                  widget.onItemEditing(widget.todo.id);
//                  FocusScope.of(context).requestFocus(editFieldFocusNode);
//                },
//              )
              ,
        Spacer(),
        IconButton(
            color: Theme
                .of(context)
                .errorColor,
            highlightColor: Theme
                .of(context)
                .accentColor,
            splashColor: Theme
                .of(context)
                .accentColor,
            icon: Icon(Icons.delete),
            onPressed: () {
              widget.onItemDeleted(widget.todo.id);
            }),
      ],
    );
  }
}
