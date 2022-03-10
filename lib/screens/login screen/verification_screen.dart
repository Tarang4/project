import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/config/shared_preference_data.dart';
import 'package:untitled/screens/login%20screen/edit_profile_screnn.dart';
import '../../config/app_colors.dart';
import '../../repository/auth/auth_reposetory.dart';
import '../../untils/app_fonts.dart';
import '../../untils/loading_dialog/dialog.dart';
import '../../untils/toast/toast_message.dart';

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
        padding: const EdgeInsets.all(28.0),
        child: Column(children: [
          const SizedBox(
            height: 120,
          ),
          Text(
            "Otp",
            style: TextStyle(
                fontSize: 14.0,
                color: colorGrey,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 33,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your otp';
                }
              },
              controller: otpController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              style: const TextStyle(
                  color: colorBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorLightGrey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: colorGreen),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () async {
              PhoneAuthCredential phoneAuthCredential =
              PhoneAuthProvider.credential(
                  verificationId: verificationId!,
                  smsCode:
                  otpController.text.toString().trim());
              signInWithPhoneAuthCredential(phoneAuthCredential);

            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colorGreen,
              ),
              alignment: Alignment.center,
              child: Text(
                "SIGN IN",
                style: defaultTextStyle(
                    fontColors: colorWhite,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],),
      ),
    );



  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    showLoadingDialog(context: context);
    try {
      await FirebaseAuth.instance
          .signInWithCredential(phoneAuthCredential)
          .then((authResult) {
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
