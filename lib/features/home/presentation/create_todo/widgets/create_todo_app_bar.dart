import 'package:flutter/material.dart';
import 'package:todo_challange/core/constants/app_colors.dart';
import 'package:todo_challange/core/widgets/app_button.dart';

class CreateTodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreateTodoAppBar({
    super.key,
    required this.onTapBack,
    required this.onTapSave,
  });

  final VoidCallback onTapBack;
  final VoidCallback onTapSave;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: onTapBack,
        child: Transform.translate(
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
      ),

      actions: [
        Padding(
          padding: EdgeInsets.only(right: 21),
          child: AppButton(icon: (Icons.remove_red_eye_outlined), onTap: () {}),
        ),
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: AppButton(icon: (Icons.save_outlined), onTap: onTapSave),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
