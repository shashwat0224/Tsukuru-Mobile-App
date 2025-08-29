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
          size: 12,
          color: Colors.black,
        ),
        elevation: 4,
        padding: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
