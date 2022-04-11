import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/modal/order_modal.dart';
import 'package:untitled/user_side/untils/toast/flutter_toast_method.dart';
import '../../../admin/repository/admin_order_repository.dart';
import '../../../main.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../../repository/add_account/order_repository.dart';
import '../../untils/app_fonts.dart';

class UserOrderHistoryScreen extends StatefulWidget {
  const UserOrderHistoryScreen({Key? key}) : super(key: key);

  @override
  _UserOrderHistoryScreenState createState() => _UserOrderHistoryScreenState();
}

class _UserOrderHistoryScreenState extends State<UserOrderHistoryScreen> {
  int pageIndex = 0;
  String? usrId;
  List<OrderModal> orderList = [];
  List<ProductDetail>? productList = [];
  OrderModal orderModal = OrderModal();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usrId = pref!.getString(LocalStorageKey.userId)!;

    // getOrderData();
  }

  getOrderData() async {
    OrderModal orderModal = OrderModal();
    String usrId = pref!.getString(LocalStorageKey.userId)!;
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(usrId)
          .collection("orders")
          .orderBy('orderDate', descending: true)
          .get()
          .then((value) {
        for (var element in value.docs) {
          setState(() {
            orderModal = OrderModal.fromJson(element.data());
            orderList.add(orderModal);
          });
        }
      });
    } catch (e) {
      ToastMethod.simpleToast(massage: "error $e");
    }
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
            .collection("Users")
            .doc(usrId)
            .collection("orders")
          .where("delivered",isEqualTo: true).limit(10)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [

                  ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      OrderModal orderModalPrint =
                      OrderModal.fromJson(snapshot.data.docs[index].data());

                      // OrderModal orderModalPrint = orderList[index];
                      bool? cancel = orderModalPrint.cancel!;
                      bool? delivered = orderModalPrint.delivered;
                      bool? conform = orderModalPrint.conform;
                      int productDetail = orderModalPrint.productDetail!.length;

                      return Card(
                        elevation: 5,
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              top: 30, left: 16, right: 16, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                orderModalPrint.orderDate.toString(),
                                style: defaultTextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 15, right: 15, bottom: 15),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: List.generate(productDetail,
                                              (indexx) {
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
                                                            fontSize: 20.0,
                                                            fontColors:
                                                            Colors.black,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "₹${orderModalPrint.productDetail![indexx].productPrice.toString()}",
                                                        style: defaultTextStyle(
                                                            fontSize: 14.0,
                                                            fontColors: colorGreen,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Size : ${orderModalPrint.productDetail![indexx].size.toString()}",
                                                        style: defaultTextStyle(
                                                            fontSize: 14.0,
                                                            fontColors: colorBlack,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                      ),
                                                    ],
                                                  ),
                                                  Card(
                                                    child: Container(
                                                      height: 70,
                                                      width: 70,
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
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
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Order ID : ",
                                          style: defaultTextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          orderModalPrint.orderId.toString(),
                                          style: defaultTextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Amount :",
                                          style: defaultTextStyle(
                                              fontSize: 15.0,
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
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
}
