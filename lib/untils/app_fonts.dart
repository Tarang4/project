import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle defaultTextStyle({
  fontWeight = FontWeight.w700,
  fontSize = 18.0,
  fontColors = Colors.black,
  fontFamily = "SF",
}) {
  return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColors,
      fontFamily: fontFamily);
}
