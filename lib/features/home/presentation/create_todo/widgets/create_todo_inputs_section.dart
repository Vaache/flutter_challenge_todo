import 'package:flutter/material.dart';
import 'package:todo_challange/core/widgets/custom_text_field.dart';

class CreateTodoInputsSection extends StatelessWidget {
  const CreateTodoInputsSection({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

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
          CustomTextField(
            controller: titleController,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            hintText: 'Title',
            hintStyle: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(154, 154, 154, 1),
            ),
          ),
          SizedBox(height: 27),
          Expanded(
            child: CustomTextField(
              controller: descriptionController,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              hintText: 'Type something...',
              hintStyle: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(154, 154, 154, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
