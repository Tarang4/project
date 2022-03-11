import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/config/FireStore_string.dart';
import 'package:untitled/screens/explore%20screen/explore_screen.dart';
import 'package:untitled/screens/login%20screen/all_type_screnn.dart';
import 'package:untitled/screens/login%20screen/edit_profile_screnn.dart';
import 'package:untitled/untils/toast/flutter_toast_method.dart';
import '../../config/Localstorage_string.dart';
import '../../main.dart';
import 'getUserById.dart';
import '../../untils/loading_dialog/dialog.dart';
import '../../untils/toast/toast_message.dart';


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
    DateTime LogInDate = DateTime.now();

//password update
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final CollectionReference _upDatePasswordCollection =
    firebaseFirestore.collection(FirebaseString.userCollection);

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email!, password: password!,);
      user = userCredential.user;

      if (user != null) {
        pref!.setString(LocalStorageKey.password, password);
        await _upDatePasswordCollection.doc(_auth.currentUser?.uid).update({
          "password": password,
          "isLoginTime": "LogIn - ${LogInDate}"
        });
        userDetailModel =
            await GetUserById.getUserData(context: context, userId: user.uid);

        if (userDetailModel.toString().isNotEmpty) {
          ToastMethod.simpleToast(massage: "successfully");
          pref?.setBool(LocalStorageKey.isLogin, true);
          pref!.setString(LocalStorageKey.userId, userDetailModel[LocalStorageKey.userId]);
          pref!.setString(LocalStorageKey.firstName, userDetailModel[LocalStorageKey.firstName]);
          pref!.setString(LocalStorageKey.lastName, userDetailModel[LocalStorageKey.lastName]);
          pref!.setString(LocalStorageKey.gender, userDetailModel[LocalStorageKey.gender]);
          pref!.setString(LocalStorageKey.birthdate, userDetailModel[LocalStorageKey.birthdate]);
          pref!.setString(LocalStorageKey.email, userDetailModel[LocalStorageKey.email]);
          pref!.setString(LocalStorageKey.password, userDetailModel[LocalStorageKey.password]);
          pref!.setString(LocalStorageKey.passwordToken, userDetailModel[LocalStorageKey.passwordToken]);
          pref!.setString(LocalStorageKey.phone, userDetailModel[LocalStorageKey.phone]);

          if(userDetailModel[LocalStorageKey.profilePhoto] != "" || userDetailModel[LocalStorageKey.profilePhoto] != null){
            pref!.setString(LocalStorageKey.profilePhoto, userDetailModel[LocalStorageKey.profilePhoto]);
          }
          Navigator.push(context!,
              CupertinoPageRoute(builder: (context) => ExploreScreen()));
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
      @required String? name,
      @required String? email,
      @required String? phone,
      @required String? password,
      bool isTop = false}) async {
    debugPrint("Start signup function");
    bool? isSuccess = false;
    DateTime todayDate = DateTime.now();
    showLoadingDialog(context: context);
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    final CollectionReference _mainCollection =
        _fireStore.collection(FirebaseString.userCollection);
    UserCredential userCredential;

    DocumentReference? documentId;
    DocumentReference passwordToken =
    _mainCollection.doc(documentId?.id);

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
          "email": userCredential.user?.email,
          "firstName": "",
          "lastName": "",
          "password": password,
          "passwordToken": passwordToken.id,
          "profilePhoto": "",
          "Birthdate": "",
          "phone": phone,
          "gender": "",
          "isLoginTime": "LogIn - ${todayDate}",
          "wishList": "",
          "createAt": todayDate.toString(),
          "updateAt": todayDate.toString()
        };


        await documentReference.set(data).whenComplete(() async {
          isSuccess = true;
          print(
              "add successfully -------------------------------------------------------");
          hideLoadingDialog(context: context);

          ToastMethod.simpleToast(massage: "successfully");
          pref?.setBool(LocalStorageKey.isLogin, true);
          pref!.setString(LocalStorageKey.userId, data[LocalStorageKey.userId]);
          pref!.setString(LocalStorageKey.email, data[LocalStorageKey.email]);
          pref!.setString(LocalStorageKey.phone, data[LocalStorageKey.phone]);
          pref!.setString(LocalStorageKey.password, data[LocalStorageKey.password]);
          pref!.setString(LocalStorageKey.passwordToken, data[LocalStorageKey.passwordToken]);
          if(data[LocalStorageKey.profilePhoto] != "" || data[LocalStorageKey.profilePhoto] != null){
            pref!.setString(LocalStorageKey.profilePhoto, data[LocalStorageKey.profilePhoto]);
          }



          Navigator.pushAndRemoveUntil(
              context!,
              CupertinoPageRoute(builder: (context) => const EditProfileScreen()),
              (route) => false);
        }).catchError((onError) {
          debugPrint("error to set data to collection.");
          isSuccess = false;
        });
        debugPrint("End creating user to Collection");
      } else {
        ToastMessage.errorToast(
            context: context, description: "Invalid Credentials!");
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
        ToastMethod.simpleToast(massage: "allredy 6e");
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
   await pref!.clear();
   logOutUpDate(context: context);
    Navigator.pushAndRemoveUntil(
        context!,
        CupertinoPageRoute(builder: (context) => const LoginTypes()),
        (route) => false);
    ToastMessage.successToast(
        context: Get.context, description: "Logout SuccessFully!");
  }

  static logOutUpDate({
    @required BuildContext? context,
  }) {
    DateTime signOutDate = DateTime.now();

    final CollectionReference _updateCollection =
    FirebaseFirestore.instance.collection(FirebaseString.userCollection);


    final FirebaseAuth _auth = FirebaseAuth.instance;


    _updateCollection
        .doc(_auth.currentUser?.uid)
        .update({"isLoginTime": "LogOut - ${signOutDate} "}).then((_) {
      print(" log out successfully store is login time");
    });
  }


  static logInUpDate({
    @required BuildContext? context,
  }) {
    DateTime signUpDate = DateTime.now();
    String logout = "LogIn - ${signUpDate}";
    final CollectionReference _updateCollection =
    FirebaseFirestore.instance.collection(LocalStorageKey.isLogin);
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _updateCollection
        .doc(_auth.currentUser?.uid)
        .update({"isLoginTime": "LogIn - ${signUpDate}"}).then((_) {
      print(" log out successfully store");
    });
  }
}
