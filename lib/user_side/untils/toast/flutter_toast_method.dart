import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMethod{
  static  simpleToast(
      { BuildContext? context, @required String? massage}){
    Fluttertoast.showToast(
        msg:massage.toString(),
        backgroundColor: Colors.black12.withOpacity(0.5),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }
}