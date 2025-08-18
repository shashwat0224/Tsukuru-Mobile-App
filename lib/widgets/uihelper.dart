import 'package:flutter/material.dart';

class UiHelper {
  static customImage({required String img}) {
    return Image.asset('assets/images/$img');
  }

  static customText({
    required String title,
    required double size,
    required Color color,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: "AmaticSC",
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color,
      ),
    );
  }

  static customHeaderText({
    required String title,
    required double size,
    required Color color,
  }) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: color,
            thickness: 4,
            endIndent: 10, // space between line and text
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: color,
            fontFamily: "AmaticSC",
          ),
        ),
        Expanded(
          child: Divider(
            color: color,
            thickness: 4,
            indent: 10, // space between text and line
          ),
        ),
      ],
    );
  }
}
