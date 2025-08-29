import 'package:flutter/material.dart';

class NaviagtionProvider extends ChangeNotifier {
  int selectedIndex;
  NaviagtionProvider({this.selectedIndex = 0});
  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
