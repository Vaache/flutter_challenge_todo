import 'package:todo_challange/features/home/domain/models/todo.dart';

abstract class TodoDataSource {
  Future<List<Todo>> getTodos();
  Future<void> createTodo(Todo todo);
  Future<void> removeTodoById(String id);
  Future<void> updateTodoById(String id, Todo todo);
}
