// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/repository/auth/login-signup_repository.dart';
import 'package:untitled/screens/account%20screen/profine_screen.dart';
import 'package:untitled/screens/account%20screen/wishlist_screen.dart';
import 'package:untitled/screens/cards%20screen/card_screen.dart';
import 'package:untitled/screens/checkout_screen/checkout_delivery.dart';
import 'package:untitled/screens/checkout_screen/treckorder_screen.dart';
import 'package:untitled/screens/login%20screen/login_types.dart';
import 'package:untitled/config/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';
import 'package:untitled/widget/account/account_widget.dart';
import '../../modal/authenticaion_model.dart';
import '../cart screen/cart_screen.dart';
import '../explore screen/explore_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int pageIndex = 0;
  final pages = [
    const ExploreScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Row(
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorGrey,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "David Spade",
                        style: defaultTextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "show mail",
                        style: defaultTextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 26,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => ProfileScreen()));
                },
                child: accountOption(
                    context: context,
                    title: "Edit Profile",
                    icon: "assets/images/icons/Icon_Edit-Profile.png",
                   ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Shipping Address",
                  icon: "assets/images/icons/Icon_Location.png",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WishListScreen()));
                },
                child: accountOption(
                    context: context,
                    title: "Wishlist",
                    icon: "assets/images/icons/Icon_Wishlist.png",
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackOrderScreen()));

                },
                child: accountOption(
                    context: context,
                    title: "Order History",
                    icon: "assets/images/icons/Icon_History.png",
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutDelivery()));
                },
                child: accountOption(
                    context: context,
                    title: "Track Order",
                    icon: "assets/images/icons/Icon_Order.png",
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsScreen()));
                },
                child: accountOption(
                    context: context,
                    title: "Cards",
                    icon: "assets/images/icons/Icon_Payment.png",
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              InkWell(
                onTap: (){},
                child: accountOption(
                    context: context,
                    title: "Notifications",
                    icon: "assets/images/icons/Icon_Alert.png",
                   ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              InkWell(
                onTap: () async {
                  AuthRepository.logout(context: context);
                  /*AuthenticationHelper().signOut();
                  final SharedPreferences sharePrefrences =
                      await SharedPreferences.getInstance();
                  sharePrefrences.remove("Email");
                  sharePrefrences.remove("PassWord");
                  sharePrefrences.setBool("isLogin", false);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginTypes()));*/
                },
                child: accountOption(
                    context: context,
                    title: "log Out",
                    icon: "assets/images/icons/Icon_Exit.png",
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
            ],
          ),
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ExploreScreen()));
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CartScreen()));
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AccountScreen()));
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
