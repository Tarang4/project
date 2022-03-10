import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modal/product_modal.dart';
import 'package:untitled/screens/checkout_screen/checkout_delivery.dart';
import 'package:untitled/config/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';
import '../account screen/account_screen.dart';
import '../explore screen/explore_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late int itmes = 1;
  int pageIndex = 0;
  final pages = [
    const ExploreScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];
  List<CartModel> cartList = [
    CartModel(
      cartImage: "assets/images/cart1.png",
      cartName: "Tag Heuer WristWatch",
      cartPrice: "\$1100",
    ),
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
                                  height:
                                      MediaQuery.of(context).size.height / 84,
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
                                        child: Image.asset(
                                            "assets/images/plus.png"),
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
                                          child: Text(itmes.toString())),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (itmes > 0) {
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
                  InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>CheckoutDelivery()));
                    },
                    child: Container(
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
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: buildMyNavBar(context),
      ),
    );

  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 74,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              splashColor: Colors.white,
              enableFeedback: false,
              onTap: () {
                setState(() {
                  pageIndex = 0;
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => ExploreScreen()));
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                alignment: Alignment.center,
                child: pageIndex == 0
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Explore",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 3,
                            width: 7,
                            decoration: BoxDecoration(
                                color: colorBlack,
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ],
                      )
                    : const Icon(Icons.home_filled),
              )),
          InkWell(
              enableFeedback: false,
              splashColor: Colors.white,
              onTap: () {
                setState(() {
                  pageIndex = 1;
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => CartScreen()));
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                alignment: Alignment.center,
                child: pageIndex == 1
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Cart",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 3,
                            width: 5,
                            decoration: BoxDecoration(
                                color: colorBlack,
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ],
                      )
                    : const Icon(Icons.card_travel),
              )),
          InkWell(
            enableFeedback: false,
            splashColor: Colors.white,
            onTap: () {
              setState(() {
                pageIndex = 2;
                Navigator.pushReplacement(context,
                    CupertinoPageRoute(builder: (context) => AccountScreen()));
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              alignment: Alignment.center,
              child: pageIndex == 2
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Account",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 3,
                          width: 8,
                          decoration: BoxDecoration(
                              color: colorBlack,
                              borderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    )
                  : const Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}
