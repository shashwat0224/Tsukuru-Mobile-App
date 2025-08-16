import 'package:flutter/material.dart';

class UiHelper {
  static customImage({required String img}) {
    return Image.asset('assets/images/$img');
  }

  static customText({required String title, required double size, required Color color}) {
    return Text(title,style: TextStyle(fontFamily: "AmaticSC", fontWeight: FontWeight.bold, fontSize: size, color: color),);
  }
}
