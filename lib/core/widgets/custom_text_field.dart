import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.style,
    this.hintText,
    this.hintStyle,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      maxLines: null,
      readOnly: readOnly,
      controller: controller,
      style: style,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
