import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/user_side/config/FireStore_string.dart';
import 'package:untitled/user_side/untils/loading_dialog/dialog.dart';

import '../../../main.dart';

class HomeRepository{
  static Future<QuerySnapshot?> getProduct(
      {@required BuildContext? context}) async {
    showLoadingDialog(context: context);
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot productData = await firebaseFirestore
          .collection(FirebaseString.productCollection)
          .get();

      if(productData != null || productData.docs.isNotEmpty){
        hideLoadingDialog(context: context);
        print("product data ---------------- ${productData.docs}");
        return productData;
      }
    } on FirebaseException catch (e) {
      hideLoadingDialog(context: context);
      print("--------------------- exception $e");
    }
  }
}
