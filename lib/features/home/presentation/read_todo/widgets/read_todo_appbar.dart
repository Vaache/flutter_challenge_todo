import 'package:flutter/material.dart';
import 'package:todo_challange/core/constants/app_colors.dart';
import 'package:todo_challange/core/widgets/app_button.dart';

class ReadTodoAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ReadTodoAppbar({
    super.key,
    required this.onTapBack,
    required this.onTapRedact,
    required this.isRedact,
    required this.onTapSave,
  });

  final VoidCallback onTapBack;
  final VoidCallback onTapRedact;
  final VoidCallback onTapSave;
  final ValueNotifier isRedact;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isRedact,
      builder: (context, value, child) {
        return AppBar(
          leading: GestureDetector(
            onTap: !isRedact.value ? Navigator.of(context).pop : onTapBack,

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
            value
                ? Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: AppButton(icon: (Icons.save), onTap: onTapSave),
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: AppButton(
                      icon: (Icons.edit_outlined),
                      onTap: onTapRedact,
                    ),
                  ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
