import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/modal/order_modal.dart';
import 'package:untitled/user_side/modal/product_modal.dart';
import '../../../main.dart';
import '../../config/FireStore_string.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';
import '../cart screen/cart_screen.dart';
import '../explore screen/explore_screen.dart';
import 'account_screen.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  int pageIndex = 0;
  List<OrderModal> orderList = [];

  List<ProductDetail>? productList = [];
  OrderModal orderModal = OrderModal();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrderData();
  }

  getOrderData() async {
    OrderModal orderModal = OrderModal();
    String usrId = pref!.getString(LocalStorageKey.userId)!;

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(usrId)
        .collection("orders")
        .get()
        .then(
          (value) {
        for (var element in value.docs) {
          setState(() {
            orderModal = OrderModal.fromJson(element.data());
            orderList.add(orderModal);

            print("total ${orderModal.method.toString()}");
            print("total ${orderList.length.toString()}");
          });
        }
      },
    );
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: orderList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 175,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 30, left: 16, right: 16, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ListView.builder(
                      //   itemCount: productList.length,
                      //   itemBuilder: (BuildContext context, int index) {
                      //     return Text("kk ");
                      //   },
                      // ),
                      Text(
                        orderList[index].date.toString(),
                        style: defaultTextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Container(
                        height: 139,
                        padding: const EdgeInsets.only(
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
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${orderList[index].total.toString()}",
                                  style: defaultTextStyle(
                                      fontSize: 15.0,
                                      fontColors: colorGreen,
                                      fontWeight: FontWeight.w400),
                                ), Text(
                                  orderList[index].gST.toString(),
                                  style: defaultTextStyle(
                                      fontSize: 15.0,
                                      fontColors: colorGreen,
                                      fontWeight: FontWeight.w400),
                                ), Text(
                                  orderList[index].finalTotal.toString(),
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
                                ),
                              ],
                            ),
                            Container(
                              height: double.infinity,
                              color: Colors.blue,
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
