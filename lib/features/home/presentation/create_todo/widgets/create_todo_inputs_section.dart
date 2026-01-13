import 'package:flutter/material.dart';

class CreateTodoInputsSection extends StatelessWidget {
  const CreateTodoInputsSection({super.key, required this.titleController, required this.descriptionController});

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          TextField(
            controller: titleController,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            maxLines: null,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),

            decoration: InputDecoration(
              hintText: 'Title',
              hintStyle: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(154, 154, 154, 1),
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
          SizedBox(height: 27),
          TextField(
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            maxLines: null,

            controller: descriptionController,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: 'Type something...',
              hintStyle: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(154, 154, 154, 1),
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
