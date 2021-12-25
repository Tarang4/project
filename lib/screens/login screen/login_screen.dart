import 'package:flutter/material.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:untitled/untils/app_fonts.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginScreenKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
  bool validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Welcome,",
                              style: defaultTextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Sign",
                              style: defaultTextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  fontColors: colorGreen),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Sign in to Continue",
                            style: defaultTextStyle(
                                fontSize: 14.0,
                                fontColors: colorGrey,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 40,
                        ),
                        Text("Email",
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
                            focusNode: emailFocus,
                            autofocus: true,
                            validator: (value) {
                              if (!EmailValidator.validate(value ?? "")) {
                                return 'Enter valid email';
                              }
                            },
                            controller: _emailController,
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
                        Text("Password",
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
                            obscureText: true,
                            controller: _passwordController,
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
                          height: 19,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: defaultTextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InkWell(
                          onTap: () {
                            if (loginScreenKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));

                              if (_passwordController.text.length > 7) {}
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
                              "SIGN IN",
                              style: defaultTextStyle(
                                  fontColors: colorWhite,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Align(
                child: Text("-OR-",
                    style: defaultTextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              const SizedBox(
                height: 43,
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 1, color: colorLightGrey)),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/Group 335@3x.png",
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 53.5,
                      ),
                      Text("Sign In with Facebook",
                          style: defaultTextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14.0)),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 1, color: colorLightGrey)),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/Group 336@3x.png",
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 53.5,
                      ),
                      Text("Sign In with Google",
                          style: defaultTextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14.0)),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
