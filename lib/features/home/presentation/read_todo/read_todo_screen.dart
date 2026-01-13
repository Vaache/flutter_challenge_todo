import 'package:flutter/material.dart';
import 'package:todo_challange/features/home/domain/models/todo.dart';
import 'package:todo_challange/features/home/presentation/read_todo/widgets/read_todo_appbar.dart';

class ReadTodoScreen extends StatefulWidget {
  const ReadTodoScreen({super.key, this.todo});

  final Todo? todo;

  @override
  State<ReadTodoScreen> createState() => _ReadTodoScreenState();
}

class _ReadTodoScreenState extends State<ReadTodoScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.todo == null) {
      Navigator.of(context).pop();
      return SizedBox();
    }
    return Scaffold(
      appBar: ReadTodoAppbar(
        onTapBack: Navigator.of(context).pop,
        onTapRedact: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              widget.todo!.title,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 27),
            Expanded(
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    widget.todo!.description,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
