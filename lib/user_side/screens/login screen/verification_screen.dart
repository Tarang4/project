import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../config/shared_preference_data.dart';
import '../../repository/auth/auth_reposetory.dart';
import '../../untils/app_fonts.dart';
import '../../untils/loading_dialog/dialog.dart';
import '../../untils/toast/flutter_toast_method.dart';
import '../../untils/toast/toast_message.dart';
import 'edit_profile_screnn.dart';
import 'opt_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String? phoneNumber;
  final String? name;
  final String? email;
  final String? password;
  final bool? isSignUp;

  const OtpVerificationScreen({Key? key, this.phoneNumber, this.name, this.email, this.password, this.isSignUp}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final focus = FocusNode();
  final TextEditingController text1 = TextEditingController();
  final TextEditingController text2 = TextEditingController();
  final TextEditingController text3 = TextEditingController();
  final TextEditingController text4 = TextEditingController();
  final TextEditingController text5 = TextEditingController();
  final TextEditingController text6 = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();
  String? otp;


  String? verificationId;
  final TextEditingController otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void initState() {
    // print("phone number is ${widget.mobileNumber}");
    phoneSignIn(phoneNumber: widget.phoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 20, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 20,
                margin: const EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                ),
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/images/Icon_Arrow-Left@3x.png",
                  height: 15,
                  width: 8,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Card(
              elevation: 6.8,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 14, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verification",
                      style: defaultTextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        "A 6 - Digit PIN has been sent to your email address, enter it below to continue",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontColors: colorGrey,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 57, bottom: 65),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFieldOtpVerification(
                              focusNode: focusNode1,
                              code: text1,
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusNode2);
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode1);
                                }
                              },
                            ),
                            TextFieldOtpVerification(
                              focusNode: focusNode2,
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusNode3);
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode1);
                                }
                              },
                              code: text2,
                            ),
                            TextFieldOtpVerification(
                              focusNode: focusNode3,
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusNode4);
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode2);
                                }
                              },
                              code: text3,
                            ),
                            TextFieldOtpVerification(
                              focusNode: focusNode4,
                              code: text4,
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusNode5);
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode3);
                                }
                              },
                            ),
                            TextFieldOtpVerification(
                              focusNode: focusNode5,
                              code: text5,
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusNode6);
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode4);
                                }
                              },
                            ),
                            TextFieldOtpVerification(
                              focusNode: focusNode6,
                              code: text6,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode5);
                                }
                              },
                            ),
                          ]),
                    ),
                    InkWell(
                      onTap: () {
                         otp = text1.text +
                            text2.text +
                            text3.text +
                            text4.text +
                            text5.text +
                            text6.text;
                        print(otp);
                        ToastMethod.simpleToast(massage: "OTP:$otp:");
                        PhoneAuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId!,
                            smsCode:
                            otp.toString().trim());
                        signInWithPhoneAuthCredential(phoneAuthCredential);


                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: colorGreen,
                            borderRadius: BorderRadius.circular(4)),
                        alignment: Alignment.center,
                        child: Text(
                          "CONTINUE",
                          style: defaultTextStyle(
                              fontSize: 14.0,
                              fontColors: colorWhite,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );



  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    showLoadingDialog(context: context);
    try {
      await FirebaseAuth.instance
          .signInWithCredential(phoneAuthCredential)
          .then(( authResult) {
        if (authResult.user != null) {
          hideLoadingDialog(context: context);

          if(widget.isSignUp == true){
            print("is Signup --------------------------------------------------------");
            AuthRepository.signup(
                context: context,
                name: widget.name,
                email: widget.email,
                phone: widget.phoneNumber,
                password: widget.password);
          } else{
            print("is login----------------------------------------------------");
            // pref!.setBool(PrefString.isLogin, true);
            SharedPreferenceUsers.saveData( isLogin: true);
            Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(
                    builder: (context) => const EditProfileScreen()),(route) => false);
          }
        }
        // print(_firebaseUser.toString());
      });
    } on FirebaseAuthException catch (e) {
      hideLoadingDialog(context: context);
      if (e.code == "invalid-verification-code") {
        ToastMessage.errorToast(context: context, description: "Invalid OTP");
      } else {
        ToastMessage.errorToast(context: context, description: "Invalid OTP");
      }
    }
  }

  Future<void> phoneSignIn({@required String? phoneNumber}) async {
    // showLoadingDialog(context: context);
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber.toString(),
        verificationCompleted: (phoneAuthCredential) {
          // hideLoadingDialog(context: context);
        },
        verificationFailed: (verificationFailed) {
          // hideLoadingDialog(context: context);
          ToastMessage.errorToast(
              context: context, description: verificationFailed.message);
        },
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            // hideLoadingDialog(context: context);
            this.verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }
}
