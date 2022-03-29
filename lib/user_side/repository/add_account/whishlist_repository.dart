import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../main.dart';
import '../../config/FireStore_string.dart';
import '../../config/Localstorage_string.dart';
import '../../config/local_storage.dart';
import '../../modal/address_modal.dart';
import '../../modal/wishList_modal.dart';
import '../../untils/toast/flutter_toast_method.dart';

class WishListRepository {
  static wishListDetailAdd({
    @required BuildContext? context,
    @required String? productName,
    @required String? productImage1,
    @required String? productPrice,
    @required String? productID,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    String Uid = pref!.getString(LocalStorageKey.userId)!;

    final CollectionReference _addressCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.wishListCollection);

    String wishListId = _addressCollection.doc().id.toString();

    DocumentReference? documentId;
    DocumentReference documentReferencer =
        _addressCollection.doc(documentId?.id);
    print(documentReferencer.id);
    Map<String, dynamic> wishListData = <String, dynamic>{
      "userID": Uid,
      "productID": productID,
      "WishListID": wishListId,
      "ProductName": productName,
      "productImage": productImage1,
      "productPrice": productPrice,
    };

    if (id != null) {
      await _addressCollection.add(wishListData);

      ToastMethod.simpleToastLightColor(
          context: context, massage: "New wishList Added  ✔");

      debugPrint('yes add card');
    } else {
      ToastMethod.simpleToast(context: context, massage: "no WishList detail");

      debugPrint('No WishList');
    }
  }

  static wishListDetailUpdate({
    @required BuildContext? context,
    @required String? productName,
    @required String? productImage1,
    @required String? productPrice,
    @required String? productID,
    @required String? wishListId,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;
    String Uid = pref!.getString(LocalStorageKey.userId)!;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _addressCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.wishListCollection);
    Map<String, dynamic> wishListData = <String, dynamic>{
      "userID": Uid,
      "productID": productID,
      "WishListID": wishListId,
      "ProductName": productName,
      "productImage": productImage1,
      "productPrice": productPrice,
    };

    if (id != null) {
      _addressCollection
          .where("productID", isEqualTo: productID)
          .get()
          .then((res) {
        res.docs.forEach((result) {
          _addressCollection.doc(result.id).update(wishListData);
        });
      });

      ToastMethod.simpleToastLightColor(
          context: context, massage: "✔  WishList Added");

      debugPrint('yes update card');
    } else {
      ToastMethod.simpleToast(context: context, massage: "no add detail");

      debugPrint('No update card');
    }
  }

  static wishListDelete({
    @required BuildContext? context,
    @required String? productID,
  }) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var id = _auth.currentUser?.uid;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _cardCollection = firebaseFirestore
        .collection(FirebaseString.userCollection)
        .doc(id)
        .collection(FirebaseString.wishListCollection);

    _cardCollection
        .where('productID', whereIn: [productID])
        .get()
        .then((snapshot) {
          snapshot.docs[0].reference.delete();

          ToastMethod.simpleToastLightColor(
              context: context, massage: "✔  WishList Remove");
        });
  }

  static List<WishListModal> wishListGet()  {
    WishListModal wishListModal = WishListModal();
    List<WishListModal> wishList = [];
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    FirebaseFirestore.instance
        .collection(FirebaseString.userCollection)
        .doc(user!.uid)
        .collection(FirebaseString.wishListCollection)
        .get()
        .then((value) {
      value.docs.forEach((element) {
          wishListModal = WishListModal.fromJson(element.data());
          wishList.add(wishListModal);
      });
    });
    return wishList;
  }
}
