import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class ToastMessage {

  static successToast({@required BuildContext? context, @required String? description}) {
    FocusScope.of(context!).unfocus();
    MotionToast.success(
      title: "Success",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      description: description!,
      descriptionStyle: const TextStyle(fontSize: 12),
      // layoutOrientation: ORIENTATION.RTL,
      animationType: ANIMATION.FROM_LEFT,
      width: MediaQuery.of(context).size.width/1.2,
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }

  static errorToast({@required BuildContext? context, @required String? description}) {
    FocusScope.of(context!).unfocus();
    MotionToast.error(
      title: "Error",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      description: description!,
      animationType: ANIMATION.FROM_LEFT,
      toastDuration: const Duration(seconds: 3),
      width: MediaQuery.of(context).size.width/1.2,
    ).show(context);
  }

  static warningToast({@required BuildContext? context, @required String? description}) {
    FocusScope.of(context!).unfocus();
    MotionToast.warning(
      title: "Warning",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      description: description!,
      descriptionStyle: const TextStyle(fontSize: 12),
      // layoutOrientation: ORIENTATION.RTL,
      animationType: ANIMATION.FROM_LEFT,
      width: MediaQuery.of(context).size.width/1.2,
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }
}