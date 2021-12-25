import 'package:flutter/material.dart';
import 'package:untitled/screens/login%20screen/login_screen.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final focus = FocusNode();
  final TextEditingController text1 = TextEditingController();
  final TextEditingController text2 = TextEditingController();
  final TextEditingController text3 = TextEditingController();
  final TextEditingController text4 = TextEditingController();
  final TextEditingController text5 = TextEditingController();
  final TextEditingController text6 = TextEditingController();
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 20, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 20,
                margin: const EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                ),
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/images/Icon_Arrow-Left@3x.png",
                  height: 15,
                  width: 8,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
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
                      "Verification",
                      style: defaultTextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        "A 6 - Digit PIN has been sent to your email address, enter it below to continue",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontColors: colorGrey,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 57, bottom: 65),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFieldEmailVerification(
                              focusNode: focusNode1,
                              code: text1,
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusNode2);
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode1);
                                }
                              },
                            ),
                            TextFieldEmailVerification(
                              focusNode: focusNode2,
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusNode3);
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode1);
                                }
                              },
                              code: text2,
                            ),
                            TextFieldEmailVerification(
                              focusNode: focusNode3,
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusNode4);
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode2);
                                }
                              },
                              code: text3,
                            ),
                            TextFieldEmailVerification(
                              focusNode: focusNode4,
                              code: text4,
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusNode5);
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode3);
                                }
                              },
                            ),
                            TextFieldEmailVerification(
                              focusNode: focusNode5,
                              code: text5,
                              onChanged: (value) {
                                FocusScope.of(context).requestFocus(focusNode6);
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode4);
                                }
                              },
                            ),
                            TextFieldEmailVerification(
                              focusNode: focusNode6,
                              code: text6,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode5);
                                }
                              },
                            ),
                          ]),
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
                        decoration: BoxDecoration(
                            color: colorGreen,
                            borderRadius: BorderRadius.circular(4)),
                        alignment: Alignment.center,
                        child: Text(
                          "CONTINUE",
                          style: defaultTextStyle(
                              fontSize: 14.0,
                              fontColors: colorWhite,
                              fontWeight: FontWeight.w400),
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

class TextFieldEmailVerification extends StatelessWidget {
  final TextEditingController code;
  final String? last;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const TextFieldEmailVerification({
    Key? key,
    required this.code,
    this.last,
    this.onChanged,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        child: TextFormField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          cursorHeight: 25,
          controller: code,
          textInputAction: TextInputAction.next,
          autofocus: true,
          onChanged: onChanged,
          focusNode: focusNode,
          cursorColor: Colors.black.withOpacity(0.5),
          style: const TextStyle(
              color: colorBlack, fontSize: 19, fontWeight: FontWeight.normal),
          maxLength: 1,
          scrollPadding: const EdgeInsets.only(bottom: 5, top: 5),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(top: 7),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: colorLightGrey)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorGreen),
            ),
          ),
        ));
  }
}
