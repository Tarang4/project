import 'package:flutter/material.dart';
import 'package:untitled/screens/login%20screen/login_screen.dart';
import 'package:untitled/screens/login%20screen/phone_login.dart';

import '../../untils/app_colors.dart';
import '../../untils/app_fonts.dart';

class LoginTypes extends StatefulWidget {
  const LoginTypes({Key? key}) : super(key: key);

  @override
  _LoginTypesState createState() => _LoginTypesState();
}

class _LoginTypesState extends State<LoginTypes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0),
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.175,
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
                            fontSize: 25.0, fontWeight: FontWeight.w700),
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
                          padding: const EdgeInsets.only(left: 15,right: 15,bottom: 30,top: 15),
                          child: Image.asset(
                            "assets/images/logo/logo2.png",
                            height: 120,
                            width: 120,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorWhite,
                            border:
                                Border.all(width: 0.8, color: colorGrey)),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                "assets/images/google-logo.png",
                              ),
                            ),
                            Text(
                              "Continue With Google",
                              style: defaultTextStyle(
                                fontColors: colorBlack,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorWhite,
                            border:
                                Border.all(width: 0.8, color: colorGrey)),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                "assets/images/logo-facebook.png",
                              ),
                            ),
                            Text(
                              "Continue With Facebook",
                              style: defaultTextStyle(
                                fontColors: colorBlack,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneLoginScreen()));
                          });
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colorWhite,
                              border:
                                  Border.all(width: 0.8, color: colorGrey)),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                  padding: EdgeInsets.all(8),
                                  child:Icon(Icons.phone)),
                              Text(
                                "Continue With Phone",
                                style: defaultTextStyle(
                                  fontColors: colorBlack,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          });
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
                            "Log in ",
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
    )));
  }
}
