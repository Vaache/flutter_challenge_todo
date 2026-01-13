import 'package:flutter/material.dart';
import 'package:todo_challange/core/constants/app_colors.dart';
import 'package:todo_challange/core/constants/app_sizes.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: buttonBackgroundColor,
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
