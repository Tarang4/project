import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/user_side/modal/cart_modal.dart';
import 'package:intl/intl.dart';
import '../../screens/explore screen/main_home_screen.dart';
import '../../untils/toast/flutter_toast_method.dart';
import '../../config/FireStore_string.dart';

class OrderRepository {
  static orderAddUser({
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
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    List? listOfCart = [];
    for (int i = 0; i < cartList!.length; i++) {
      CartModal cartModal = cartList[i];
      listOfCart.add({
        "productImage": cartModal.productImage.toString(),
        "productName": cartModal.productName.toString(),
        "PID": cartModal.productId.toString(),
        "CartId": cartModal.addId.toString(),
        "productPrice": cartModal.productPrice.toString(),
        "color": cartModal.productColor.toString(),
        "size": cartModal.productSize.toString()
      });
    }
    final CollectionReference _orderCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.orderCollection);
    DateTime dateTime = DateTime.now();

    final DateFormat formatter = DateFormat.yMMMMd('en_US');
    final DateFormat formatterTime = DateFormat.jm();
    final String orderDate = formatter.format(dateTime);
    final String orderTime = formatterTime.format(dateTime);

    String orderId = _orderCollection.doc().id.toString();

    Map<String, dynamic> orderData = <String, dynamic>{
      "UserId": id,
      "OrderId": orderId,
      "Total": total,
      "conform": false,
      "delivered": false,
      "cancel": false,
      "orderDate": orderDate.toString(),
      "orderTime": orderTime.toString(),
      "FinalTotal": finalTotal,
      "GST": GST,
      "Discount": discount,
      "Method": method,
      "ProductDetail": FieldValue.arrayUnion(listOfCart),
      "AddressDetail": {
        "addId": addressId,
        "fullName": addressFullName,
        "Address": address,
        "phoneNo": addressPhone
      },
      "CardDetail": {
        "cardId": cardId,
        "cardName": cardName,
        "cardNo": cardNo,
        "exp_date": expDate,
        "cvv": cvv
      }
    };

    if (id != null) {
      await _orderCollection.add(orderData);

      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: const Text('✔  Your Order placed Successfully\n      Have Nice Day !'),
          action: SnackBarAction(
            label: '',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>MainHomeScreen()),ModalRoute.withName("/"));


      debugPrint('yes add card');
    } else {
      ToastMethod.simpleToast(context: context, massage: "no add detail");

      debugPrint('No add card');
    }
  }

  static orderUpdate({
    @required BuildContext? context,    @required String? finalTotal,

    @required String? date,
    @required String? userId,
    @required bool? cancel,
    @required bool? conform,
    @required bool? delivered,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _orderCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(userId)
        .collection(FirebaseString.orderCollection);

    Map<String, dynamic> orderData = <String, dynamic>{
      "cancel": cancel,
      "conform": conform,
      "delivered": delivered,
    };

    try {
      _orderCollection.where("FinalTotal", isEqualTo: finalTotal).where(
          "orderDate", isEqualTo: date).get().then((res) {
        res.docs.forEach((result) {
          _orderCollection.doc(result.id).update(orderData);
        });
      });

      ToastMethod.simpleToastLightColor(
          context: context, massage: "✔ Done Successfully ");

      debugPrint('yes update card');
    }
    catch(e){
      ToastMethod.simpleToastLightColor(context: context, massage: "Not Cancelled");

      debugPrint('No update card');}

  }
//
// static orderDelete({
//   @required BuildContext? context,
//   @required String? orderId,
// }) {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   var id = _auth.currentUser?.uid;
//
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//
//   final CollectionReference _cardCollection = firebaseFirestore
//       .collection(FirebaseString.userCollection)
//       .doc(id)
//       .collection(FirebaseString.orderCollection);
//
//   _cardCollection.where('OrderId', whereIn: [orderId]).get().then((snapshot) {
//     snapshot.docs[0].reference.delete();
//   });
// }
}
