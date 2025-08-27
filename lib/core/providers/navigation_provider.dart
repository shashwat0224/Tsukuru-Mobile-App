import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsukuru/widgets/uihelper.dart';

class NaviagtionProvider extends ChangeNotifier {
  final BuildContext context;
  int selectedIndex;
  NaviagtionProvider({required this.context,this.selectedIndex = 0});
  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<AppExitResponse> exitPopUp() async {
    final result = await showDialog<AppExitResponse>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: UiHelper.customText(
            title: 'Exit Dialog',
            size: 18,
            color: Colors.black,
            fontFamily: 'Alata',
          ),
          content: UiHelper.customText(
            title: 'Are you sure you want to\nclose the application',
            size: 15,
            color: Colors.black,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: UiHelper.customText(
                title: 'No',
                size: 12,
                color: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                SystemNavigator.pop(animated: true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFB53145),
              ),
              child: UiHelper.customText(
                title: 'Yes',
                size: 12,
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    );
    return result ?? AppExitResponse.exit;
  }
}
