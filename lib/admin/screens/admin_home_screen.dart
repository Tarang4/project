import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/screens/notification_screen_addmin.dart';
import 'package:untitled/admin/screens/product_edit.dart';
import 'package:untitled/user_side/untils/toast/flutter_toast_method.dart';

import '../../main.dart';
import '../../user_side/config/Localstorage_string.dart';
import '../../user_side/config/app_colors.dart';
import '../../user_side/repository/auth/auth_reposetory.dart';
import '../../user_side/screens/login screen/all_type_screnn.dart';
import '../../user_side/untils/app_fonts.dart';
import 'notification_add_admin.dart';
import 'order_history.dart';
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
                      logOutAlert();
                    },
                    child: const Icon(Icons.logout))
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => const ProductEdit()));
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset("assets/images/icons/search.png",height: 110,)
                              ),
                            ),
                            Text(
                              "Product Edit",
                              style: defaultTextStyle(
                                  fontSize: 15.0,
                                  fontColors: colorBlack,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => const CustomerDetails()));
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/icons/team.png",height: 110,)
                              ),
                            ),
                            Text(
                              "User Information",
                              style: defaultTextStyle(
                                  fontSize: 15.0,
                                  fontColors: colorBlack,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => const OrderHistory()));
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset("assets/images/icons/online-shopping.png",height: 110,)
                              ),
                            ),
                            Text(
                              "Order History",
                              style: defaultTextStyle(
                                  fontSize: 15.0,
                                  fontColors: colorBlack,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => const NotificationAdminScreen()));
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset("assets/images/icons/gift.png",height: 110,)
                              ),
                            ),
                            Text(
                              "Nottification",
                              style: defaultTextStyle(
                                  fontSize: 15.0,
                                  fontColors: colorBlack,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Powered by ',
                                style: defaultTextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 10.0,
                                    fontColors: colorGrey)),
                            TextSpan(
                                text: 'SnatchKart',
                                style: defaultTextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.0,
                                    fontColors: colorGreen)),
                          ]),
                        ),
                      ),
                    )
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
  logOutAlert() {
    AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.NO_HEADER,
        body: const Center(
          child: Text(
            "Are you sure want to Log Out ?",
            style: TextStyle(fontSize: 15),
          ),
        ),
        btnOkOnPress: () {
          pref!.setBool("isAdminLigIn", false);
          Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                  builder: (context) => const LoginTypes()));
        },
        btnCancelOnPress: () {})
        .show();
  }
}
