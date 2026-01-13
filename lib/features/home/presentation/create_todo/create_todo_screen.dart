import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_challange/core/widgets/app_ovelay_button.dart';
import 'package:todo_challange/core/widgets/info_overlay_card.dart';
import 'package:todo_challange/features/home/presentation/create_todo/widgets/create_todo_app_bar.dart';
import 'package:todo_challange/features/home/presentation/create_todo/widgets/create_todo_inputs_section.dart';
import 'package:todo_challange/features/home/domain/models/todo.dart';
import 'package:todo_challange/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:uuid/uuid.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateTodoAppBar(
        onTapBack: () {
          if (_titleController.text.isEmpty &&
              _descriptionController.text.isEmpty) {
            Navigator.of(context).pop();
            return;
          }

          _overlayEntry = OverlayEntry(
            builder: (overlayContext) {
              return InfoOverlay(
                onTap: _hideOverlay,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.info, size: 36, color: Colors.grey),
                    Text(
                      'Are your sure you want discard your changes ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      spacing: 35,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppOvelayButton(
                          buttonColor: Colors.red,
                          text: 'Discard',
                          onTap: () {
                            _hideOverlay();
                            Navigator.of(context).pop();
                          },
                        ),
                        AppOvelayButton(
                          buttonColor: Colors.green,
                          text: 'Keep',
                          onTap: _hideOverlay,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );

          Overlay.of(context).insert(_overlayEntry!);
        },
        onTapSave: () {
          if (_titleController.text.isEmpty &&
              _descriptionController.text.isEmpty) {
            return;
          }

          _overlayEntry = OverlayEntry(
            builder: (overlayContext) {
              return InfoOverlay(
                onTap: _hideOverlay,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.info, size: 36, color: Colors.grey),
                    Text(
                      'Save changes ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      spacing: 35,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppOvelayButton(
                          buttonColor: Colors.red,
                          text: 'Discard',
                          onTap: _hideOverlay,
                        ),
                        AppOvelayButton(
                          buttonColor: Colors.green,
                          text: 'Save',
                          onTap: () {
                            final uuid = Uuid().v1();
                            final todo = Todo(
                              title: _titleController.text,
                              description: _descriptionController.text,
                              id: uuid,
                            );

                            context.read<TodoCubit>().addTodo(todo);
                            _hideOverlay();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );

          Overlay.of(context).insert(_overlayEntry!);
        },
      ),
      body: CreateTodoInputsSection(
        titleController: _titleController,
        descriptionController: _descriptionController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
  }
}
