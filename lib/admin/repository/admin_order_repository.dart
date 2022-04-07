import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../user_side/config/FireStore_string.dart';
import '../../user_side/modal/cart_modal.dart';
import '../../user_side/untils/toast/flutter_toast_method.dart';

class AdminOrderRepository{
  static orderAddAdmin({
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
        .collection(FirebaseString.adminCollection)
        .doc("rha4OKCNrwpPoDiDtTvq")
        .collection(FirebaseString.orderCollection);
    DateTime orderDate = DateTime.now();
    String orderId = _orderCollection.doc().id.toString();

    Map<String, dynamic> orderData = <String, dynamic>{
      "UserId": id,
      "OrderId": orderId,
      "Total": total,
      "conform": false,
      "delivered": false,
      "cancel": false,
      "date": orderDate.toString(),
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
          context: context, massage: "✔ Admin Added");

      debugPrint('yes add card');
    } else {
      ToastMethod.simpleToast(context: context, massage: "no add detail admin");

      debugPrint('No add card');
    }
  }
  static orderUpdate({
    @required BuildContext? context,
    @required String? orderId,
    @required bool? cancel,
    @required bool? conform,
    @required bool? delivered,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _cardCollection = firebaseFirestore
        .collection(FirebaseString.adminCollection)
        .doc("rha4OKCNrwpPoDiDtTvq")
        .collection(FirebaseString.orderCollection);

    Map<String, dynamic> orderData = <String, dynamic>{
      "cancel": cancel==null?false:true,
      "conform": conform==null?false:true,
      "delivered": delivered==null?false:true,
    };

    if (id != null) {
      _cardCollection.where("OrderId", isEqualTo: orderId).get().then((res) {
        res.docs.forEach((result) {
          _cardCollection.doc(result.id).update(orderData);
        });
      });

      ToastMethod.simpleToastLightColor(context: context, massage: "✔ Updated");

      debugPrint('yes update card');
    } else {
      ToastMethod.simpleToastLightColor(context: context, massage: "no update");

      debugPrint('No update card');
    }
  }
}