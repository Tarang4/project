import 'package:flutter/material.dart';
import 'package:untitled/config/app_colors.dart';

void showLoadingDialog({
  @required BuildContext? context,
}) {
  Future.delayed(const Duration(seconds: 0), () {
    showDialog(
        context: context!,
        barrierColor: colorTransparent,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: Material(
              color: colorTransparent,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: colorGreen.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(colorGreen),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Loading ...", style: TextStyle(color: colorWhite, fontSize: 18)),
                  ],
                ),
              ),
            ),
          );
        });
  });
}

void hideLoadingDialog({@required BuildContext? context}) {
  Navigator.pop(context!, false);
}