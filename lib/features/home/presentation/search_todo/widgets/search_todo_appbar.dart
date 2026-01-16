import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_challange/features/home/presentation/cubit/cubit/todo_cubit.dart';

class SearchTodoAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchTodoAppbar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function(String text) onChanged;

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey.withValues(alpha: .3)),
    );

    return AppBar(
      title: TextField(
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        controller: controller,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              context.read<TodoCubit>().clearFlitereTodos();
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close, color: Colors.white),
          ),
          hint: Text(
            'Search by the keyword...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Color.fromRGBO(204, 204, 204, 1),
            ),
          ),

          filled: true,
          fillColor: Colors.grey.withValues(alpha: .3),
          border: defaultBorder,
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
          focusedBorder: defaultBorder,
        ),
        onChanged: onChanged,
      ),
      automaticallyImplyActions: false,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
