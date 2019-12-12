// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

import 'actions.dart';
import 'todo.dart';

final todosReducer = combineReducers<List<Todo>>([
  TypedReducer<List<Todo>, TodosLoadedAction>(_setLoadedTodos),
  TypedReducer<List<Todo>, TodosNotLoadedAction>(_setNoTodos),
  TypedReducer<List<Todo>, TodoUpdatedAction>(_setUpdatedTodo),
  TypedReducer<List<Todo>, TodoOrderChangedAction>(_setOrderChangedTodo),
  TypedReducer<List<Todo>, ItemAddedAction>(_setItemAdded),
  TypedReducer<List<Todo>, ItemDeletedAction>(_setItemDeleted),
]);

List<Todo> _setLoadedTodos(List<Todo> todos, TodosLoadedAction action) {
  return action.todos;
}

List<Todo> _setNoTodos(List<Todo> todos, TodosNotLoadedAction action) {
  return [];
}

List<Todo> _setUpdatedTodo(List<Todo> todos, TodoUpdatedAction action) {
  return todos
      .map((todo) => todo.id == action.id
          ? Todo(todo.id, action.name, done: action.done, editing: false)
          : todo)
      .toList();
}

List<Todo> _setOrderChangedTodo(
    List<Todo> todos, TodoOrderChangedAction action) {
  List<Todo> oldTodos = List.from(todos);
  var oldIndex = action.oldIndex;
  var newIndex = action.newIndex;
  if (oldIndex < newIndex) {
    // removing the item at oldIndex will shorten the list by 1.
    newIndex -= 1;
  }
  final Todo movedTodo = oldTodos.removeAt(oldIndex);
  oldTodos.insert(newIndex, movedTodo);
  return oldTodos;
}

List<Todo> _setItemAdded(List<Todo> todos, ItemAddedAction action) {
  return List.from(todos)..add(Todo(Uuid().v4(), action.itemText));
}

List<Todo> _setItemDeleted(List<Todo> todos, ItemDeletedAction action) {
  return todos.where((todo) => todo.id != action.todoId).toList();
}
