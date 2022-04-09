import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/modal/order_modal.dart';
import 'package:untitled/user_side/untils/toast/flutter_toast_method.dart';
import '../../../main.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../../repository/add_account/order_repository.dart';
import '../../untils/app_fonts.dart';

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
        physics: const BouncingScrollPhysics(),
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
                              top: 15, left: 15, right: 15, bottom: 15),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children:
                                List.generate(productDetail, (indexx) {
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
                                              "₹${orderModalPrint.productDetail![indexx].productPrice.toString()}",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0,
                                                  fontColors: colorGreen,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Size : ${orderModalPrint.productDetail![indexx].size.toString()}",
                                              style: defaultTextStyle(
                                                  fontSize: 14.0,
                                                  fontColors: colorBlack,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        Card(
                                          child: Container(
                                            height: 70,
                                            width: 70,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5)
                                            ),
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
                                    "Cancel Order",
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
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    margin: const EdgeInsets.only(left: 10),
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1)
                                    ),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: cancel == false
                                            ? conform == true
                                            ? colorGreen
                                            : colorBlack
                                            : Colors.red.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container(height: 1,color: colorBlack,)),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1)
                                    ),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:  cancel == false
                                            ? conform == true
                                            ? colorGreen
                                            : colorBlack
                                            : Colors.red.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container(height: 1,color: colorBlack,)),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1)
                                    ),
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: cancel == false
                                            ? conform == true
                                            ? colorGreen
                                            : colorBlack
                                            : Colors.red.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Placed     ",
                                    style: defaultTextStyle(
                                        fontSize: 15.0,
                                        fontColors: colorGreen,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Confirm",
                                    style: defaultTextStyle(
                                        fontSize:
                                        conform == true ? 18 : 15.0,
                                        fontColors: cancel == false
                                            ? conform == true
                                            ? colorGreen
                                            : colorBlack
                                            : Colors.red.withOpacity(0.7),
                                        fontWeight: conform == true
                                            ? FontWeight.w400
                                            : FontWeight.w500),
                                  ),
                                  Text(
                                    "Delivered",
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
                                  ),
                                ],
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
      ),
    );
  }
}