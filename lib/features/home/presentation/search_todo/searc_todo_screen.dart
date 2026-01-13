import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_challange/core/constants/app_images.dart';
import 'package:todo_challange/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:todo_challange/features/home/presentation/read_todo/read_todo_screen.dart';
import 'package:todo_challange/features/home/presentation/search_todo/widgets/search_todo_appbar.dart';

class SearcTodoScreen extends StatefulWidget {
  const SearcTodoScreen({super.key});

  @override
  State<SearcTodoScreen> createState() => _SearcTodoScreenState();
}

class _SearcTodoScreenState extends State<SearcTodoScreen> {
  late final TextEditingController _serachController;

  @override
  void initState() {
    super.initState();
    _serachController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchTodoAppbar(
        controller: _serachController,
        onChanged: (text) {
          context.read<TodoCubit>().searchTodo(text);
        },
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (_serachController.text.isNotEmpty &&
              state.filteredTodos.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Image.asset(notFoundPng),
                  Text(
                    'Create your first note !',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: state.filteredTodos.length,
            padding: EdgeInsets.all(24),

            itemBuilder: (context, index) {
              final todo = state.filteredTodos[index];

              return GestureDetector(
                onTap: () {
                  context.read<TodoCubit>().clearFlitereTodos();
                  Navigator.of(context).pushReplacement(
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
                ),
              );
            },
          );
        },
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

  @override
  void dispose() {
    super.dispose();
    _serachController.clear();
    _serachController.dispose();
  }
}
