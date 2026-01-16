import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_challange/core/services/todos_service.dart';
import 'package:todo_challange/features/home/data/data_source/todo_data_source.dart';
import 'package:todo_challange/features/home/domain/models/todo.dart';

@Injectable(as: TodoDataSource)
class TodoDataSourceImpl implements TodoDataSource {
  final TodosService todosService;

  const TodoDataSourceImpl(this.todosService);
  @override
  Future<void> createTodo(Todo todo) async {
    try {
      await todosService.createTodo(todo);
    } catch (e) {
      debugPrint('Create todo error $e');
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      return await todosService.getTodos();
    } catch (e) {
      debugPrint('Get Todos error $e');
      return [];
    }
  }

  @override
  Future<void> removeTodoById(String id) async {
    try {
      await todosService.removeTodoById(id);
    } catch (e) {
      debugPrint('Remove todo error $e');
    }
  }

  @override
  Future<void> updateTodoById(String id, Todo todo) async {
    try {
      await todosService.updateTodoById(id, todo);
    } catch (e) {
      debugPrint('update todo error $e');
    }
  }
}
