import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../account screen/account_screen.dart';
import '../cart screen/cart_screen.dart';
import 'explore_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int pageIndex = 0;
  final pages = [
    const ExploreScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),

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
