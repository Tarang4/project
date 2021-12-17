import 'package:flutter/material.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:email_validator/email_validator.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 15.53,
              bottom: MediaQuery.of(context).size.height / 5.76,
              left: 16,
              right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(key: loginScreenKey,
                child: Card(
                  elevation: 6.8,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 14, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Welcome,",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sign",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: colorGreen,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Sign in Continue",
                          style: TextStyle(
                              fontSize: 14,
                              color: colorGrey,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 14,
                              color: colorBlack,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            validator: (value) {
                              if (!EmailValidator.validate(value ?? "")) {
                                return 'Enter valid email';
                              }
                            },
                            controller: _emailController,
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
                          height: 39,
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 14,
                              color: colorBlack,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.infinity,
                          height: 33,

                          child: TextFormField(
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
                          height: 5,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 14,
                                color: colorBlack,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        InkWell(
                          onTap: () {

                            if (loginScreenKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            }


                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.height,
                            color: colorGreen,
                            alignment: Alignment.center,
                            child: const Text(
                              "SIGN IN",
                              style: TextStyle(color: colorWhite),
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
                child: Text(
                  "-OR-",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 50),
                  decoration: BoxDecoration(
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
                      const Text(
                        "Sign In with Facebook",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
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
                      border: Border.all(width: 1, color: colorLightGrey)),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/Group 336@3x.png",
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 53.5,
                      ),
                      const Text(
                        "Sign In with Facebook",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
