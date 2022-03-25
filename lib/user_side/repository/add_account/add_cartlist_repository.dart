import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../main.dart';
import '../../config/FireStore_string.dart';
import '../../config/Localstorage_string.dart';
import '../../config/local_storage.dart';
import '../../modal/address_modal.dart';
import '../../untils/toast/flutter_toast_method.dart';
import 'getCartData.dart';

class CartRepository {


  static cartDetailAdd(
      {@required BuildContext? context,
        @required String? productId,
        @required String? productName,
        @required String? productPrice,
        @required String? productImage,
        @required String? productColor,
        @required String? productSize,
      }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;


    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _addressCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.cartListCollection);

    DocumentReference? documentId;
    DocumentReference documentReferencer =
    _addressCollection.doc(documentId?.id);
    print(documentReferencer.id);

    Map<String, dynamic> cartData = <String, dynamic>{
      "productId": productId,
      "addId": documentReferencer.id,
      "productName": productName,
      "productImage": productImage,
      "productPrice": productPrice,
      "productColor": productColor,
      "productSize": productSize,
      "quantity": 1,

    };
    // if (userDetailModel["productId"]==productId) {
    //   Get.snackbar(
    //       "Check your cart", "${userDetailModel["productName"]} is already added");
    // }
    // else {
    if(id!=null){
      await _addressCollection.add(cartData);
      ToastMethod.simpleToastTop(context: context, massage: "Added In Cart");
      debugPrint('yes add cartList');
     }
  }


  static cartDetailDelete({
    @required BuildContext? context,
    @required String? productId,
  }) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _cardCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.cartListCollection);

    _cardCollection.where('productId', whereIn: [productId]).get().then((snapshot) {
      snapshot.docs[0].reference.delete();
    });
  }
}
