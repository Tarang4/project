import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../main.dart';
import '../../user_side/config/FireStore_string.dart';
import '../../user_side/config/Localstorage_string.dart';
import '../../user_side/repository/auth/getUserById.dart';
import '../../user_side/screens/explore screen/main_home_screen.dart';
import '../../user_side/screens/login screen/all_type_screnn.dart';
import '../../user_side/screens/login screen/edit_profile_screnn.dart';
import '../../user_side/untils/loading_dialog/dialog.dart';
import '../../user_side/untils/toast/flutter_toast_method.dart';
import '../../user_side/untils/toast/toast_message.dart';
import '../screens/admin_home_screen.dart';

class AdminAuthRepository {
  static Future<User?> adminSignIn({
    @required BuildContext? context,
    @required String? email,
    @required String? password,
    @required String? adminId,
  }) async {
    // showLoadingDialog(context: context);
    await Firebase.initializeApp();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    DocumentSnapshot userDetailModel;
    User? admin;
    DateTime LogInDate = DateTime.now();

//password update
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final CollectionReference _upDatePasswordCollection =
    firebaseFirestore.collection(FirebaseString.adminCollection);

                String adminIdGet=_upDatePasswordCollection.doc().id.toString();

    Map<String, dynamic> data = <String, dynamic> {
      "email":email,
    "password": password,
    "adminId": adminIdGet,
    "isLoginTime": "LogIn - $LogInDate"
    };

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email!, password: password!,);
      admin = userCredential.user;

      if (admin != null) {
        // pref!.setString(LocalStorageKey.password, password);
        await _upDatePasswordCollection.doc("rha4OKCNrwpPoDiDtTvq").update(data);
        userDetailModel =
        await GetUserById.getAdminData(context: context,);

        if (userDetailModel
            .toString()
            .isNotEmpty) {
          ToastMethod.simpleToastLightColor(
              massage: "Welcome to SnatchKart Admin");
          Navigator.pushReplacement(
              context!,
              CupertinoPageRoute(
                  builder: (context) =>
                  const AdminHome()));
          pref!.setBool("isAdminLigIn", true);

        }
      } else {
        ToastMethod.simpleToast(massage: "no get else in");
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
            context: context, description: "Wrong password!");
        debugPrint('Wrong password provided.');
      } else {
        hideLoadingDialog(context: context);
        ToastMessage.errorToast(
            context: context, description: "internet Connections failed");
        debugPrint("error ---- ${e.code}");
      }
    }
    return admin;
  }
  //
  // static Future<bool?> signup({@required BuildContext? context,
  //   @required String? name,
  //   @required String? email,
  //   @required String? phone,
  //   @required String? password,
  //   bool isTop = false}) async {
  //   debugPrint("Start signup function");
  //   bool? isSuccess = false;
  //   DateTime todayDate = DateTime.now();
  //   showLoadingDialog(context: context);
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  //   final CollectionReference _mainCollection =
  //   _fireStore.collection(FirebaseString.userCollection);
  //   UserCredential userCredential;
  //
  //   DocumentReference? documentId;
  //   DocumentReference passwordToken =
  //   _mainCollection.doc(documentId?.id);
  //
  //   try {
  //     debugPrint("Start creating user to auth");
  //     userCredential = await _auth.createUserWithEmailAndPassword(
  //       email: email!,
  //       password: password!,
  //     );
  //
  //     debugPrint("end creating user to auth");
  //     if (userCredential.user != null) {
  //       debugPrint("Start creating user to collection");
  //       debugPrint("User crated successfully");
  //       debugPrint("userCredential.user!.uid -- ${userCredential.user!.uid}");
  //       DocumentReference documentReference =
  //       _mainCollection.doc(userCredential.user!.uid);
  //
  //       Map<String, dynamic> data = <String, dynamic>{
  //         "userId": userCredential.user!.uid,
  //         "email": userCredential.user?.email,
  //         "firstName": "",
  //         "lastName": "",
  //         "password": password,
  //         "passwordToken": passwordToken.id,
  //         "profilePhoto": "",
  //         "Birthdate": "",
  //         "phone": phone,
  //         "gender": "",
  //         "isLoginTime": "LogIn - ${todayDate}",
  //         "wishList": "",
  //         "createAt": todayDate.toString(),
  //         "updateAt": todayDate.toString()
  //       };
  //
  //
  //       await documentReference.set(data).whenComplete(() async {
  //         isSuccess = true;
  //         print(
  //             "add successfully -------------------------------------------------------");
  //         hideLoadingDialog(context: context);
  //
  //         ToastMethod.simpleToast(massage: "Welcome To SnatchKart");
  //         pref?.setBool(LocalStorageKey.isLogin, true);
  //         pref!.setString(LocalStorageKey.userId, data[LocalStorageKey.userId]);
  //         pref!.setString(LocalStorageKey.email, data[LocalStorageKey.email]);
  //         pref!.setString(LocalStorageKey.phone, data[LocalStorageKey.phone]);
  //         pref!.setString(
  //             LocalStorageKey.password, data[LocalStorageKey.password]);
  //         pref!.setString(LocalStorageKey.passwordToken,
  //             data[LocalStorageKey.passwordToken]);
  //         if (data[LocalStorageKey.profilePhoto] != "" ||
  //             data[LocalStorageKey.profilePhoto] != null) {
  //           pref!.setString(LocalStorageKey.profilePhoto,
  //               data[LocalStorageKey.profilePhoto]);
  //         }
  //
  //
  //         Navigator.pushAndRemoveUntil(
  //             context!,
  //             CupertinoPageRoute(
  //                 builder: (context) => const EditProfileScreen()),
  //                 (route) => false);
  //       }).catchError((onError) {
  //         debugPrint("error to set data to collection.");
  //         isSuccess = false;
  //       });
  //       debugPrint("End creating user to Collection");
  //     } else {
  //       ToastMessage.errorToast(
  //           context: context, description: "Invalid Credentials!");
  //       hideLoadingDialog(context: context);
  //       debugPrint("Error creating user to auth");
  //       isSuccess = false;
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       hideLoadingDialog(context: context);
  //       debugPrint('No user found for that email.');
  //       isSuccess = false;
  //     } else if (e.code == 'wrong-password') {
  //       hideLoadingDialog(context: context);
  //       debugPrint('Wrong password provided.');
  //       isSuccess = false;
  //     } else if (e.code == "email-already-in-use") {
  //       hideLoadingDialog(context: context);
  //       ToastMethod.simpleToast(massage: "allredy 6e");
  //       ToastMessage.errorToast(
  //           context: context, description: "User Already Exists");
  //     } else {
  //       debugPrint("error -------------${e.code}");
  //     }
  //   } catch (e) {
  //     debugPrint("Error --- $e");
  //   }
  //   return isSuccess;
  // }

  static Future logout({@required BuildContext? context}) async {
    await pref!.clear();
    // logOutUpDate(context: context);
    Navigator.pushAndRemoveUntil(
        context!,
        CupertinoPageRoute(builder: (context) => const LoginTypes()),
            (route) => false);
    ( "Logout SuccessFully!");
  }
}