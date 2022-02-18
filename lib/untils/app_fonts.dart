import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle defaultTextStyle({
  fontWeight = FontWeight.w700,
  fontSize = 18.0,
  fontColors = Colors.black,
  fontFamily = "SF",
  height=1.0,
  wordSpacing=0.1,
}) {
  return TextStyle(
      wordSpacing: wordSpacing,
      fontWeight: fontWeight,
      fontSize: fontSize,
height: height,
      color: fontColors,
      fontFamily: fontFamily);
}
