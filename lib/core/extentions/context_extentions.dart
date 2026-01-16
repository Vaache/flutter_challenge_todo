import 'package:flutter/material.dart';

extension ContextExtentions on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void showSnackBar(SnackBar snackBar) =>
      scaffoldMessenger.showSnackBar(snackBar);
}

/*
 SnackBar(
                width: MediaQuery.of(context).size.width * 0.5,
                content: Text(st.error.message),
                backgroundColor: UnKillColorPallet.red1,
                duration: const Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
              ),
 */