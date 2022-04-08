import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/user_side/modal/product_modal.dart';
import 'package:untitled/user_side/untils/toast/flutter_toast_method.dart';

import '../../main.dart';
import '../../user_side/config/FireStore_string.dart';
import '../../user_side/config/Localstorage_string.dart';
import '../modal/admin_product_modal.dart';
import 'package:intl/intl.dart';

class NotificationRepository {
  static notificationAdd({
    @required BuildContext? context,
    @required String? title,
    @required String? disc,
  }) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    DateTime dateTime = DateTime.now();

    final DateFormat formatter = DateFormat.yMMMMd('en_US');
    final DateFormat formatterTime = DateFormat.jm();

    final String date = formatter.format(dateTime);
    final String time = formatterTime.format(dateTime);

    CollectionReference notificationCollection = firebaseFirestore
        .collection((FirebaseString.adminCollection))
        .doc('rha4OKCNrwpPoDiDtTvq')
        .collection((FirebaseString.notificationCollection));
    String notificationId = notificationCollection.doc().id.toString();

    Map<String, dynamic> notificationData = <String, dynamic>{
      "notificationId": notificationId,
      "notificationTime": time.toString(),
      "notificationDate": date.toString(),
      "title": title,
      "description": disc,
    };

    await notificationCollection.doc().set(notificationData).whenComplete(() => Navigator.pop(context!));

    ToastMethod.simpleToast(massage: "Send Notification");


  }

  static deleteNotification({
    @required String? notificationId,
  }) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    CollectionReference notificationCollection = firebaseFirestore
        .collection((FirebaseString.adminCollection))
        .doc('rha4OKCNrwpPoDiDtTvq')
        .collection((FirebaseString.notificationCollection));
    if (notificationId != null) {
      notificationCollection
          .where("notificationId", isEqualTo: notificationId)
          .get()
          .then((value) {
        for (DocumentSnapshot ds in value.docs) {
          ds.reference.delete();
        }
        ToastMethod.simpleToast(massage: "Notification Delete Successfully");
        print("delete Notification");
      });
    }
  }

  List<ProductModalAdmin> getNotification() {
    ProductModalAdmin productModalAdmin = ProductModalAdmin();
    List<ProductModalAdmin> productList = [];
    FirebaseFirestore.instance
        .collection(FirebaseString.productCollection)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        productModalAdmin = ProductModalAdmin.fromJson(result.data());
        productList.add(productModalAdmin);
      });
    });
    return productList;
  }
}
