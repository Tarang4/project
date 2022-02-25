import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../untils/app_colors.dart';
import '../../untils/app_fonts.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({Key? key}) : super(key: key);

  @override
  _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
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
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700),
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
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 30, top: 15),
                            child: Image.asset(
                              "assets/images/logo/logo2.png",
                              height: 120,
                              width: 120,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        IntlPhoneField(
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
                              "Verify With OTP",
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
    ),
            )));
  }
}
