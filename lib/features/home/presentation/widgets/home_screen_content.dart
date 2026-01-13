import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_challange/features/home/domain/models/todo.dart';
import 'package:todo_challange/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:todo_challange/features/home/presentation/read_todo/read_todo_screen.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ReadTodoScreen(todo: todo),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Dismissible(
          key: ValueKey<String>(todo.id),
          background: Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Icon(Icons.delete, color: Colors.white, size: 48),
          ),
          direction: DismissDirection.endToStart,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 27, horizontal: 45),
            decoration: BoxDecoration(
              color: getRandomColor(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              todo.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          onDismissed: (_) {
            context.read<TodoCubit>().removeTodo(todo.id);
          },
        ),
      ),
    );
  }

  Color getRandomColor() {
    final random = Random();

    final colors = [
      Color.fromRGBO(253, 153, 255, 1),
      Color.fromRGBO(255, 158, 158, 1),
      Color.fromRGBO(145, 244, 143, 1),
      Color.fromRGBO(255, 245, 153, 1),
      Color.fromRGBO(158, 255, 255, 1),
      Color.fromRGBO(182, 156, 255, 1),
    ];

    return colors[random.nextInt(colors.length - 1)];
  }
}
