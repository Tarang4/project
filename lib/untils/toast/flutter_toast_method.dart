import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMethod{
  static  simpleToast(
      { BuildContext? context, @required String? massage}){
    Fluttertoast.showToast(
        msg:massage.toString(),
        backgroundColor: Colors.green.withOpacity(0.7),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }
}