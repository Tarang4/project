import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/user_side/untils/toast/flutter_toast_method.dart';

import '../../user_side/config/FireStore_string.dart';

class ProductRepository {
  static productsAdd({
    BuildContext? context,
    String? uId,
    String? categories,
    String? productName,
    String? productInfo,
    String? productPrice,
    String? img1,
    String? img3,
    String? img4,
    String? img2,
    String? color1,
    String? color2,
    String? color3,
    String? color4,
    String? sizeS,
    String? sizeM,
    String? sizeXL,
    String? sizeXXL,
  }) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    DateTime todayDate = DateTime.now();

    final CollectionReference _productCollection =
        firebaseFirestore.collection(FirebaseString.productCollection);

    Map<String, dynamic> productData = <String, dynamic>{
      "productId": _productCollection.doc().id,
      "productTime": "Date-Time $todayDate",
      "UId": uId,
      "categories": categories,
      "productName": productName,
      "productInfo": productInfo,
      "productPrice": productPrice,
      "reviews": "",
      "images": {
        "img1": img1,
        "img2": img2,
        "img3": img3,
        "img4": img4,
      },
      "ColorCode": {
        "color1": color1,
        "color2": color2,
        "color3": color3,
        "color4": color4,
      },
      "size": {
        "S": sizeS,
        "M": sizeM,
        "XL": sizeXL,
        "XXL": sizeXXL,
      },
    };

    await _productCollection.add(productData);

    ToastMethod.simpleToast(massage: "Save ok");
  }

  // static productReviewAdd(
  //     {@required BuildContext? context,
  //       @required String? pid,
  //       @required String? cardNo,
  //       @required String? cvv,
  //       @required String? exp_date}) async {
  //
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //
  //   final CollectionReference _cardCollection = firebaseFirestore
  //       .collection(FirebaseString.productCollection).where("productId",isEqualTo:pid )
  //       .doc(id)
  //       .collection(FirebaseString.productReviewCollection);
  //
  //   DocumentReference? documentId;
  //   DocumentReference documentReferencer = _cardCollection.doc(documentId?.id);
  //   print(documentReferencer.id);
  //
  //   Map<String, dynamic> ReviewData = <String, dynamic>{
  //     "userId": id,
  //     "cardId": documentReferencer.id,
  //     "cardName": cardName,
  //     "cardNo": cardNo,
  //     "exp_date": exp_date,
  //     "element_id": "",
  //     "cvv": cvv,
  //   };
  //
  //   if (id != null) {
  //     await _cardCollection.add(cardData);
  //
  //     ToastMethod.simpleToast(context: context, massage: "add detail");
  //
  //     debugPrint('yes add card');
  //   } else {
  //     ToastMethod.simpleToast(context: context, massage: "no add detail");
  //
  //     debugPrint('No add card');
  //   }
  // }

  static deleteProducts({
    @required String? id,
  }) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _productCollection =
        firebaseFirestore.collection(FirebaseString.productCollection);
    if (id != null) {
      _productCollection.where("productId", isEqualTo: id).get().then((value) {
        for (DocumentSnapshot ds in value.docs) {
          ds.reference.delete();
        }
        ToastMethod.simpleToast(massage: "Product Delete Successfully");
        print("delete done");
      });
    }
  }
}

class GetProductById {
  static Future getUserData(
      {@required BuildContext? context, @required String? userId}) async {
    // showLoadingDialog(context: context);

    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    DocumentSnapshot documentSnapshot = await firebaseFirestore
        .collection(FirebaseString.productCollection)
        .doc(userId)
        .get();
    print("data is ${documentSnapshot["productId"]}");
    if (documentSnapshot["productId"] != null) {
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
