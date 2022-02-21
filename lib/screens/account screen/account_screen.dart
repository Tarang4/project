// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/screens/cards%20screen/card_screen.dart';
import 'package:untitled/screens/cards%20screen/edit_card.dart';
import 'package:untitled/screens/login%20screen/edit_by_email.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';
import 'package:untitled/widget/account/account_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                        "usavani786@gmail.com",
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
              accountOption(
                  context: context,
                  title: "Edit Profile",
                  icon: "assets/images/icons/Icon_Edit-Profile.png",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditByEmail(
                            email: "",
                            profile: "",
                            username: "",
                            address: "",
                            phone: "",
                            pincode: "",
                            city: ""),
                      ),
                    );
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Shipping Address",
                  icon: "assets/images/icons/Icon_Location.png",
                  onPressed: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Wishlist",
                  icon: "assets/images/icons/Icon_Wishlist.png",
                  onPressed: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Order History",
                  icon: "assets/images/icons/Icon_History.png",
                  onPressed: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Track Order",
                  icon: "assets/images/icons/Icon_Order.png",
                  onPressed: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Cards",
                  icon: "assets/images/icons/Icon_Payment.png",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsScreen()));
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Notifications",
                  icon: "assets/images/icons/Icon_Alert.png",
                  onPressed: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "log Out",
                  icon: "assets/images/icons/Icon_Exit.png",
                  onPressed: () {}),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
