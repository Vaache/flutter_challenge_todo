import 'package:flutter/material.dart';

class AppOvelayButton extends StatelessWidget {
  const AppOvelayButton({super.key, required this.buttonColor, required this.text, required this.onTap});
  final Color buttonColor;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 28),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
