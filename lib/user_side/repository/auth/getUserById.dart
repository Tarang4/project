import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../config/FireStore_string.dart';
import '../../config/Localstorage_string.dart';
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
    print("data is ${documentSnapshot[LocalStorageKey.email]}");
    if (documentSnapshot[LocalStorageKey.userId] != null) {

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
