import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/modal/order_modal.dart';
import '../../user_side/config/FireStore_string.dart';
import '../../user_side/config/app_colors.dart';
import '../../user_side/modal/user_model.dart';
import '../../user_side/repository/add_account/order_repository.dart';
import '../../user_side/untils/app_fonts.dart';
import '../repository/admin_order_repository.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  bool? orderConfirm = false;
  bool? isDeliverd = false;
  List<UserModal> userList = [];
  List<OrderModal> orderList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    getOrderData();
  }

  getUserData() async {
    UserModal userModal = UserModal();
    await FirebaseFirestore.instance
        .collection(FirebaseString.userCollection)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          userModal = UserModal.fromJson(element.data());
          userList.add(userModal);
        });
      });
    });
  }

  getOrderData() async {
    OrderModal orderModal = OrderModal();

    await FirebaseFirestore.instance
        .collection(FirebaseString.adminCollection)
        .doc("rha4OKCNrwpPoDiDtTvq")
        .collection(FirebaseString.orderCollection)
        .orderBy('orderDate', descending: true)
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
        backgroundColor: colorWhite.withOpacity(0.2),
        title: Text(
          "Order History",
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(FirebaseString.adminCollection)
            .doc("rha4OKCNrwpPoDiDtTvq")
            .collection(FirebaseString.orderCollection)
            .orderBy('orderDate', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        OrderModal orderModalPrint = OrderModal.fromJson(
                            snapshot.data.docs[index].data());

                        // OrderModal orderModalPrint = orderList[index];
                        bool? cancel = orderModalPrint.cancel!;
                        bool? delivered = orderModalPrint.delivered;
                        bool? conform = orderModalPrint.conform;
                        int productDetail =
                            orderModalPrint.productDetail!.length;
                        return ExpandableNotifier(
                            child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  orderModalPrint.orderDate.toString(),
                                  style: defaultTextStyle(
                                      fontSize: 18.0,
                                      fontColors: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Card(
                                elevation: 7,
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Column(
                                        children: List.generate(productDetail,
                                            (indexx) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 10,
                                            ),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                    width: 1.0,
                                                    color: colorLightGrey),
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment
                                              //         .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        orderModalPrint
                                                            .productDetail![
                                                                indexx]
                                                            .productName
                                                            .toString(),
                                                        style: defaultTextStyle(
                                                            fontSize: 18.0,
                                                            fontColors:
                                                                Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "₹ ${orderModalPrint.productDetail![indexx].productPrice.toString()}",
                                                        style: defaultTextStyle(
                                                            fontSize: 14.0,
                                                            fontColors:
                                                                colorGreen,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                              "Size : ${orderModalPrint.productDetail![indexx].size.toString() == "null" ? " " : orderModalPrint.productDetail![indexx].size.toString()}",
                                                              style: defaultTextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text("Color : ",
                                                              style: defaultTextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          Container(
                                                            height: 15,
                                                            width: 15,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Color(int.parse(orderModalPrint
                                                                          .productDetail![
                                                                              indexx]
                                                                          .color
                                                                          .toString() ==
                                                                      "null"
                                                                  ? "0xffffff"
                                                                  : orderModalPrint
                                                                      .productDetail![
                                                                          indexx]
                                                                      .color
                                                                      .toString())),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "QTY: 1",
                                                    style: defaultTextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    height: 70,
                                                    width: 70,
                                                    margin: const EdgeInsets.only(
                                                        bottom: 10),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                          orderModalPrint
                                                              .productDetail![
                                                                  indexx]
                                                              .productImage
                                                              .toString(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                        Icons.error,
                                                        size: 25,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    ScrollOnExpand(
                                      scrollOnExpand: true,
                                      scrollOnCollapse: false,
                                      child: ExpandablePanel(
                                        theme: const ExpandableThemeData(
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          tapBodyToCollapse: true,
                                        ),
                                        header: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              "Order ID : ${orderModalPrint.orderId.toString()}",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0),
                                            )),
                                        collapsed: const Text(
                                          "See More......",
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        expanded: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "User Name : ${orderModalPrint.addressDetail!.fullName.toString()}",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            Text(
                                              "Method : ${orderModalPrint.method.toString()}",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            Text(
                                              "Total : ${orderModalPrint.total.toString()}",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            Text(
                                              "Discount : ${orderModalPrint.discount.toString()}",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            Text(
                                              "18% GST : ${orderModalPrint.gST.toString()}",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8, bottom: 8),
                                              child: DottedLine(
                                                  dashColor: colorGreen),
                                            ),
                                            Text(
                                              "Order Price : ${orderModalPrint.finalTotal.toString()}\n",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight:
                                                      FontWeight.w700),
                                            ),
                                            Text(
                                              "Address : \n${orderModalPrint.addressDetail!.address.toString()} \n",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0),
                                            ),
                                            Text(
                                              "Mobile No : ${orderModalPrint.addressDetail!.phoneNo.toString()}",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight:
                                                      FontWeight.w700),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  cancel == true
                                                      ? "Cancel : YES"
                                                      : "Cancel : NO",
                                                  style: defaultTextStyle(
                                                      fontSize: 15.0,
                                                      fontColors: colorGreen,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  conform == true
                                                      ? "Conform : YES"
                                                      : "Conform : NO",
                                                  style: defaultTextStyle(
                                                      fontSize: 15.0,
                                                      fontColors: colorGreen,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  delivered == true
                                                      ? "Delivered : YES"
                                                      : "Delivered : NO",
                                                  style: defaultTextStyle(
                                                      fontSize: 15.0,
                                                      fontColors: colorGreen,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    AwesomeDialog(
                                                        context: context,
                                                        animType:
                                                            AnimType.SCALE,
                                                        dialogType: DialogType
                                                            .QUESTION,
                                                        body: const Center(
                                                          child: Text(
                                                            "ORDER CONFIRM !!",
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                        btnOkOnPress: () {
                                                          if (conform ==
                                                              false) {
                                                            setState(() {
                                                              conform = true;
                                                            });

                                                            AdminOrderRepository
                                                                .orderUpdate(
                                                              context:
                                                                  context,
                                                              finalTotal:
                                                                  orderModalPrint
                                                                      .finalTotal
                                                                      .toString(),
                                                              cancel: cancel,
                                                              conform: true,
                                                              delivered:
                                                                  delivered,
                                                              date: orderModalPrint
                                                                  .orderDate
                                                                  .toString(),
                                                            );

                                                            OrderRepository
                                                                .orderUpdate(
                                                              context:
                                                                  context,
                                                              finalTotal:
                                                                  orderModalPrint
                                                                      .finalTotal
                                                                      .toString(),
                                                              cancel: cancel,
                                                              conform: true,
                                                              delivered:
                                                                  delivered,
                                                              date: orderModalPrint
                                                                  .orderDate
                                                                  .toString(),
                                                              userId: orderModalPrint
                                                                  .userId
                                                                  .toString(),
                                                            );
                                                          } else {
                                                            setState(() {
                                                              conform = true;
                                                            });
                                                          }
                                                        },
                                                        btnCancelOnPress: () {
                                                          setState(() {
                                                            conform = false;
                                                          });
                                                        }).show();
                                                  },
                                                  child: conform == false
                                                      ? Container(
                                                          height: 30,
                                                          width: 100,
                                                          alignment: Alignment
                                                              .center,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .redAccent,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .redAccent)),
                                                          child: Text(
                                                            "CONFIRM",
                                                            style: defaultTextStyle(
                                                                fontSize:
                                                                    14.0,
                                                                fontColors:
                                                                    colorWhite,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        )
                                                      : Container(
                                                          height: 30,
                                                          width: 100,
                                                          alignment: Alignment
                                                              .center,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color:
                                                                      colorGreen)),
                                                          child: Text(
                                                            "✓ DONE",
                                                            style: defaultTextStyle(
                                                                fontSize:
                                                                    14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    AwesomeDialog(
                                                        context: context,
                                                        animType:
                                                            AnimType.SCALE,
                                                        dialogType: DialogType
                                                            .QUESTION,
                                                        body: const Center(
                                                          child: Text(
                                                            "ORDER DELIVERD !!",
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                        btnOkOnPress: () {
                                                          if (isDeliverd ==
                                                              false) {
                                                            setState(() {
                                                              isDeliverd =
                                                                  true;
                                                            });
                                                            OrderRepository
                                                                .orderUpdate(
                                                              userId: orderModalPrint
                                                                  .userId
                                                                  .toString(),
                                                              context:
                                                                  context,
                                                              finalTotal:
                                                                  orderModalPrint
                                                                      .finalTotal
                                                                      .toString(),
                                                              cancel: cancel,
                                                              conform:
                                                                  conform,
                                                              delivered: true,
                                                              date: orderModalPrint
                                                                  .orderDate
                                                                  .toString(),
                                                            );
                                                            AdminOrderRepository
                                                                .orderUpdate(
                                                              context:
                                                                  context,
                                                              finalTotal:
                                                                  orderModalPrint
                                                                      .finalTotal
                                                                      .toString(),
                                                              cancel: cancel,
                                                              conform:
                                                                  conform,
                                                              delivered: true,
                                                              date: orderModalPrint
                                                                  .orderDate
                                                                  .toString(),
                                                            );
                                                          } else {
                                                            setState(() {
                                                              isDeliverd =
                                                                  true;
                                                            });
                                                          }
                                                        },
                                                        btnCancelOnPress: () {
                                                          setState(() {
                                                            cancel = false;
                                                          });
                                                        }).show();
                                                  },
                                                  child: isDeliverd == false
                                                      ? Container(
                                                          height: 30,
                                                          width: 100,
                                                          alignment: Alignment
                                                              .center,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .redAccent,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .redAccent)),
                                                          child: Text(
                                                            "DELIVERD",
                                                            style: defaultTextStyle(
                                                                fontSize:
                                                                    14.0,
                                                                fontColors:
                                                                    colorWhite,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        )
                                                      : Container(
                                                          height: 30,
                                                          width: 100,
                                                          alignment: Alignment
                                                              .center,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color:
                                                                      colorGreen)),
                                                          child: Text(
                                                            "✓ DONE ",
                                                            style: defaultTextStyle(
                                                                fontSize:
                                                                    14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        builder: (_, collapsed, expanded) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
                                            child: Expandable(
                                              collapsed: collapsed,
                                              expanded: expanded,
                                              theme:
                                                  const ExpandableThemeData(
                                                      crossFadePoint: 0),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
                      }),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: colorGreen,
            ),
          );
        },
      ),
    );
  }
// confirmAlert() {
//   AwesomeDialog(
//       context: context,
//       animType: AnimType.SCALE,
//       dialogType: DialogType.QUESTION,
//       body: const Center(
//         child: Text(
//           "Order Confirm !!",
//           style: TextStyle(fontSize: 15),
//         ),
//       ),
//       btnOkOnPress: () {
//         setState(() {
//           orderConfirm=true;
//         });
//       },
//       btnCancelOnPress: () {
//         setState(() {
//           orderConfirm=false;
//         });
//       })
//       .show();
// }
//
// deliverdAlert() {
//   AwesomeDialog(
//       context: context,
//       animType: AnimType.SCALE,
//       dialogType: DialogType.QUESTION,
//       body: const Center(
//         child: Text(
//           "Product Deliverd !!",
//           style: TextStyle(fontSize: 15),
//         ),
//       ),
//       btnOkOnPress: () {
//         setState(() {
//           isDeliverd=true;
//         });
//       },
//       btnCancelOnPress: () {
//         setState(() {
//           isDeliverd=false;
//         });
//       })
//       .show();
// }
}
