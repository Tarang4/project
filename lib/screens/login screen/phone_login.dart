import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';
import '../explore screen/explore_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({Key? key}) : super(key: key);

  @override
  _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final focus = FocusNode();
  final TextEditingController digit1 = TextEditingController();
  final TextEditingController digit2 = TextEditingController();
  final TextEditingController digit3 = TextEditingController();
  final TextEditingController digit4 = TextEditingController();
  final TextEditingController digit5 = TextEditingController();
  final TextEditingController digit6 = TextEditingController();
  final TextEditingController otp = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  String? verificationId;
  String? number;
  int? forceResendingToken;

  save() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLogin", true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 0),
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1310,
                    ),
                    Card(
                      elevation: 8,
                      shadowColor: colorBlack,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 14, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome,",
                              style: defaultTextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "SnatchKart,",
                              style: defaultTextStyle(
                                  fontColors: colorGreen,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Sign in to Continue",
                              style: defaultTextStyle(
                                  fontSize: 14.0,
                                  fontColors: colorGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 30, top: 15),
                                child: Image.asset(
                                  "assets/images/logo/logo2.png",
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            IntlPhoneField(
                              cursorColor: colorGreen,
                              style: TextStyle(fontSize: 16),
                              disableLengthCheck: false,
                              textAlignVertical: TextAlignVertical.center,
                              dropdownTextStyle: TextStyle(fontSize: 16),
                              dropdownIcon: Icon(Icons.arrow_drop_down,
                                  color: colorGreen),
                              decoration: const InputDecoration(
                                hintText: 'Phone Number',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: colorGreen,
                                    width: 1,
                                  ),
                                ),
                              ),
                              initialCountryCode: 'IN',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                                number = phone.completeNumber.toString();
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                onTap: () async {
                                  await phoneSignIn(
                                      phoneNumber: number.toString());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 70,
                                  child: Text(
                                    "Get OTP",
                                    style: defaultTextStyle(
                                      fontColors: colorGreen,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 10),
                              child: OTPTextField(
                                length: 6,
                                width: 300,
                                fieldWidth: 43,
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                                textFieldAlignment:
                                MainAxisAlignment.spaceAround,
                                fieldStyle: FieldStyle.underline,
                                onCompleted: (pin) {
                                  print("Completed:" + pin);
                                  var otp = pin.toString();
                                  print(otp);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () async {
                                await _verifyOtp();

                              },
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: colorGreen,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Verify With OTP",
                                  style: defaultTextStyle(
                                    fontColors: colorWhite,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> phoneSignIn({required String phoneNumber}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        forceResendingToken: forceResendingToken,timeout: const Duration(seconds: 5),
        codeAutoRetrievalTimeout: _onCodeTimeout);
  }

  _onVerificationCompleted(AuthCredential authCredential) async {
    try {
      UserCredential user = await _auth.signInWithCredential(authCredential);
      User? currentUser = _auth.currentUser;
      if (user.user!.uid == currentUser!.uid) {
        save();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExploreScreen()));Fluttertoast.showToast(
            msg: "SignIn Successfully",
            backgroundColor: Colors.green.withOpacity(0.7),
            textColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1);
      }
    } catch (e) {}
  }

  _onVerificationFailed(FirebaseAuthException error) {
    print(error);
    if (error.code == 'invalid-phone-number') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('invalid phone number')));
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    this.forceResendingToken = forceResendingToken;
    print(forceResendingToken);
    print("code sent");
  }

  _onCodeTimeout(String verificationId) {
    return null;
  }

  _verifyOtp() {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId ?? "", smsCode: otp.text);
    _onVerificationCompleted(authCredential);
  }




}

class TextFieldEmailVerification extends StatelessWidget {
  final TextEditingController code;
  final String? last;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const TextFieldEmailVerification({
    Key? key,
    required this.code,
    this.last,
    this.onChanged,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        cursorHeight: 25,
        controller: code,
        textInputAction: TextInputAction.next,
        autofocus: true,
        onChanged: onChanged,
        focusNode: focusNode,
        cursorColor: Colors.black.withOpacity(0.5),
        style: const TextStyle(
            color: colorBlack, fontSize: 19, fontWeight: FontWeight.normal),
        maxLength: 1,
        scrollPadding: const EdgeInsets.only(bottom: 5, top: 5),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 7),
          counterText: '',
          hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          border:
          OutlineInputBorder(borderSide: BorderSide(color: colorLightGrey)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorGreen),
          ),
        ),
      ),
    );
  }
}