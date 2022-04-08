import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/user_side/modal/product_modal.dart';
import 'package:untitled/user_side/untils/toast/flutter_toast_method.dart';

import '../../main.dart';
import '../../user_side/config/FireStore_string.dart';
import '../../user_side/config/Localstorage_string.dart';
import '../modal/admin_product_modal.dart';

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
    String productId = _productCollection.doc().id.toString();

    Map<String, dynamic> productData = <String, dynamic>{
      "productId": productId,
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

    await _productCollection.doc(productId).set(productData);

    ToastMethod.simpleToast(massage: "Save ok");
  }

  static productReviewAdd({
    @required BuildContext? context,
    @required String? pid,
    @required String? reviewText,
    @required String? star,
  }) async {
    String profilePhoto = pref!.getString(LocalStorageKey.profilePhoto)!;
    String lastName = pref!.getString(LocalStorageKey.lastName)!;
    String firstName = pref!.getString(LocalStorageKey.firstName)!;
    String uId = pref!.getString(LocalStorageKey.userId)!;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _reviewCollection = firebaseFirestore
        .collection(FirebaseString.productCollection)
        .doc(pid)
        .collection(FirebaseString.productReviewCollection);
    String reviewId = _reviewCollection.doc().id.toString();

    Map<String, dynamic> reviewData = <String, dynamic>{
      "productId": pid,
      "reviewId": reviewId,
      "reviewText": reviewText,
      "star": star,
      "userprofile": profilePhoto,
      "userName": "$firstName $lastName",
      "userId": uId,
    };
    try {
      await _reviewCollection.doc(reviewId).set(reviewData);
      Navigator.pop(context!);
      ToastMethod.simpleToast(context: context, massage: "Review Added");
      debugPrint('add review');
    } catch (e) {
      debugPrint('error of review:$e');
    }
  }

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

  List<ProductModalAdmin> getProducts() {
    ProductModalAdmin productModalAdmin = ProductModalAdmin();
    List<ProductModalAdmin> productList = [];
    FirebaseFirestore.instance
        .collection(FirebaseString.productCollection)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        productModalAdmin = ProductModalAdmin.fromJson(result.data());
        productList.add(productModalAdmin);
      });
    });
    return productList;
  }
}

class GetReviewById {
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
