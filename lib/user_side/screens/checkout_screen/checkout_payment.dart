import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';

class CheckoutPayment extends StatefulWidget {
  const CheckoutPayment({Key? key}) : super(key: key);

  @override
  _CheckoutPaymentState createState() => _CheckoutPaymentState();
}

class _CheckoutPaymentState extends State<CheckoutPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(
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






      ],
    ),),);
  }
}
