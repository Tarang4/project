import 'package:cached_network_image/cached_network_image.dart';
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
import '../../repository/add_account/order_repository.dart';
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
        .orderBy('date', descending: true)
        .get()
        .then(
      (value) {
        for (var element in value.docs) {
          setState(() {
            orderModal = OrderModal.fromJson(element.data());
            orderList.add(orderModal);
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
                OrderModal orderModalPrint = orderList[index];
                bool? cancel = orderList[index].cancel!;
                bool? delivered = orderModalPrint.delivered;
                bool? conform = orderModalPrint.conform;
                int productDetail = orderModalPrint.productDetail!.length;

                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 30, left: 16, right: 16, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderModalPrint.date.toString(),
                        style: defaultTextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      cancel == false
                          ? Container()
                          : Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Order Cancelled",
                                style: defaultTextStyle(
                                    fontColors: Colors.red,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 18, left: 20, right: 19, bottom: 17),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: List.generate(productDetail, (indexx) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            orderModalPrint
                                                .productDetail![indexx]
                                                .productName
                                                .toString(),
                                            style: defaultTextStyle(
                                                fontSize: 20.0,
                                                fontColors: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "\$ ${orderModalPrint.productDetail![indexx].productPrice.toString()}",
                                            style: defaultTextStyle(
                                                fontSize: 14.0,
                                                fontColors: colorGreen,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 70,
                                        width: 70,
                                        color: Colors.green,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: orderModalPrint
                                              .productDetail![indexx]
                                              .productImage
                                              .toString(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(
                                            Icons.error,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Order Id:",
                                  style: defaultTextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  " ${orderModalPrint.orderId.toString()}",
                                  style: defaultTextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Amount :",
                                  style: defaultTextStyle(
                                      fontSize: 19.0,
                                      fontColors: colorGreen,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  orderModalPrint.finalTotal.toString(),
                                  style: defaultTextStyle(
                                      fontSize: 15.0,
                                      fontColors: colorGreen,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                if (cancel == false) {
                                  setState(() {
                                    cancel = true;
                                  });
                                  OrderRepository.orderUpdate(
                                    context: context,
                                    orderId: orderModalPrint.orderId,
                                    cancel: true,
                                    conform: null,
                                    delivered: null,
                                  );
                                } else {
                                  setState(() {
                                    cancel = true;
                                  });
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 15),
                                height: 30,
                                alignment: Alignment.center,
                                width: 100,
                                child: cancel == true
                                    ? Text(
                                        "Cancelled",
                                        style: defaultTextStyle(
                                            fontSize: 15.0,
                                            fontColors: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      )
                                    : Text(
                                        "Delete Order",
                                        style: defaultTextStyle(
                                            fontSize: 15.0,
                                            fontColors: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                decoration: BoxDecoration(
                                    color: cancel == true
                                        ? Colors.red
                                        : colorYellow,
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "----",
                                          style: defaultTextStyle(
                                              fontSize: 35.0,
                                              fontColors: colorGreen,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          "---",
                                          style: defaultTextStyle(
                                              fontSize: 35.0,
                                              fontColors: cancel == false
                                                  ? conform == true
                                                      ? colorGreen
                                                      : colorBlack
                                                  : Colors.red.withOpacity(0.7),
                                              fontWeight: conform == true
                                                  ? FontWeight.w700
                                                  : FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Pleced",
                                      style: defaultTextStyle(
                                          fontSize: 18.0,
                                          fontColors: colorGreen,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "---------",
                                      style: defaultTextStyle(
                                          fontSize: 35.0,
                                          fontColors: cancel == false
                                              ? conform == true
                                                  ? colorGreen
                                                  : colorBlack
                                              : Colors.red.withOpacity(0.7),
                                          fontWeight: conform == true
                                              ? FontWeight.w700
                                              : FontWeight.w300),
                                    ),
                                    Text(
                                      "Conform",
                                      style: defaultTextStyle(
                                          fontSize: conform == true ? 18 : 15.0,
                                          fontColors: cancel == false
                                              ? conform == true
                                                  ? colorGreen
                                                  : colorBlack
                                              : Colors.red.withOpacity(0.7),
                                          fontWeight: conform == true
                                              ? FontWeight.w400
                                              : FontWeight.w500),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "-------",
                                      style: defaultTextStyle(
                                          fontSize: 35.0,
                                          fontColors: cancel == false
                                              ? conform == true
                                                  ? colorGreen
                                                  : colorBlack
                                              : Colors.red.withOpacity(0.7),
                                          fontWeight: conform == true
                                              ? FontWeight.w700
                                              : FontWeight.w300),
                                    ),
                                    Text(
                                      "delivered",
                                      style: defaultTextStyle(
                                          fontSize:
                                              delivered == true ? 18 : 15.0,
                                          fontColors: cancel == false
                                              ? conform == true
                                                  ? colorGreen
                                                  : colorBlack
                                              : Colors.red.withOpacity(0.7),
                                          fontWeight: delivered == true
                                              ? FontWeight.w400
                                              : FontWeight.w500),
                                    )
                                  ],
                                ),
                              ],
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
