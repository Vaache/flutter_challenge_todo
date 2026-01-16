import 'package:injectable/injectable.dart';
import 'package:todo_challange/features/home/data/data_source/todo_data_source.dart';
import 'package:todo_challange/features/home/domain/models/todo.dart';
import 'package:todo_challange/features/home/domain/todo_repository.dart';

@Injectable(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource todoDataSource;

  TodoRepositoryImpl(this.todoDataSource);

  @override
  Future<void> createTodo(Todo todo) async {
    await todoDataSource.createTodo(todo);
  }

  @override
  Future<List<Todo>> getTodos() async {
    return await todoDataSource.getTodos();
  }

  @override
  Future<void> removeTodoById(String id) async {
    await todoDataSource.removeTodoById(id);
  }

  @override
  Future<void> updateTodoById(String id, Todo todo) async {
    await todoDataSource.updateTodoById(id, todo);
  }
}
