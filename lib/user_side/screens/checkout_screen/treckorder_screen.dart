import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';
import '../cart screen/cart_screen.dart';
import '../explore screen/explore_screen.dart';
import '../account screen/account_screen.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  int pageIndex = 0;
  // final pages = [
  //   const ExploreScreen(),
  //   const CartScreen(),
  //   const AccountScreen(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite.withOpacity(0.1),
        centerTitle: true,
        title: Text(
          "Track Order",
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
        child: Column(
          children: [
            Container(
              height: 175,
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "sept 23, 2021",
                    style: defaultTextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Container(
                    height: 139,
                    padding: EdgeInsets.only(
                        top: 18, left: 20, right: 20, bottom: 17),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "OD-87801226 -N",
                              style: defaultTextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "\$400",
                              style: defaultTextStyle(
                                  fontSize: 15.0,
                                  fontColors: colorGreen,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              height: 30,
                              alignment: Alignment.center,
                              width: 80,
                              child: Text(
                                "In Transit",
                                style: defaultTextStyle(
                                    fontSize: 15.0,
                                    fontColors: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              decoration: BoxDecoration(
                                  color: colorYellow,
                                  borderRadius: BorderRadius.circular(4)),
                            )
                          ],
                        ),
                        Container(
                          height: double.infinity,
                          color: Colors.blue,
                          width: 100,
                        ),
                        Container(
                          height: 175,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "sept 23, 2021",
                                style: defaultTextStyle(
                                    fontSize: 17.0, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 18, left: 20, right: 20, bottom: 17),
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "OD-87801226 -N",
                                          style: defaultTextStyle(
                                              fontSize: 20.0, fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "\$400",
                                          style: defaultTextStyle(
                                              fontSize: 15.0,
                                              fontColors: colorGreen,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 25),
                                          height: 30,
                                          alignment: Alignment.center,
                                          width: 80,
                                          child: Text(
                                            "In Transit",
                                            style: defaultTextStyle(
                                                fontSize: 15.0,
                                                fontColors: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          decoration: BoxDecoration(
                                              color: colorYellow,
                                              borderRadius: BorderRadius.circular(4)),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: double.infinity,
                                      color: Colors.blue,
                                      width: 100,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
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
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>ExploreScreen()));
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
                  // Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>CartScreen()));
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
                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>AccountScreen()));
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
