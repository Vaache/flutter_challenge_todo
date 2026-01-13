import 'package:flutter/material.dart';
import 'package:todo_challange/core/constants/app_colors.dart';
import 'package:todo_challange/core/widgets/app_button.dart';

class ReadTodoAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ReadTodoAppbar({
    super.key,
    required this.onTapBack,
    required this.onTapRedact,
  });

  final VoidCallback onTapBack;
  final VoidCallback onTapRedact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapBack,
      child: AppBar(
        backgroundColor: appBackgroungColor,
        leading: Transform.translate(
          offset: Offset(28, 0),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: buttonBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
          ),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: AppButton(icon: (Icons.edit_outlined), onTap: onTapRedact),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
