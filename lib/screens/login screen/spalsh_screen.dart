// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/animation/animation_preferences.dart';
import 'package:flutter_animator/animation/animator_play_states.dart';
import 'package:flutter_animator/widgets/attention_seekers/bounce.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/screens/explore%20screen/explore_screen.dart';
import 'package:untitled/screens/login%20screen/login_types.dart';
import 'package:untitled/untils/app_fonts.dart';

import '../../config/app_colors.dart';

bool? finalLogin;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  Future getSharedPreferencesData() async {
    bool? emailSd;

    final SharedPreferences prefe = await SharedPreferences.getInstance();
    emailSd = (prefe.getBool('isLogin') ?? false);
    setState(() {
      finalLogin = emailSd;
    });
    print(finalLogin);
  }

  @override
  void initState() {
    super.initState();
    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            getSharedPreferencesData().whenComplete(() async {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    finalLogin == false ? LoginTypes() : ExploreScreen(),
              ));
            });
            Timer(
              Duration(milliseconds: 300),
              () {
                scaleController.reset();
              },
            );
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(Duration(seconds: 2), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Bounce(
              preferences: AnimationPreferences(
                autoPlay: AnimationPlayStates.Forward,
                duration: Duration(milliseconds: 2000),
              ),
              child: Container(
                child: Image.asset(
                  'assets/images/logo/logo2.png',
                  height: 100,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
                child: Text("The Power Of SnatchKart",
                    style: defaultTextStyle(
                        fontColors: colorBlack,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400)))
          ],
        ),
      ),
    );
  }
}
