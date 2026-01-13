import 'package:flutter/material.dart';
import 'package:todo_challange/core/constants/app_colors.dart';
import 'package:todo_challange/core/constants/app_sizes.dart';

class InfoOverlay extends StatelessWidget {
  const InfoOverlay({super.key, required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final borderRadius = 20.0;
    final borderHorizontalPadding = 42.0;

    return Positioned.fill(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: overlayBackgroundColor.withValues(alpha: .2),
          child: Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: overlayHeight,
                width: screenWidth,
                margin: EdgeInsets.symmetric(
                  horizontal: borderHorizontalPadding,
                ),
                decoration: BoxDecoration(
                  color: appBackgroungColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
