// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.


// We create the State reducer by combining many smaller reducers into one!
import 'AppState.dart';
import 'todos/todos_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    todos: todosReducer(state.todos, action),
  );
}
