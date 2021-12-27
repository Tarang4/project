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
  late int itmes=1;
  List<CartModel> cartList = [
    CartModel(
        cartImage: "assets/images/cart1.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100",),
    CartModel(
        cartImage: "assets/images/cart2.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
    CartModel(
        cartImage: "assets/images/cart3.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
    CartModel(
        cartImage: "assets/images/cart4.png",
        cartName: "Tag Heuer WristWatch",
        cartPrice: "\$1100"),
    CartModel(
        cartImage: "assets/images/cart5.png",
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 70,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (BuildContext context, index) {
                  CartModel cartModel = cartList[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            margin: const EdgeInsets.only(
                                bottom: 8, top: 8, left: 16, right: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(cartModel.cartImage),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Text(
                                  cartModel.cartName,
                                  style: defaultTextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  cartModel.cartPrice,
                                  style: defaultTextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      fontColors: colorGreen),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 84,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        itmes++;
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 32,
                                      padding: EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            bottomLeft: Radius.circular(4),
                                          ),
                                          color: colorLightGrey),
                                      child:
                                          Image.asset("assets/images/plus.png"),
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                        height: 30,
                                        width: 32,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                            color: colorLightGrey),
                                        child:
                                            Text(itmes.toString())),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if(itmes>0){
                                          itmes--;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 32,
                                      padding: EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(4),
                                            bottomRight: Radius.circular(4),
                                          ),
                                          color: colorLightGrey),
                                      child: Image.asset(
                                          "assets/images/minus.png"),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    Text(
                      "TOTAL",
                      style: defaultTextStyle(
                          fontColors: colorGrey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "\$4500",
                      style: defaultTextStyle(
                          fontColors: colorGreen,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 65,
                ),
                Container(
                  height: 50,
                  width: 146,
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
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
