import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/screens/product_edit.dart';
import 'package:untitled/user_side/untils/toast/flutter_toast_method.dart';

import '../../main.dart';
import '../../user_side/config/Localstorage_string.dart';
import '../../user_side/config/app_colors.dart';
import '../../user_side/screens/login screen/all_type_screnn.dart';
import '../../user_side/untils/app_fonts.dart';
import 'customerDetails.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  bool isVerification = false;

  Timer? timer;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: colorWhite,
              title: Text(
                "Admin Side",
                style: defaultTextStyle(
                    fontSize: 23.0,
                    fontColors: colorBlack,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      pref!.setBool("isAdminLigIn", false);
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const LoginTypes()));
                    },
                    child: Text(
                      'LogOut  ${pref!.getBool("isAdminLigIn").toString()}',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(FirebaseAuth.instance.currentUser!.email.toString()),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ProductEdit()));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorGrey.withOpacity(0.3),
                        ),
                        child: Text(
                          "Product Edit",
                          style: defaultTextStyle(
                              fontSize: 20.0,
                              fontColors: colorBlack,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => CustomerDetails()));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorGrey.withOpacity(0.3),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "User Information",
                          style: defaultTextStyle(
                              fontSize: 20.0,
                              fontColors: colorBlack,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // if (!isVerification) {
    //   sendVerificationEmail();
    //   timer = Timer.periodic(const Duration(seconds: 20), (_) {
    //     checkEmailVerified();
    //   });
    // }
  }

  sendVerificationEmail() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await user?.sendEmailVerification().then((value) {});
      ToastMethod.simpleToast(massage: "link send");
    } catch (e) {
      debugPrint("error: $e");

      ToastMethod.simpleToast(massage: "link not send $e");
    }
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerification = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isVerification) timer?.cancel();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   timer?.cancel();
  //
  //   super.dispose();
  // }
}
