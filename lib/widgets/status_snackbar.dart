import 'package:flutter/material.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class SnackbarService {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void show(String message, Color color) {
    final messenger = messengerKey.currentState;
    messenger?.clearSnackBars();
    messenger?.showSnackBar(
      SnackBar(
        content: UiHelper.customText(
          title: message,
          size: 18,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        elevation: 4,
        padding: EdgeInsets.all(8.0),
        width: 100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
