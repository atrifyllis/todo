import 'package:flutter/material.dart';

import 'todos/todo_list_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.devDrawerBuilder}) : super(key: key);

  final String title;
  final WidgetBuilder devDrawerBuilder;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: widget.devDrawerBuilder != null
          ? widget.devDrawerBuilder(context)
          : null,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'These are your Todos:',
            ),
            Expanded(
              child: TodoListContainer(),
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: null,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),
    );
  }
}
