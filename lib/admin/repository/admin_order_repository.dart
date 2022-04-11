import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../user_side/config/FireStore_string.dart';
import '../../user_side/modal/cart_modal.dart';
import '../../user_side/untils/toast/flutter_toast_method.dart';
  import 'package:intl/intl.dart';
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
        "productPrice": cartModal.productPrice.toString(),
        "color": cartModal.productColor.toString(),
        "size": cartModal.productSize.toString(),
      });
    }
    final CollectionReference _orderCollection = firebaseFirestore
        .collection(FirebaseString.adminCollection)
        .doc("rha4OKCNrwpPoDiDtTvq")
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
    @required String? finalTotal,
    @required String? date,
    @required bool? cancel,
    @required bool? conform,
    @required bool? delivered,
  }) async {


    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _orderCollection = firebaseFirestore
        .collection(FirebaseString.adminCollection)
        .doc("rha4OKCNrwpPoDiDtTvq")
        .collection(FirebaseString.orderCollection);

    Map<String, dynamic> orderData = <String, dynamic>{
      "cancel": cancel,
      "conform": conform,
      "delivered": delivered,
    };
try{

  _orderCollection.where("FinalTotal", isEqualTo: finalTotal).where("orderDate", isEqualTo: date).get().then((res) {

    for (var result in res.docs) {
          _orderCollection.doc(result.id).update(orderData);
        }
      });

      ToastMethod.simpleToastLightColor(context: context, massage: "✔ Updated admin");

      debugPrint('yes update card');}
    catch (e){
      ToastMethod.simpleToastLightColor(context: context, massage: "not error $e");

      debugPrint('yes erro card');}
// catch (e){}
    }

// static orderDelete({
//   @required BuildContext? context,
//   @required String? orderId,
// }) {
//
//
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//
//   final CollectionReference _orderCollection = firebaseFirestore
//       .collection(FirebaseString.adminCollection)
//       .doc("rha4OKCNrwpPoDiDtTvq")
//       .collection(FirebaseString.orderCollection);
//
//
//   _orderCollection.where('cardId', whereIn: [cardId]).get().then((snapshot) {
//     snapshot.docs[0].reference.delete();
//   });
// }

}