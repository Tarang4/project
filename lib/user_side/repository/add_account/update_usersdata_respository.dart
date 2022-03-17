import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../config/FireStore_string.dart';
import '../../config/Localstorage_string.dart';
import '../../untils/toast/flutter_toast_method.dart';

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
      "profilePhoto": profilePhoto,
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

      debugPrint('yes update');
    } else {
      ToastMethod.simpleToast(context: context, massage: "No update.");

      debugPrint('No update');
    }
  }




}
