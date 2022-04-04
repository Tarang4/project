import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/user_side/modal/cart_modal.dart';

import '../../modal/address_modal.dart';
import '../../untils/toast/flutter_toast_method.dart';
import '../../config/FireStore_string.dart';

class OrderRepository {
  static orderAdd({
    @required BuildContext? context,
    @required String? total,
    @required String? GST,
    @required String? discount,
    @required String? finalTotal,
    @required String? addressId,
    @required String? address,
    @required String? addressFullName,
    @required String? addressPhone,
    @required String? cardId,
    @required String? cvv,
    @required String? cardName,
    @required String? cardNo,
    @required String? expDate,
    @required String? method,
    @required List<CartModal>? cartList,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;
    // Future<List<AddressModal>> addresData= getUserAddress(addressId: addressId);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    List? listOfCart = [];
    for (int i = 0; i < cartList!.length; i++) {
      CartModal cartModal = cartList[i];
      listOfCart.add({
        "productImage": cartModal.productImage.toString(),
        "productName": cartModal.productName.toString(),
        "PID": cartModal.productId.toString(),
        "CartId": cartModal.addId.toString(),
        "productPrice": cartModal.productPrice.toString()
      });
    }
    final CollectionReference _orderCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.orderCollection);
    DateTime orderDate = DateTime.now();
    String orderId = _orderCollection.doc().id.toString();

    Map<String, dynamic> orderData = <String, dynamic>{
      "UserId": id,
      "OrderId": orderId,
      "Total": total,
      "date": orderDate,
      "FinalTotal": finalTotal,
      "GST": GST,
      "Discount": discount,
      "Method": method,
      "ProductDetail": FieldValue.arrayUnion(listOfCart),
      "AddressDetail": {
        "addId": addressId,
        "fullName": addressFullName,
        "Address": address,
        "phoneNo": addressPhone,
      },
      "CardDetail": {
        "cardId": cardId,
        "cardName": cardName,
        "cardNo": cardNo,
        "exp_date": expDate,
        "cvv": cvv,
      },
    };

    if (id != null) {
      await _orderCollection.add(orderData);

      ToastMethod.simpleToastLightColor(
          context: context, massage: "✔ Card Added");

      debugPrint('yes add card');
    } else {
      ToastMethod.simpleToast(context: context, massage: "no add detail");

      debugPrint('No add card');
    }
  }

  static Future<List<AddressModal>> getUserAddress({
    @required String? addressId,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;
    List<AddressModal> addressList = [];

    await FirebaseFirestore.instance
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.addressCollection)
        .where("addId", isEqualTo: addressId)
        .get()
        .then((value) {
      print(value);
      value.docs.forEach((element) {
        AddressModal addressModal = AddressModal.fromJson(element.data());
        addressList.add(addressModal);
      });
    });
    return addressList;
  }
}
