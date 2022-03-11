import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/config/local_storage.dart';
import 'package:untitled/screens/account%20screen/address_screen.dart';
import 'package:untitled/screens/account%20screen/profine_screen.dart';
import 'package:untitled/screens/account%20screen/wishlist_screen.dart';
import 'package:untitled/untils/app_fonts.dart';
import 'package:untitled/widget/account/account_widget.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../../krish/prectics/home.dart';
import '../../main.dart';
import '../../repository/auth/auth_reposetory.dart';
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
  String profilePhoto = pref!.getString(LocalStorageKey.profilePhoto)!;


  // deleteSharedPreferences() async {
  //   prefs = await SharedPreferences.getInstance();
  //   prefs.remove('isLogin');
  //   // prefs.remove('phone');
  //   setState(() {});
  // }
  //


  int pageIndex = 0;
  final pages = [
    const ExploreScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

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
                    height: 110,clipBehavior: Clip.antiAlias,
                    width: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      color: colorGrey,
                    ),child: Image.network(profilePhoto,fit: BoxFit.cover,),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "${firstName.toString()} ${lastName.toString()}",
                        style: defaultTextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.w500),
                      ),SizedBox(height: 4,),
                      Text(
                        "Email: ${ emails.toString()}",
                        style: defaultTextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.w500),
                      ),Text(
                        "${ isLogins.toString()} ${password.toString()}",
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerificationScreen()));


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
                        MaterialPageRoute(
                            builder: (context) => EditProfileScreen()));
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
                    AuthRepository.logout(context: context);
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
            ],
          ),
        ),
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
                      MaterialPageRoute(builder: (context) => ExploreScreen()));
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
                      MaterialPageRoute(builder: (context) => CartScreen()));
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
                    MaterialPageRoute(builder: (context) => AccountScreen()));
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
