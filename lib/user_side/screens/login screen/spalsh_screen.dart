// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/animation/animation_preferences.dart';
import 'package:flutter_animator/animation/animator_play_states.dart';
import 'package:flutter_animator/widgets/attention_seekers/bounce.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../explore screen/explore_screen.dart';
import 'all_type_screnn.dart';

bool? finalLogin;

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController scaleController;
//   late Animation<double> scaleAnimation;
//
//   Future getSharedPreferencesData() async {
//     bool? emailSd;
//
//     final SharedPreferences prefe = await SharedPreferences.getInstance();
//     emailSd = (prefe.getBool('isLogin') ?? false);
//     setState(() {
//       finalLogin = emailSd;
//     });
//     print(finalLogin);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     scaleController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1500),
//     )..addStatusListener(
//         (status) {
//           if (status == AnimationStatus.completed) {
//             getSharedPreferencesData().whenComplete(() async {
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                 builder: (context) =>
//                     finalLogin == false ? LoginTypes() : ExploreScreen(),
//               ));
//             });
//             Timer(
//               Duration(milliseconds: 300),
//               () {
//                 scaleController.reset();
//               },
//             );
//           }
//         },
//       );
//
//     scaleAnimation =
//         Tween<double>(begin: 0.0, end: 12).animate(scaleController);
//
//     Timer(Duration(seconds: 2), () {
//       setState(() {
//         scaleController.forward();
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     scaleController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colorWhite,
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Bounce(
//               preferences: AnimationPreferences(
//                 autoPlay: AnimationPlayStates.Forward,
//                 duration: Duration(milliseconds: 2000),
//               ),
//               child: Container(
//                 child: Image.asset(
//                   'assets/images/logo/logo2.png',
//                   height: 100,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 18,
//             ),
//             Container(
//                 child: Text("The Power Of SnatchKart",
//                     style: defaultTextStyle(
//                         fontColors: colorBlack,
//                         fontSize: 14.0,
//                         fontWeight: FontWeight.w400)))
//           ],
//         ),
//       ),
//     );
//   }
// }


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        loginStatus();

      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future loginStatus() async {
    bool? loginStatus = pref!.getBool(LocalStorageKey.isLogin);
    if (loginStatus != null && loginStatus == true) {
      Navigator.pushReplacement(context, PageTransition( ExploreScreen()));
    } else {
      Navigator.pushReplacement(context, PageTransition( LoginTypes()));
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorWhite,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'SnatchKart',
                  style: TextStyle(
                    color: colorGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _width / _containerSize,
                  width: _width / _containerSize,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // child: Image.asset('assets/images/file_name.png')
                  child: Image.asset("assets/images/logo/logo3.png")
              ),
            ),
          ),
        ],
      ),
    );
  }


}


class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 2000),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        parent: animation,
      );
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}
