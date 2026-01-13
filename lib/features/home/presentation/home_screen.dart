import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_challange/core/constants/app_colors.dart';
import 'package:todo_challange/core/constants/app_images.dart';
import 'package:todo_challange/core/widgets/info_overlay_card.dart';
import 'package:todo_challange/features/home/presentation/create_todo/create_todo_screen.dart';
import 'package:todo_challange/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:todo_challange/features/home/presentation/search_todo/searc_todo_screen.dart';
import 'package:todo_challange/features/home/presentation/widgets/home_screen_app_bar.dart';
import 'package:todo_challange/features/home/presentation/widgets/home_screen_content.dart';
import 'package:todo_challange/features/home/presentation/widgets/info_overlay/info_overlay_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  OverlayEntry? _overlayEntry;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(
        onTapInfo: _showOverlay,
        onTapSearch: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  SearcTodoScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.status == ToDoStateEnum.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.status == ToDoStateEnum.failure) return SizedBox();
          return state.todos.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      Image.asset(emptyToDoPng),
                      Text(
                        'Create your first note !',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: state.todos.length,
                  padding: EdgeInsets.all(24),
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];

                    return HomeScreenContent(todo: todo);
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  CreateTodoScreen(),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
        backgroundColor: fapColor,
        elevation: 15,
        shape: CircleBorder(),
        foregroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (_) {
        return InfoOverlay(onTap: _hideOverlay, child: InfoOverlayContent());
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
