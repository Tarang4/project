import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMethod{
  static  simpleToast(
      { BuildContext? context, @required String? massage}){
    Fluttertoast.showToast(
        msg:massage.toString(),
        backgroundColor: Colors.white,
        textColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,);
  }
  static  simpleToastLightColor(
      { BuildContext? context, @required String? massage}){
    Fluttertoast.showToast(
      msg:massage.toString(),
      backgroundColor: Colors.black.withOpacity(0.5),
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,);
  }
  static  simpleToastLightColorCenter(
      { BuildContext? context, @required String? massage}){
    Fluttertoast.showToast(
      msg:massage.toString(),
      backgroundColor: Colors.black.withOpacity(0.5),
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,);
  }
  static  simpleToastTop(
      { BuildContext? context, @required String? massage}){
    Fluttertoast.showToast(
        msg:massage.toString(),
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1);
  }
}