import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:untitled/user_side/screens/login%20screen/verification_screen.dart';
import '../../config/app_colors.dart';
import '../../controller/auth/signup_controller.dart';
import '../../untils/app_fonts.dart';
import '../../untils/toast/flutter_toast_method.dart';
import 'all_type_screnn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final SignupController _controller = Get.put(SignupController());

  bool isPassword = true;
  String? number;

  TextEditingController password2Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String phoneController = '';
  TextEditingController password1Controller = TextEditingController();

  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16, bottom: 20, right: 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LoginTypes()));
                  },
                  child: Container(
                      width: 20,
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        top: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Icon(Icons.arrow_back)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 20, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up,",
                          style: defaultTextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Text(
                          "Email",
                          style: defaultTextStyle(
                              fontSize: 14.0,
                              fontColors: colorGrey,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            validator: (value) {
                              if (!EmailValidator.validate(value ?? "")) {
                                return 'Enter valid email';
                              }
                            },
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: colorBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Enter Phone Number",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: colorGrey,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        IntlPhoneField(
                          cursorColor: colorGreen,
                          style: const TextStyle(fontSize: 16),
                          disableLengthCheck: false,
                          textAlignVertical: TextAlignVertical.center,
                          dropdownTextStyle: const TextStyle(fontSize: 16),
                          dropdownIcon:
                              const Icon(Icons.arrow_drop_down, color: colorGreen),
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
                            phoneController = phone.completeNumber.toString();
                          },
                        ),
                        Text(
                          "Enter Password",
                          style: defaultTextStyle(
                              fontSize: 14.0,
                              fontColors: colorGrey,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Password';
                              }
                              if (password2Controller.text.length < 8) {
                                return 'Please Enter 8 Digits Password';
                              }
                            },
                            controller: password2Controller,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: colorBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            decoration: const InputDecoration(

                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Conform Password",
                          style: defaultTextStyle(
                              fontSize: 14.0,
                              fontColors: colorGrey,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            obscureText: isPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Password';
                              }
                              if (password1Controller.text.length < 8) {
                                return 'Please Enter 8 Digits Password';
                              }
                            },
                            controller: password1Controller,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: colorBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: isPassword
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : const Icon(Icons.visibility_off,
                                        color: Colors.black),
                                onPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate() == true) {
                              FocusScope.of(context).unfocus();
                              print(
                                  "check value -- ${_controller.checkBoxValue.value}");
                              if (password1Controller.text==password2Controller.text) {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          OtpVerificationScreen(
                                            email: emailController.text,
                                            phoneNumber: phoneController,
                                            password: password1Controller.text,
                                            isSignUp: true,
                                          )));
                              } else {
                                ToastMethod.simpleToast(massage: "Enater Same Password");
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.height,
                            color: colorGreen,
                            alignment: Alignment.center,
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(color: colorWhite),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/10.5,),
                Align(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
