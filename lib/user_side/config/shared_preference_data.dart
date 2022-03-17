import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Localstorage_string.dart';
import 'Localstorage_string.dart';


class SharedPreferenceUsers {

  static saveData({
     BuildContext? context,
     String? firstName,
     String? id,
     String? email,
     String? password,
     String? lastName,
     bool? isLogin,
     String? profilePhoto,
     String? phone,
     String? gender,
    // @required String? addStreet,
    // @required String? addCity,
    // @required String? addStreetNo,
    // @required String? wishList,
    // @required String? addPinCode,
    //card
    // @required String? cname,
    // @required String? cExpDate,
    // @required String? cNo,
    // @required String? cvv,
  }) async {
    SharedPreferences? pref=await SharedPreferences.getInstance();

    if (email != "" || email != null) {
      pref.setString(LocalStorageKey.email, email!);
    }
    if (id != "" || id != null) {
      pref.setString(LocalStorageKey.userId, id!);
    }
    if (firstName != "" || firstName != null) {
      pref.setString(LocalStorageKey.firstName, firstName!);
    }
    if (lastName != "" || lastName != null) {
      pref.setString(LocalStorageKey.lastName, lastName!);
    }
    if ( isLogin != null) {
      pref.setBool(LocalStorageKey.isLogin, isLogin);
      //card

    }
    // if (addStreetNo != "" || addStreetNo != null) {
    //   pref.setString(LocalStorageKey.addStreetNo, addStreetNo!);
    // }
    // if (addStreet != "" || addStreet != null) {
    //   pref.setString(LocalStorageKey.addStreet, addStreet!);
    // }
    // if (addPinCode != "" || addPinCode != null) {
    //   pref.setString(LocalStorageKey.addPinCode, addPinCode!);
    // }
    // if (addCity != "" || addCity != null) {
    //   pref.setString(LocalStorageKey.addCity, addCity!);
    // }
    if (password != "" || password != null) {
      pref.setString(LocalStorageKey.password, password!);
    }
    if (gender != "" || gender != null) {
      pref.setString(LocalStorageKey.gender, gender!);
    }
    if (phone != "" || phone != null) {
      pref.setString(LocalStorageKey.phone, phone!);
    }
    if (profilePhoto != "" || profilePhoto != null) {
      pref.setString(LocalStorageKey.profilePhoto, profilePhoto!);
    }
    // if (wishList != "" || wishList != null) {
    //   pref.setString(LocalStorageKey.wishList, wishList!);
    // }

    // if (cname != "" || cname != null) {
    //   pref.setString(LocalStorageCardKey.cname, cname!);
    // }
    // if (cExpDate != "" || cExpDate != null) {
    //   pref.setString(LocalStorageCardKey.cExpDate, cExpDate!);
    // }
    // if (cNo != "" || cNo != null) {
    //   pref.setString(LocalStorageCardKey.cNo, cNo!);
    // }
    // if (cvv != "" || cvv != null) {
    //   pref.setString(LocalStorageCardKey.cvv, cvv!);
    // }
  }

  retrieveData() {

  }

}
