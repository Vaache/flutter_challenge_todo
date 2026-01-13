import 'package:flutter/material.dart';
import 'package:todo_challange/core/widgets/app_button.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    super.key,
    required this.onTapSearch,
    required this.onTapInfo,
  });

  final VoidCallback onTapSearch;
  final VoidCallback onTapInfo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Notes',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 43,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 21),
          child: AppButton(icon: (Icons.search), onTap: onTapSearch),
        ),
        Padding(
          padding: EdgeInsets.only(right: 25),
          child: AppButton(
            icon: (Icons.info_outline_rounded),
            onTap: onTapInfo,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
