import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../model/selectors.dart';

import '../../AppState.dart';
import '../model/actions.dart';
import '../model/todo.dart';
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
          onItemDeleted: vm.onItemDeleted,
          onItemEdited: vm.onItemEdited,
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
  final Function(String) onItemDeleted;
  final Function(Todo, String) onItemEdited;

  _ViewModel(
      {@required this.todos,
      @required this.onValueChanged,
      this.onOrderChanged,
      this.onItemAdded,
      this.onItemDeleted,
      this.onItemEdited});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      todos: todosSelector(store.state),
      onValueChanged: (todo, complete) {
        store.dispatch(
          TodoUpdatedAction(todo.id, complete, todo.name),
        );
      },
      onOrderChanged: (todo, oldIndex, newIndex) {
        store.dispatch(TodoOrderChangedAction(todo.id, oldIndex, newIndex));
      },
      onItemAdded: (itemText) {
        store.dispatch(ItemAddedAction(itemText));
      },
      onItemDeleted: (todId) {
        store.dispatch(ItemDeletedAction(todId));
      },
      onItemEdited: (todo, name) {
        store.dispatch(TodoUpdatedAction(todo.id, todo.done, name));
      },
    );
  }
}
