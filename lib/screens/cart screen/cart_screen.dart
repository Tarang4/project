import 'package:flutter/material.dart';
import 'package:untitled/modal/product_modal.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartModel> cartList = [
    CartModel(
        cartImage: "assets/images/cart1.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
    CartModel(
        cartImage: "assets/images/cart1.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
    CartModel(
        cartImage: "assets/images/cart1.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
    CartModel(
        cartImage: "assets/images/cart1.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
    CartModel(
        cartImage: "assets/images/cart1.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
    CartModel(
        cartImage: "assets/images/cart1.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
    CartModel(
        cartImage: "assets/images/cart1.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
    CartModel(
        cartImage: "assets/images/cart1.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (BuildContext context, index) {
                  CartModel cartModel = cartList[index];
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: colorGreen,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 12,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "No Fillter Applied",
                  style: defaultTextStyle(fontSize: 14.0),
                ),
                Container(
                  height: 50,
                  width: 146,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: colorGreen,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "FILTER",
                    style: defaultTextStyle(fontColors: colorWhite,fontSize: 14.0,fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          )

        ],
      )),
    );
  }
}
