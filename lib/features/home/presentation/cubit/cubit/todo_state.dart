part of 'todo_cubit.dart';

enum ToDoStateEnum { initial, loading, loaded, failure }

class TodoState {
  final ToDoStateEnum status;
  final List<Todo> todos;
  final List<Todo> filteredTodos;

  TodoState({
    this.status = ToDoStateEnum.initial,
    required this.todos,
    required this.filteredTodos,
  });

  TodoState copyWith({ToDoStateEnum? status, List<Todo>? todos, List<Todo>? filteredTodos}) {
    return TodoState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }
}
