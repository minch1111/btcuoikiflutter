import 'package:flutter/material.dart';

const kColorPrimary = Color(0xFFCDDFF7);
const kColorText = Color(0xFF00BCD4);
const kColorWarning = Colors.amber;

class PrimaryFont {
  static String fontFamily = 'HelveticaNeue';

  static TextStyle thin(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w100,
      fontSize: size
    );
  }

  static TextStyle light(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: size
    );
  }

  static TextStyle medium(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: size
    );
  }

  static TextStyle bold(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: size
    );
  }
}

extension GetSize on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}