import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/checkout_screen/checkout_delivery.dart';
import 'package:untitled/screens/checkout_screen/checkout_payment.dart';
import 'package:untitled/config/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';

class CheckAddress extends StatefulWidget {
  const CheckAddress({Key? key}) : super(key: key);

  @override
  _CheckAddressState createState() => _CheckAddressState();
}

class _CheckAddressState extends State<CheckAddress> {
  bool adress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/45),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 18,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                    Text(
                      "Checkout",
                      style: defaultTextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
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
                                border: Border.all(
                                    width: 1.0, color: colorGreen)),
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
                                  color: colorGreen,
                                  shape: BoxShape.circle),
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
                                border: Border.all(
                                    width: 1.0, color: colorGreen)),
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
                                  color: colorGreen,
                                  shape: BoxShape.circle),
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
                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 35),
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
                    Transform.scale(
                      scale: 1.1,
                      child: Checkbox(
                          activeColor: colorGreen,
                          side: const BorderSide(color: colorGrey),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          value: adress,
                          onChanged: (value) {
                            setState(() {
                              adress = !adress;
                            });
                          }),
                    ),
                    Text(
                      "Billing address is the same as delivery address",
                      style: defaultTextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 15),
                  child: Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/35,),
                      Text(
                        "Street 1",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      TextFormField(
                        cursorColor: colorGrey,
                        cursorHeight: 22,
                        cursorWidth: 1.2,
                        textInputAction: TextInputAction.next,
                        style: defaultTextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Text(
                        "Street 2",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      TextFormField(
                        cursorColor: colorGrey,
                        cursorHeight: 22,
                        cursorWidth: 1.2,
                        textInputAction: TextInputAction.next,
                        style: defaultTextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Text(
                        "City",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      TextFormField(
                        cursorColor: colorGrey,
                        cursorHeight: 22,
                        cursorWidth: 1.2,
                        textInputAction: TextInputAction.next,
                        style: defaultTextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "State",
                                  style: defaultTextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      fontColors: colorGrey),
                                ),
                                TextFormField(
                                  cursorColor: colorGrey,
                                  cursorHeight: 22,
                                  cursorWidth: 1.2,
                                  textInputAction: TextInputAction.next,
                                  style: defaultTextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400),
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: colorGrey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 25),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Country",
                                  style: defaultTextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      fontColors: colorGrey),
                                ),
                                TextFormField(
                                  cursorColor: colorGrey,
                                  cursorHeight: 22,
                                  cursorWidth: 1.2,
                                  textInputAction: TextInputAction.done,
                                  style: defaultTextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400),
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: colorGrey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/8,),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const CheckoutDelivery()));
                        },
                        child: Container(
                          height: 50,
                          width: 146,
                          margin: const EdgeInsets.only(left: 32),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: colorGreen),
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
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const CheckoutPayment()));
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
                            "NEXT",
                            style: defaultTextStyle(
                                fontColors: colorWhite,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
