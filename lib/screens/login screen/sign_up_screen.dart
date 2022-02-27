import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/screens/explore%20screen/explore_screen.dart';
import 'package:untitled/screens/login%20screen/login_types.dart';
import 'package:untitled/untils/app_fonts.dart';
import '../../config/app_colors.dart';
import '../../modal/authenticaion_model.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isPassword=true;

  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isShow = true;

  save() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLogin", true);
  }

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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LoginTypes()));
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
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 30, bottom: 16),
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
                            controller: email,
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
                        Text(
                          "Password",
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
                              if (password.text.length < 8) {
                                return 'Please Enter 8 Digits Password';
                              }
                            },
                            controller: password,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: colorBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            decoration:  InputDecoration(
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
                          height: 5,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        InkWell(
                          onTap: () async {
                            try {
                              if (_formKey.currentState!.validate()) {
                                AuthenticationHelper()
                                    .signUp(
                                        email: email.text,
                                        password: password.text)
                                    .then((result) {
                                  if (result == null) {save();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ExploreScreen()));
                                  Fluttertoast.showToast(
                                      msg: "SignUp Successfully",
                                      backgroundColor: Colors.green.withOpacity(0.7),
                                      textColor: Colors.white,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Account Already Exist",
                                        backgroundColor: Colors.white54,
                                        textColor: Colors.white,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1);
                                  }
                                });
                              }
                            } catch (e) {}
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
