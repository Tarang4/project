import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/config/FireStore_string.dart';
import 'package:untitled/config/firebaseString.dart';
import 'package:untitled/config/local_storage.dart';
import 'package:untitled/untils/loading_dialog/dialog.dart';

import '../../untils/toast/flutter_toast_method.dart';

class GetUserById {
  static Future getUserData(
      {@required BuildContext? context, @required String? userId}) async {
    // showLoadingDialog(context: context);

    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    DocumentSnapshot documentSnapshot = await firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(userId!)
        .get();
    print("data is ${documentSnapshot[LocalStorage.email]}");
    if (documentSnapshot[LocalStorage.userId] != null) {

      print("data is ${documentSnapshot.data()}");
      // hideLoadingDialog(context: context);
      return documentSnapshot;
    } else {
      ToastMethod.simpleToast(massage: "No data");

      // hideLoadingDialog(context: context);
      return null;
    }
  }
}
