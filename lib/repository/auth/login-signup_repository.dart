import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/config/firebaseString.dart';
import 'package:untitled/config/local_storage.dart';
import 'package:untitled/repository/auth/getUserById.dart';
import 'package:untitled/screens/explore%20screen/explore_screen.dart';
import 'package:untitled/screens/login%20screen/login_screen.dart';
import 'package:untitled/untils/loading_dialog/dialog.dart';
import 'package:untitled/untils/toast/toast_message.dart';

import '../../main.dart';

class AuthRepository {
  static Future<User?> signIn({
    @required BuildContext? context,
    @required String? email,
    @required String? password,
  }) async {
    showLoadingDialog(context: context);
    await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    DocumentSnapshot userDetailModel;

    User? user;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      user = userCredential.user;

      if (user != null) {
        userDetailModel = await GetUserRepository.getUserData(
            context: context, userId: user.uid);

        if (userDetailModel.toString().isNotEmpty) {
          pref!.setString(LocalStorage.userId, userDetailModel['userId']);
          pref!.setString(LocalStorage.firstName, userDetailModel['firstName']);
          pref!.setString(LocalStorage.lastName, userDetailModel['lastName']);
          pref!.setString(LocalStorage.email, userDetailModel['email']);
          if(userDetailModel['profilephoto'] != "" || userDetailModel['profilephoto'] != null){
            pref!.setString(LocalStorage.userProfile, userDetailModel['profilephoto']);
          }
          hideLoadingDialog(context: context);
          // showToastMessage(context: context, message: "Login SuccessFully!", isTop: false);

          // ToastMessage.successToast(context: Get.context, description: "Login SuccessFully!");

          Navigator.push(
              context!,
              CupertinoPageRoute(
                  builder: (context) => ExploreScreen()));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        hideLoadingDialog(context: context);
        ToastMessage.errorToast(
            context: context, description: "Invalid Credentials!");
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        hideLoadingDialog(context: context);
        ToastMessage.errorToast(
            context: context, description: "Invalid Credentials!");
        debugPrint('Wrong password provided.');
      } else {
        hideLoadingDialog(context: context);
        ToastMessage.errorToast(
            context: context, description: "Invalid Credentials!");
        debugPrint("error ---- ${e.code}");
      }
    }
    return user;
  }

  static Future<bool?> signup(
      {@required BuildContext? context,
        @required String? firstName,
        @required String? lastName,
        @required String? email,
        @required String? password}) async {
    debugPrint("Start signup function");
    bool? isSuccess = false;
    DateTime todayDate = DateTime.now();
    showLoadingDialog(context: context);
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    final CollectionReference _mainCollection =
    _fireStore.collection(FireBaseString.userCollection);
    UserCredential userCredential;
    try {
      debugPrint("Start creating user to auth");
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      debugPrint("end creating user to auth");
      if (userCredential.user != null) {
        debugPrint("Start creating user to collection");
        debugPrint("User crated successfully");
        debugPrint("userCredential.user!.uid -- ${userCredential.user!.uid}");
        DocumentReference documentReference =
        _mainCollection.doc(userCredential.user!.uid);
        Map<String, dynamic> data = <String, dynamic>{
          "userId": userCredential.user!.uid,
          "email": email,
          "firstName": firstName,
          "lastName": lastName,
          "password": password,
          "profilephoto": "",
          "mobile": "",
          "gender": "",
          "createAt": todayDate.toString(),
          "updateAt": todayDate.toString()
        };
        await documentReference.set(data).whenComplete(() async {
          isSuccess = true;
          hideLoadingDialog(context: context);
          Navigator.pushAndRemoveUntil(
              context!,
              CupertinoPageRoute(
                  builder: (context) => const ExploreScreen()),(route) => false);
          // pref!.setString(LocalStorage.userId, data['userId']);
          // pref!.setString(LocalStorage.firstName, data['firstName']);
          // pref!.setString(LocalStorage.lastName, data['lastName']);
          // pref!.setString(LocalStorage.email, data['email']);
          pref!.setBool(LocalStorage.isLogin, true);
          // pref!.setString(LocalStorage.userProfile, "");

        }).catchError((onError) {
          debugPrint("error to set data to collection.");
          isSuccess = false;
        });
        debugPrint("End creating user to Collection");
      } else {
        ToastMessage.errorToast(context: context, description: "Invalid Credentials!");
        hideLoadingDialog(context: context);
        debugPrint("Error creating user to auth");
        isSuccess = false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        hideLoadingDialog(context: context);
        debugPrint('No user found for that email.');
        isSuccess = false;
      } else if (e.code == 'wrong-password') {
        hideLoadingDialog(context: context);
        debugPrint('Wrong password provided.');
        isSuccess = false;
      } else if (e.code == "email-already-in-use") {
        hideLoadingDialog(context: context);
        ToastMessage.errorToast(
            context: context, description: "User Already Exists");
      } else {
        debugPrint("error -------------${e.code}");
      }
    } catch (e) {
      debugPrint("Error --- $e");
    }
    return isSuccess;
  }

  static Future logout({@required BuildContext? context}) async {
    pref!.clear();
    Navigator.pushAndRemoveUntil(
        context!, CupertinoPageRoute(builder: (context) => const LoginScreen()), (route) => false);
    ToastMessage.successToast(context: Get.context, description: "Logout SuccessFully!");
  }
}