import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';

class FinalPayment extends StatefulWidget {
 final int? total;
   const FinalPayment({Key? key, this.total}) : super(key: key);

  @override
  State<FinalPayment> createState() => _FinalPaymentState();
}

class _FinalPaymentState extends State<FinalPayment> {
  bool isCard=false;

  bool isCOD=false;

  bool isNET=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite.withOpacity(0.1),
        centerTitle: true,
        title: Text(
          "Checkout",
          style: defaultTextStyle(
              fontSize: 20.0,
              fontColors: colorBlack,
              fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 17,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 32, bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                Border.all(width: 1.0, color: colorGreen)),
                          ),
                          Positioned(
                            right: 5,
                            left: 5,
                            top: 5,
                            bottom: 5,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                  color: colorGreen, shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width / 3,
                        color: colorGreen,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                Border.all(width: 1.0, color: colorGreen)),
                          ),
                          Positioned(
                            right: 5,
                            left: 5,
                            top: 5,
                            bottom: 5,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                  color: colorGreen, shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width / 3,
                        color: colorGrey,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1.0, color: colorGrey)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Delivery"),
                      Text("Address"),
                      Text("Payments"),
                    ],
                  ),
                ),

                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _sizeClick(
                              one: true,
                              two: false,
                              three: false,
                            );
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 60,
                          margin:
                          const EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isCard == true
                                  ? colorGreen
                                  : colorLightGrey,
                              width: 0.6,
                            ),
                          ),
                          child: Text(
                            "card",
                            style: defaultTextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13.00,
                                fontColors: isCard == true
                                    ? colorBlack
                                    : colorGrey),
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _sizeClick(
                              one: false,
                              two: true,
                              three: false,
                            );
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 60,
                          margin:
                          const EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isCOD == true
                                  ? colorGreen
                                  : colorLightGrey,
                              width: 0.6,
                            ),
                          ),
                          child: Text(
                            "cod",
                            style: defaultTextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13.00,
                                fontColors: isCOD == true
                                    ? colorBlack
                                    : colorGrey),
                          ),
                        )),GestureDetector(
                        onTap: () {
                          setState(() {
                            _sizeClick(
                              one: false,
                              two: false,
                              three: true,
                            );
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 60,
                          margin:
                          const EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isNET == true
                                  ? colorGreen
                                  : colorLightGrey,
                              width: 0.6,
                            ),
                          ),
                          child: Text(
                            "net",
                            style: defaultTextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13.00,
                                fontColors: isNET == true
                                    ? colorBlack
                                    : colorGrey),
                          ),
                        )),




                  ],
                ),
                Container(height: 500,color: colorGrey,),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 146,
                            margin: const EdgeInsets.only(left: 32),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: colorGreen),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "BACK",
                              style: defaultTextStyle(
                                  fontColors: colorBlack,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {

                          },
                          child: Container(
                            height: 50,
                            width: 146,
                            margin: const EdgeInsets.only(right: 32),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: colorGreen,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Final select",
                              style: defaultTextStyle(
                                  fontColors: colorWhite,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  _sizeClick({
    bool one = false,
    bool two = false,
    bool three = false,

  }) {
    setState(() {
      isCard = one;
      isCOD = two;
      isNET = three;

    });
  }
}
