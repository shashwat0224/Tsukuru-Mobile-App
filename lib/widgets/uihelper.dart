import 'package:flutter/material.dart';

class UiHelper {
  static Image customImage({required String img}) {
    return Image.asset('assets/images/$img');
  }

  static Text customText({
    required String title,
    required double size,
    required Color color,
    FontWeight? fontWeight,
    String? fontFamily,
    TextAlign? textAlign,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: fontFamily ?? "Merriweather",
        fontWeight: fontWeight ?? FontWeight.bold,
        fontSize: size,
        color: color,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }

  static Row customHeaderText({
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
            fontFamily: "Alata",
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
