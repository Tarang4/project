import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/config/firebaseString.dart';
import 'package:untitled/untils/loading_dialog/dialog.dart';

class GetUserRepository{
  static Future getUserData({
    @required BuildContext? context,
    @required String? userId
  }) async{
    showLoadingDialog(context: context);
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    DocumentSnapshot documentSnapshot =
    await firebaseFirestore.collection(FireBaseString.userCollection).doc(userId!).get();
    // print("data is ${documentSnapshot['name']}");
    if(documentSnapshot['userId'] != null){
      // print("data is ${documentSnapshot.data()}");
      hideLoadingDialog(context: context);
      return documentSnapshot;
    } else {
      hideLoadingDialog(context: context);
      return null;
    }
  }
}