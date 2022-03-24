import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';

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
    return Scaffold(body: SafeArea(child: SingleChildScrollView(
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
                        ],
                      ),
                      const SizedBox(
                        height: 10,
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
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        // onTap: () async {
                        //   if (loginScreenKey.currentState!.validate()) {
                        //     if (emailController.text ==
                        //         "Tarang00@gmail.com" &&
                        //         passwordController.text == "tarang8780") {
                        //       Navigator.pushReplacement(
                        //           context,
                        //           CupertinoPageRoute(
                        //               builder: (context) => AdminHome()));
                        //     } else {
                        //       AuthRepository.signIn(
                        //           context: context,
                        //           email: emailController.value.text,
                        //           password: passwordController.value.text);
                        //     }
                        //   }
                        // },
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),));
  }
}
