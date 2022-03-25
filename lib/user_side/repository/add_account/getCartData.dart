import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/user_side/modal/cart_modal.dart';
import '../../config/FireStore_string.dart';

class GetCartById {
  static Future getCartData(
      { @required String? userId}) async {

    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    QuerySnapshot<Map<String, dynamic>> documentSnapshot = await firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(userId).collection(FirebaseString.cartListCollection)
        .get();


      return documentSnapshot;

  }
}
