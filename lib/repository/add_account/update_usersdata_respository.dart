import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/config/FireStore_string.dart';
import 'package:untitled/untils/toast/flutter_toast_method.dart';

import '../../main.dart';
import '../../modal/firebse_usermodal/firebase_usermodal.dart';
import '../../screens/account screen/account_screen.dart';
import '../../screens/explore screen/explore_screen.dart';
import '../../config/Localstorage_string.dart';
import '../auth/getUserById.dart';

class UserUpDateRepository {
  static Future upDateProfile({
    @required BuildContext? context,
    @required String? firstName,
    @required String? lastName,
    @required String? profilePhoto,
    @required String? gender,
     @required String? birthDate,

  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    DateTime profileUpDate = DateTime.now();
    var id = _auth.currentUser?.uid;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final CollectionReference _profileCollection =
        firebaseFirestore.collection(FirebaseString.userCollection);
    Map<String, dynamic> data = <String, dynamic>{
      "firstName": firstName,
      "lastName": lastName,
      "Birthdate": birthDate,
      "gender": gender,
      "profilePhoto": birthDate,
      "updateAt": "Last Update ${profileUpDate.toString()}",
    };

    if (id != null) {
      await _profileCollection.doc(_auth.currentUser?.uid).update(data);


      pref!.setString(LocalStorageKey.firstName, data[LocalStorageKey.firstName]);
      pref!.setString(LocalStorageKey.lastName, data[LocalStorageKey.lastName]);
      pref!.setString(LocalStorageKey.gender, data[LocalStorageKey.gender]);
      pref!.setString(LocalStorageKey.birthdate, data[LocalStorageKey.birthdate]);
      if(data[LocalStorageKey.profilePhoto] != "" || data[LocalStorageKey.profilePhoto] != null){
        pref!.setString(LocalStorageKey.profilePhoto, data[LocalStorageKey.profilePhoto]);
      }

      ToastMethod.simpleToast(context: context, massage: "Update Successfully");
      Navigator.push(
          context!, MaterialPageRoute(builder: (context) => AccountScreen()));
      debugPrint('yes update');
    } else {
      ToastMethod.simpleToast(context: context, massage: "No update.");

      debugPrint('No update');
    }
  }

  static logOutUpDate({
    @required BuildContext? context,
  }) {
    DateTime signUpDate = DateTime.now();
    String logout = signUpDate.toString();
    final CollectionReference _updateCollection =
        FirebaseFirestore.instance.collection('demoOfUsers');
    final FirebaseAuth _auth = FirebaseAuth.instance;
    String? getPassword;
    _updateCollection
        .doc(_auth.currentUser?.uid)
        .update({"isLogin_out": logout}).then((_) {
      print(" log out successfully store");
      ToastMethod.simpleToast(
          context: context, massage: "Successfully update logout");
    });
  }

  static Future ChangePassword({
    @required BuildContext? context,
    @required String? newPassword,
    @required String? oldPassword,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    String? getPassword;
    final CollectionReference _updateCollection =
        FirebaseFirestore.instance.collection('demoOfUsers');
    DocumentSnapshot userDetailModel = await GetUserById.getUserData(
        context: context, userId: _auth.currentUser?.uid);
    getPassword = userDetailModel[LocalStorageKey.password];

    debugPrint('found password is $getPassword');

    if (getPassword == oldPassword) {
      _auth.currentUser?.updatePassword(newPassword!).then((_) {
        Navigator.pop(context!);

        ToastMethod.simpleToast(
            context: context, massage: "Successfully changed password");
        print("Successfully changed password");
      }).catchError((error) {
        print("Password can't be changed" + error.toString());
      });
    } else {
      ToastMethod.simpleToast(
          context: context, massage: "valid old password Enter");
    }
  }
}
