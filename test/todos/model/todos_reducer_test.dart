import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:todo/AppState.dart';
import 'package:todo/app_state_reducer.dart';
import 'package:todo/todos/model/actions.dart';
import 'package:todo/todos/model/selectors.dart';

const TODO_NAME_SAMPLE_1 = "Hallo";

main() {
  group('Todos Sate Reducer', () {
    test('should add new todo item on ItemAddedAction', () {
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.mock(),
      );

      store.dispatch(ItemAddedAction(TODO_NAME_SAMPLE_1));

      var todos = todosSelector(store.state);

      expect(todos, hasLength(16));
      expect(todos[15].name, equals(TODO_NAME_SAMPLE_1));
    });
  });
}
