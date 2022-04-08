import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/modal/order_modal.dart';
import '../../user_side/config/FireStore_string.dart';
import '../../user_side/config/app_colors.dart';
import '../../user_side/modal/user_model.dart';
import '../../user_side/untils/app_fonts.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  bool orderConfirm = true;
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
        elevation: 2,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: orderList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  OrderModal orderModalPrint = orderList[index];
                  bool? cancel = orderList[index].cancel!;
                  bool? delivered = orderModalPrint.delivered;
                  bool? conform = orderModalPrint.conform;
                  int productDetail = orderModalPrint.productDetail!.length;
                  return Container(
                    child: ExpandableNotifier(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orderModalPrint.orderDate.toString(), style: defaultTextStyle(
                              fontSize: 18.0,
                              fontColors: Colors.black,
                              fontWeight:
                              FontWeight.w600),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children:
                                        List.generate(productDetail, (indexx) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 8),
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
                                                      fontSize: 18.0,
                                                      fontColors: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "\$ ${orderModalPrint.productDetail![indexx].productPrice.toString()}",
                                                  style: defaultTextStyle(
                                                      fontSize: 14.0,
                                                      fontColors: colorGreen,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                  height: 13,
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      orderModalPrint
                                                          .productDetail![
                                                              indexx]
                                                          .size
                                                          .toString(),
                                                      style: defaultTextStyle(
                                                          fontSize: 14.0),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Color(int.parse(
                                                            orderModalPrint
                                                                .productDetail![
                                                                    indexx]
                                                                .color
                                                                .toString())),
                                                      ),
                                                      height: 12,
                                                      width: 60,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "QTY: 1",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w300),
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
                                                errorWidget:
                                                    (context, url, error) =>
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
                                ),
                                ScrollOnExpand(
                                  scrollOnExpand: true,
                                  scrollOnCollapse: false,
                                  child: ExpandablePanel(
                                    theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: true,
                                    ),
                                    header: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          "Order Id : ${orderModalPrint.orderId.toString()}",
                                          style:
                                              defaultTextStyle(fontSize: 14.0),
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
                                          "user Name : ${orderModalPrint.addressDetail!.fullName.toString()}",
                                          style:
                                              defaultTextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          "Method ${orderModalPrint.method.toString()}",
                                          style: defaultTextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          "total : ${orderModalPrint.total.toString()}",
                                          style:
                                              defaultTextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          "Discount: ${orderModalPrint.discount.toString()}",
                                          style:
                                              defaultTextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          "18% GST: ${orderModalPrint.gST.toString()}",
                                          style:
                                              defaultTextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          "-----------------------------------------------",
                                          style:
                                              defaultTextStyle(fontSize: 18.0),
                                        ),
                                        Text(
                                          "Order Price : ${orderModalPrint.finalTotal.toString()}",
                                          style:
                                              defaultTextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          "Card Number :${orderModalPrint.cardDetail!.cardNo.toString()} ",
                                          style:
                                              defaultTextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          "CVV :${orderModalPrint.cardDetail!.cvv.toString()}   Exp Date:${orderModalPrint.cardDetail!.expDate.toString()}",
                                          style:
                                              defaultTextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          "Card Detaile: ${orderModalPrint.cardDetail!.cardName.toString()}",
                                          style: defaultTextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          "Address Delevered Name :${orderModalPrint.addressDetail!.fullName.toString()} ",
                                          style:
                                              defaultTextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          "Address :${orderModalPrint.addressDetail!.address.toString()} ",
                                          style:
                                              defaultTextStyle(fontSize: 14.0),
                                        ),
                                        Text(
                                          "Mobile No:${orderModalPrint.addressDetail!.phoneNo.toString()}",
                                          style: defaultTextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: orderConfirm
                                              ? Container(
                                                  height: 25,
                                                  width: 100,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: colorGreen,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: colorGreen)),
                                                  child: Text(
                                                    "CONFIRM",
                                                    style: defaultTextStyle(
                                                        fontSize: 14.0,
                                                        fontColors: colorWhite,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              : Container(
                                                  height: 25,
                                                  width: 100,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: colorGreen)),
                                                  child: Text(
                                                    "✓ CHECKED",
                                                    style: defaultTextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                        )
                                      ],
                                    ),
                                    builder: (_, collapsed, expanded) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, bottom: 10),
                                        child: Expandable(
                                          collapsed: collapsed,
                                          expanded: expanded,
                                          theme: const ExpandableThemeData(
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
                    )),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
