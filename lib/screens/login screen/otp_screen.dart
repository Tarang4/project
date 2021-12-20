import 'package:flutter/material.dart';
import 'package:untitled/screens/login%20screen/login_screen.dart';
import 'package:untitled/untils/app_colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16, bottom: 20, right: 15),
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFieldEmailVerification(
                              code: text1,
                            ),
                            TextFieldEmailVerification(
                              code: text2,
                            ),
                            TextFieldEmailVerification(
                              code: text3,
                            ),
                            TextFieldEmailVerification(
                              code: text4,
                            ),
                            TextFieldEmailVerification(
                              code: text5,
                            ),
                            TextFieldEmailVerification(
                              code: text6,
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

class TextFieldEmailVerification extends StatelessWidget {
  final TextEditingController code;

  const TextFieldEmailVerification({
    Key? key,
    required this.code,
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
          onChanged: (v){
            do {
              FocusScope.of(context).nextFocus();
            } while (FocusScope.of(context).focusedChild?.context?.widget is! EditableText);

          },
            cursorColor: Colors.black.withOpacity(0.5),
          style: const TextStyle(
              color: colorBlack, fontSize: 19, fontWeight: FontWeight.normal),
          maxLength: 1,
          scrollPadding: EdgeInsets.only(bottom: 5, top: 5),
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
