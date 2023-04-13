import 'package:flutter/material.dart';

class ColorManager {
  static Color splash = Hexcolor.fromHex('#1D1D4E');
  static Color textFieldGreyBackround = Hexcolor.fromHex('#F4F4FF');
  static Color textColor = Hexcolor.fromHex('#090937');
  static Color textAndButtonPurple = Hexcolor.fromHex('#6251DD');
  static Color textGreyOpacity40 = Hexcolor.fromHex('#09093766');
  static Color textGreyOpacity60 = Hexcolor.fromHex('#09093799');
  static Color orangeButtonColor = Hexcolor.fromHex('#EF6B4A');
  static Color whiteBackroundColor = Hexcolor.fromHex('#EF6B4A');


  //new colors

  static Color primaryDark = Hexcolor.fromHex('7D2053');
  static Color grey1 = Hexcolor.fromHex('414141');
  static Color grey2 = Hexcolor.fromHex('49414B');
  static Color white = Hexcolor.fromHex('FFFFFF');
  static Color error = Hexcolor.fromHex('F90017'); //red
}

extension Hexcolor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; //8 char with opacity 100
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
