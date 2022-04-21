import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/user_side/untils/toast/flutter_toast_method.dart';
import '../../../admin/repository/admin_autho_repository.dart';
import '../../../admin/screens/admin_home_screen.dart';
import '../../../main.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';
import '../../untils/loading_dialog/dialog.dart';
import '../../untils/toast/toast_message.dart';
import 'forget_screen.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool isPassword = true;
  final loginScreenKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 0),
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.175,
              ),
              Form(
                key: loginScreenKey,
                child: Card(
                  elevation: 7,
                  shadowColor: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 14, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome To,",
                          style: defaultTextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "SnatchKart,",
                          style: defaultTextStyle(
                              fontColors: colorGreen,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Admin......",
                          style: defaultTextStyle(
                              fontSize: 14.0,
                              fontColors: colorGrey,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Admin Id",
                          style: defaultTextStyle(
                            fontColors: colorGrey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            // focusNode: emailFocus,
                            autofocus: true,
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
                          height: 39,
                        ),
                        Text("Admin Password",
                            style: defaultTextStyle(
                                fontColors: colorGrey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            obscureText: isPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Password';
                              }
                              if (passwordController.text.length < 8) {
                                return 'Please Enter 8 Digits Password';
                              }
                            },
                            controller: passwordController,
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
                                    ? Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : Icon(Icons.visibility_off,
                                        color: Colors.black),
                                onPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                              ),
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
                          height: 19,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => ForgetScreen(
                                            email: emailController.text,
                                          )));
                            },
                            child: Text(
                              "Forgot Password?",
                              style: defaultTextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InkWell(
                          onTap: () async {
                            if (loginScreenKey.currentState!.validate()) {
                              AdminAuthRepository.adminSignIn(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  adminId: '');
                            }
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
                              "VERIFY",
                              style: defaultTextStyle(
                                  fontColors: colorWhite,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/4.5,),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    children: [
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
