import 'package:injectable/injectable.dart';
import 'package:todo_challange/core/services/preferences.dart';
import 'package:todo_challange/features/home/domain/models/todo.dart';

@Injectable()
class TodosService {
  final PreferencesService preferences;

  TodosService(this.preferences);

  static const todoKey = 'todos';
  static const todoListKey = 'todoList';

  Future<void> createTodo(Todo todo) async {
    final todosMap = await preferences.getJson('todos');

    if (todosMap == null) {
      await preferences.setJson(todoKey, {
        'todoList': [todo.toJson()],
      });

      return;
    }

    final todosList = todosMap[todoListKey] as List<dynamic>;

    final todos = todosList.map((todo) => Todo.fromJson(todo)).toList();

    final updateTodos = [...todos, todo];
    final todosJson = updateTodos.map((todo) => todo.toJson()).toList();
    final updateJson = {todoListKey: todosJson};
    await preferences.setJson(todoKey, updateJson);
  }

  Future<List<Todo>> getTodos() async {
    final todosMap = await preferences.getJson(todoKey);

    if (todosMap == null) return [];

    final todosList = todosMap[todoListKey] as List<dynamic>;

    final todos = todosList.map((todo) => Todo.fromJson(todo)).toList();

    return todos;
  }

  Future<void> removeTodoById(String id) async {
    final todosMap = await preferences.getJson('todos');

    if (todosMap == null) {
      return;
    }

    final todosList = todosMap[todoListKey] as List<dynamic>;

    final todos = todosList.map((todo) => Todo.fromJson(todo)).toList();

    todos.removeWhere((todo) => todo.id == id);
    final todosJson = todos.map((todo) => todo.toJson()).toList();
    final updateJson = {todoListKey: todosJson};
    await preferences.setJson(todoKey, updateJson);
  }

  Future<void> updateTodoById(String id, Todo todo) async {
    final todosMap = await preferences.getJson('todos');

    if (todosMap == null) {
      return;
    }

    final todosList = todosMap[todoListKey] as List<dynamic>;

    final todos = todosList.map((todo) => Todo.fromJson(todo)).toList();

    final updateTodos = todos.map((td) {
      if (td.id == todo.id) {
        return todo;
      }
      return td;
    }).toList();
     final todosJson = updateTodos.map((td) => td.toJson()).toList();
    final updateJson = {todoListKey: todosJson};
    await preferences.setJson(todoKey, updateJson);
  }
}
