import 'package:desafio/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomStyle {
  static Color colorPrimary = const Color(0xff00309A);
  static Color colorWhite = const Color(0xffffffff);
  static Color colorFontDefault = const Color(0xff000000);

  static TextStyle textStyleWhiteBtn = SoraStyle.regular
      .copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
}
