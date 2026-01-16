import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_challange/core/extentions/context_extentions.dart';
import 'package:todo_challange/core/widgets/app_ovelay_button.dart';
import 'package:todo_challange/core/widgets/custom_text_field.dart';
import 'package:todo_challange/core/widgets/info_overlay_card.dart';
import 'package:todo_challange/features/home/domain/models/todo.dart';
import 'package:todo_challange/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:todo_challange/features/home/presentation/read_todo/widgets/read_todo_appbar.dart';

class ReadTodoScreen extends StatefulWidget {
  const ReadTodoScreen({super.key, this.todo});

  final Todo? todo;

  @override
  State<ReadTodoScreen> createState() => _ReadTodoScreenState();
}

class _ReadTodoScreenState extends State<ReadTodoScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final ValueNotifier<bool> _isRedact;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();

    _isRedact = ValueNotifier(false);
    _titleController = TextEditingController(text: widget.todo!.title);
    _descriptionController = TextEditingController(
      text: widget.todo!.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.todo == null) {
      Navigator.of(context).pop();
      return SizedBox();
    }
    return Scaffold(
      appBar: ReadTodoAppbar(
        isRedact: _isRedact,
        onTapBack: _showDiscarOrKeepOverlay,
        onTapRedact: () {
          _isRedact.value = true;
        },
        onTapSave: _showSaveOverlay,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 27.0, right: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            ValueListenableBuilder(
              valueListenable: _isRedact,
              builder: (context, isRedact, child) {
                return CustomTextField(
                  readOnly: !isRedact,
                  controller: _titleController,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                );
              },
            ),

            SizedBox(height: 27),
            Expanded(
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ValueListenableBuilder(
                    valueListenable: _isRedact,
                    builder: (context, isRedact, child) {
                      return CustomTextField(
                        readOnly: !isRedact,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        controller: _descriptionController,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDiscarOrKeepOverlay() {
    if (_titleController.text.isEmpty && _descriptionController.text.isEmpty) {
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
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Are your sure you want discard your changes ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
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
  }

  void _showSaveOverlay() {
    if (!_validateInputs()) return;

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
                      context.read<TodoCubit>().updateTodo(
                        widget.todo!.id,
                        widget.todo!.copyWith(
                          title: _titleController.text,
                          description: _descriptionController.text,
                        ),
                      );
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
  }

  bool _validateInputs() {
    if (_titleController.text.isEmpty && _descriptionController.text.isEmpty) {
      context.showSnackBar(
        SnackBar(
          width: MediaQuery.of(context).size.width * 0.5,
          content: Text('The title and description must not be empty.'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    } else if (_titleController.text.isEmpty) {
      context.showSnackBar(
        SnackBar(
          width: MediaQuery.of(context).size.width * 0.5,
          content: Text('The title must not be empty.'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    } else if (_descriptionController.text.isEmpty) {
      context.showSnackBar(
        SnackBar(
          width: MediaQuery.of(context).size.width * 0.5,
          content: Text('The description must not be empty.'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    }

    return true;
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
  }

  @override
  void dispose() {
    super.dispose();

    _isRedact.dispose();
  }
}
