// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/screens/login%20screen/submit_screen2.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? check;
  bool isLogin = false;

  getMethod() async {
    final SharedPreferences sharePrefrences =
        await SharedPreferences.getInstance();
    isLogin = sharePrefrences.getBool("isLogin") ?? false;
    Timer(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => isLogin ? SubmitScreen2() : LoginScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    getMethod();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Text("Helloooooo"),
        ),
      ),
    );
  }
}
