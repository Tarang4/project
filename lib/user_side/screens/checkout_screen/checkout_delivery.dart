import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';
import 'checkout_address.dart';

class CheckoutDelivery extends StatefulWidget {
  const CheckoutDelivery({Key? key}) : super(key: key);

  @override
  _CheckoutDeliveryState createState() => _CheckoutDeliveryState();
}

class _CheckoutDeliveryState extends State<CheckoutDelivery> {
  int grpValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        left: 16, right: 16, top: 32,bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Stack(
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
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width / 3,
                          color: colorGrey,
                        ),
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1.0, color: colorGrey)),
                              ),
                            ],
                          ),
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
                    margin: const EdgeInsets.only(left: 16,right: 16,bottom: 35),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Delivery"),
                        Text("Address"),
                        Text("Payments"),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 10),
                    child: Text(
                      "Standard Delivery",
                      style: defaultTextStyle(),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 34),
                          child: Text(
                            "Order will be delivered between 3 - 5 business days",
                            style: defaultTextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        alignment: Alignment.topCenter,
                        child: Radio(
                            value: 1,
                            activeColor: colorGreen,
                            groupValue: grpValue,
                            onChanged: (int? value) {
                              setState(() {
                                grpValue = value!;
                              });
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 10),
                    child: Text(
                      "Next Day Delivery",
                      style: defaultTextStyle(),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 34),
                          child: Text(
                            "Place your order before 6pm and your item will be deliverd at next day",
                            style: defaultTextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        alignment: Alignment.topCenter,
                        child: Radio(
                            value: 2,
                            activeColor: colorGreen,
                            groupValue: grpValue,
                            onChanged: (int? value) {
                              setState(() {
                                grpValue = value!;
                              });
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 10),
                    child: Text(
                      "Nominated Delivery",
                      style: defaultTextStyle(),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 34),
                          child: Text(
                            "Pick a particular date from calender and order will be delivered on selected date",
                            style: defaultTextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        alignment: Alignment.topCenter,
                        child: Radio(
                            value: 3,
                            activeColor: colorGreen,
                            groupValue: grpValue,
                            onChanged: (int? value) {
                              setState(() {
                                grpValue = value!;
                              });
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => CheckAddress()));
                    },
                    child: Container(
                      height: 50,
                      width: 146,
                      margin: const EdgeInsets.only(right: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colorGreen,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "CHECKOUT",
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
    );
  }
}
