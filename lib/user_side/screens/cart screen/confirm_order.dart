import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:untitled/user_side/screens/checkout_screen/checkout_address.dart';
import 'package:untitled/user_side/screens/checkout_screen/checkout_delivery.dart';
import 'package:untitled/user_side/untils/app_fonts.dart';

import '../../config/app_colors.dart';

class ConfirmOrder extends StatefulWidget {
  int? total;

  ConfirmOrder({Key? key, this.total}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  double? gst;
  double? finalprice;
  final TextEditingController _cupponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    gst = ((18 * widget.total!) / 100);
    finalprice = gst! + double.parse(widget.total.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite.withOpacity(0.1),
        centerTitle: true,
        title: Text(
          "Confirm Order",
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 350,
                  width: 350,
                  margin: const EdgeInsets.only(left: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        offset: Offset(10, 10),
                        spreadRadius: 5,
                        blurRadius: 5,
                        color: colorLightGrey)
                  ]),
                  child: Image.asset(
                    "assets/images/invoice.png",
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 17,
            ),
            Container(
              height: 234,
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorWhite,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(5, 5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        color: colorLightGrey)
                  ]),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Row(
                      children: [
                        Container(
                          width: 240,
                          margin: EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.all(1),
                          child: TextFormField(
                            cursorColor: colorGreen,
                            cursorHeight: 18,
                            cursorWidth: 1.2,
                            maxLength: 10,
                            inputFormatters: [
                              UpperCaseTextFormatter(),
                            ],
                            textInputAction: TextInputAction.next,
                            style: defaultTextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                              counterText: "",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: colorGreen, // background
                            ),
                            onPressed: () {},
                            child: Text(
                              "APPLY",
                              style: defaultTextStyle(
                                  fontSize: 12.0,
                                  fontColors: colorWhite,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "TOTAL",
                          style: defaultTextStyle(fontColors: colorBlack,fontWeight: FontWeight.w300),
                        ),
                        const Spacer(),
                        Text(
                          widget.total.toString(),
                          style: defaultTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "GST",
                          style: defaultTextStyle(fontColors: colorBlack,fontWeight: FontWeight.w300),
                        ),
                        const Spacer(),
                        Text(
                          gst.toString(),
                          style: defaultTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 15),
                    child: Row(
                      children: [
                        Text(
                          "DISCOUNT",
                          style: defaultTextStyle(fontColors: colorBlack,fontWeight: FontWeight.w300),
                        ),
                        const Spacer(),
                        Text(
                          widget.total.toString(),
                          style: defaultTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: Colors.black,
                    dashGradient: [colorGrey, colorGreen],
                    dashRadius: 0.0,
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "SUB TOTAL",
                          style: defaultTextStyle(),
                        ),
                        const Spacer(),
                        Text(
                          finalprice.toString(),
                          style: defaultTextStyle(),
                        ),
                      ],
                    ),
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
                              builder: (context) => CheckoutDelivery()));
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
