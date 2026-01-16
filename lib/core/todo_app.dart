import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_challange/core/constants/app_colors.dart';
import 'package:todo_challange/di/di.dart';
import 'package:todo_challange/features/home/domain/todo_repository.dart';
import 'package:todo_challange/features/home/presentation/create_todo/create_todo_screen.dart';
import 'package:todo_challange/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:todo_challange/features/home/presentation/home_screen.dart';
import 'package:todo_challange/features/home/presentation/read_todo/read_todo_screen.dart';
import 'package:todo_challange/features/home/presentation/search_todo/searc_todo_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TodoCubit(serviceLocator<TodoRepository>()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: appBackgroungColor,
          appBarTheme: AppBarTheme(
            backgroundColor: appBackgroungColor,
            scrolledUnderElevation: 0.0,
          ),
        ),
        routes: {
          '/': (_) => HomeScreen(),
          'create_todo': (_) => CreateTodoScreen(),
          'redact_todo': (_) => ReadTodoScreen(),
          'search_todo': (_) => SearcTodoScreen(),
        },
      ),
    );
  }
}
