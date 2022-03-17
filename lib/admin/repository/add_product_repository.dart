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

    final CollectionReference _productCollection =
        firebaseFirestore.collection(FirebaseString.productCollection);

    Map<String, dynamic> productData = <String, dynamic>{
      "productId": _productCollection.doc().id,
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

  static productsSet({
    String? img1,
    String? img3,
    String? img4,
    String? img2,
  }) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _productCollection =
        firebaseFirestore.collection(FirebaseString.productCollection);

    Map<String, dynamic> productData = <String, dynamic>{
      "img1": img1,
      "img2": img2,
      "img3": img3,
      "img4": img4,
    };

    await _productCollection.doc().set(productData);

    ToastMethod.simpleToast(massage: "Save ok");
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
