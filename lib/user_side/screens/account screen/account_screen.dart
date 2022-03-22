import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/admin/screens/add_product_screen/add_product.dart';
import 'package:untitled/user_side/screens/account%20screen/profine_screen.dart';
import 'package:untitled/user_side/screens/account%20screen/wishlist_screen.dart';
import '../../../admin/screens/admin_home_screen.dart';
import '../../../main.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../../krish/prectics/home.dart';
import '../../repository/auth/auth_reposetory.dart';
import '../../untils/app_fonts.dart';
import '../../widget/account/account_widget.dart';
import '../cart screen/cart_screen.dart';
import '../explore screen/explore_screen.dart';
import '../login screen/edit_profile_screnn.dart';
import '../login screen/opt_screen.dart';
import 'address screen/address_detail.dart';
import 'cards screen/card_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late SharedPreferences prefs;
  bool? isLogin;
  String emails = pref!.getString(LocalStorageKey.email)!;
  String firstName = pref!.getString(LocalStorageKey.firstName)!;
  String lastName = pref!.getString(LocalStorageKey.lastName)!;
  String password = pref!.getString(LocalStorageKey.password)!;
  bool? isLogins = pref!.getBool(LocalStorageKey.isLogin);
  String? profilePhoto = pref!.getString(LocalStorageKey.profilePhoto)!;
  String? assetProfilePhoto = "assets/images/user_profile.png";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // retrieve();
  }

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
                      clipBehavior: Clip.antiAlias,
                      width: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorGrey.withOpacity(0.2),
                      ),
                      child: profilePhoto!.contains("http")
                          ? CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: profilePhoto!,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(color: colorGreen),
                        errorWidget: (context,url,error) => new Icon(Icons.error),
                            )

                          : Image.asset(assetProfilePhoto!)
                      // Image.network(profilePhoto,fit: BoxFit.cover,),
                      ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${firstName.toString()} ${lastName.toString()}",
                        style: defaultTextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Email: ${emails.toString()}",
                        style: defaultTextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${isLogins.toString()} ${password.toString()}",
                        style: defaultTextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w400),
                      ),
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
                        builder: (context) => ProfileScreen(),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddressDetail()));
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Wishlist",
                  icon: "assets/images/icons/Icon_Wishlist.png",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WishListScreen()));
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Order History",
                  icon: "assets/images/icons/Icon_History.png",
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ));
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Track Order",
                  icon: "assets/images/icons/Icon_Order.png",
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => AdminHome()));
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Cards",
                  icon: "assets/images/icons/Icon_Payment.png",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CardsScreen()));
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "Notifications",
                  icon: "assets/images/icons/Icon_Alert.png",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              accountOption(
                  context: context,
                  title: "log Out",
                  icon: "assets/images/icons/Icon_Exit.png",
                  onPressed: () {
                    logOutAlert();
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: buildMyNavBar(context),
    );
  }



  logOutAlert() {
    AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.QUESTION,
            body: const Center(
              child: Text(
                "Are you sure want to Log Out !!",
                style: TextStyle(fontSize: 15),
              ),
            ),
            btnOkOnPress: () {
              AuthRepository.logout(context: context);
            },
            btnCancelOnPress: () {})
        .show();
  }
}
