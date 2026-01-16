import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_challange/features/home/domain/models/todo.dart';
import 'package:todo_challange/features/home/domain/todo_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(this.todoRepository)
    : super(TodoState(todos: const [], filteredTodos: const [])) {
    loadData();
  }

  final TodoRepository todoRepository;

  Future<void> loadData() async {
    emit(state.copyWith(status: .loading));
    try {
      final todos = await todoRepository.getTodos();
      emit(state.copyWith(status: .loaded, todos: todos));
    } catch (e) {
      emit(state.copyWith(status: .failure));
    }
  }

  Future<void> createTodo(Todo todo) async {
    emit(state.copyWith(status: .loading));

    try {
      await todoRepository.createTodo(todo);

      final todos = await todoRepository.getTodos();

      emit(state.copyWith(status: .loaded, todos: todos));
    } catch (e) {
      emit(state.copyWith(status: .failure));
    }
  }

  Future<void> removeTodo(String id) async {
    emit(state.copyWith(status: .loading));

    try {
      await todoRepository.removeTodoById(id);
      final todos = await todoRepository.getTodos();

      emit(state.copyWith(status: .loaded, todos: todos));
    } catch (e) {
      emit(state.copyWith(status: .failure));
    }
  }

  Future<void> updateTodo(String id, Todo todo) async {
    emit(state.copyWith(status: .loading));

    try {
      await todoRepository.updateTodoById(id, todo);
      final todos = await todoRepository.getTodos();

      emit(state.copyWith(status: .loaded, todos: todos));
    } catch (e) {
      emit(state.copyWith(status: .failure));
    }
  }

  void searchTodo(String text) {
    emit(state.copyWith(status: .loading));

    final filteredTodos = state.todos.where((todo) {
      if (text.isNotEmpty &&
          todo.title.toLowerCase().contains(text.toLowerCase())) {
        return true;
      }

      return false;
    }).toList();

    emit(state.copyWith(status: .loaded, filteredTodos: filteredTodos));
  }

  void clearFlitereTodos() {
    emit(state.copyWith(status: .loaded, filteredTodos: []));
  }
}
