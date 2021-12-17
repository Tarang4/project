import 'package:flutter/material.dart';
import 'package:untitled/untils/app_colors.dart';

import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 58, left: 16, bottom: 20, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 20,
                  margin: EdgeInsets.only(
                    bottom: 10,
                    top: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/images/Icon_Arrow-Left@3x.png",
                    height: 15,
                    width: 8,
                  ),
                ),
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
                        "Sign Up,",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      const Text(
                        "Name",
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
                          controller: _emailController,
                          textInputAction: TextInputAction.done,
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
                        height: 39,
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
                      SizedBox(
                        height: 60,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerificationScreen()));
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
            ],
          ),
        ),
      ),
    );
  }
}
