// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animator/animation/animation_preferences.dart';
import 'package:flutter_animator/animation/animator_play_states.dart';
import 'package:flutter_animator/widgets/attention_seekers/bounce.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/screens/login%20screen/login_types.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Navigator.of(context).pushReplacement(
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: LoginTypes(),
              ),
            );
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
