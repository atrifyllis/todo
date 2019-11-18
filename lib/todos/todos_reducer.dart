// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:redux/redux.dart';

import 'actions.dart';
import 'model/todo.dart';

final todosReducer = combineReducers<List<Todo>>([
  TypedReducer<List<Todo>, TodosLoadedAction>(_setLoadedTodos),
  TypedReducer<List<Todo>, TodosNotLoadedAction>(_setNoTodos),
  TypedReducer<List<Todo>, TodoUpdatedAction>(_setUpdatedTodo),
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
          ? Todo(todo.id, todo.name, done: action.done)
          : todo)
      .toList();
}
