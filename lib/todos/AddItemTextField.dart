import 'package:flutter/material.dart';

class AddItemTextField extends StatefulWidget {
  final Function onItemAdded;

  AddItemTextField(this.onItemAdded);

  @override
  _AddItemTextFieldState createState() => _AddItemTextFieldState();
}

class _AddItemTextFieldState extends State<AddItemTextField> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(labelText: "Add Item"),
            onEditingComplete: () {
              widget.onItemAdded(_textEditingController.text);
              _textEditingController.clear();
              FocusScope.of(context).unfocus();
            }
        ),
      )
    ]);
  }
}
