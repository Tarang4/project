import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/untils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Container(color: colorGreen,)));
  }
}