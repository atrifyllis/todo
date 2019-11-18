import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../AppState.dart';
import 'actions.dart';
import 'model/todo.dart';
import 'selectors.dart';
import 'todo_list.dart';

class TodoListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return TodoList(
          todos: vm.todos,
          onValueChanged: vm.onValueChanged,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Todo> todos;
  final Function(Todo, bool) onValueChanged;

  _ViewModel({@required this.todos, @required this.onValueChanged});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      todos: todosSelector(store.state),
      onValueChanged: (todo, complete) {
        store.dispatch(
          TodoUpdatedAction(todo.id, complete),
        );
      },
    );
  }
}
