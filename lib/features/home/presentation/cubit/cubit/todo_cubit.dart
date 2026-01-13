import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_challange/features/home/domain/models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState(todos: const [], filteredTodos: const [])) {
    loadData();
  }

  void loadData() {
    emit(state.copyWith(status: .loading));
    emit(state.copyWith(status: .loaded));
  }

  void addTodo(Todo todo) {
    emit(state.copyWith(status: .loading));

    final updateTodoList = [...state.todos, todo];

    emit(state.copyWith(status: .loaded, todos: updateTodoList));
  }

  void removeTodo(String id) {
    emit(state.copyWith(status: .loading));

    state.todos.removeWhere((todo) => todo.id == id);

    emit(state.copyWith(status: .loaded, todos: state.todos));
  }

  void searchTodo(String text) {
    emit(state.copyWith(status: .loading));

    final filteredTodos = state.todos.where((todo) {
      if (text.isNotEmpty && todo.title.toLowerCase().contains(text.toLowerCase())) return true;

      return false;
    }).toList();

    emit(state.copyWith(status: .loaded, filteredTodos: filteredTodos));
  }

  void clearFlitereTodos() {
    emit(state.copyWith(status: .loaded, filteredTodos: []));
  }
}
