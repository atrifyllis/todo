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
          onOrderChanged: vm.onOrderChanged,
          onItemAdded: vm.onItemAdded,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Todo> todos;
  final Function(Todo, bool) onValueChanged;
  final Function(Todo, int, int) onOrderChanged;
  final Function(String) onItemAdded;

  _ViewModel(
      {@required this.todos,
      @required this.onValueChanged,
      this.onOrderChanged,
      this.onItemAdded});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        todos: todosSelector(store.state),
        onValueChanged: (todo, complete) {
          store.dispatch(
            TodoUpdatedAction(todo.id, complete),
          );
        },
        onOrderChanged: (todo, oldIndex, newIndex) {
          store.dispatch(TodoOrderChangedAction(todo.id, oldIndex, newIndex));
        },
        onItemAdded: (itemText) {
          store.dispatch(ItemAddedAction(itemText));
        });
  }
}
