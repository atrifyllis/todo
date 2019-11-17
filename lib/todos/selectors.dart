import '../AppState.dart';
import 'model/todo.dart';

List<Todo> todosSelector(AppState state) => state.todos;
