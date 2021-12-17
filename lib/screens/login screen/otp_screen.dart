import 'package:flutter/material.dart';
import 'package:untitled/screens/login%20screen/login_screen.dart';
import 'package:untitled/untils/app_colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 88, left: 16, bottom: 20, right: 15),
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
                      "Verification,",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Text(
                        "A 6 - Digit PIN has been sent to your email address, enter it below to continue",
                        style: TextStyle(
                            fontSize: 14,
                            color: colorGrey,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 57, bottom: 65),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                        6,
                        (index) => Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: colorLightGrey),
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        )),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.height,
                        color: colorGreen,
                        alignment: Alignment.center,
                        child: const Text(
                          "CONTINUE",
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
    );
  }
}
