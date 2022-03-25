import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/user_side/modal/cart_modal.dart';
import 'package:untitled/user_side/repository/add_account/add_cartlist_repository.dart';
import 'package:untitled/user_side/untils/toast/flutter_toast_method.dart';
import '../../../admin/modal/admin_product_modal.dart';
import '../../config/FireStore_string.dart';
import '../../config/app_colors.dart';
import '../../modal/product_modal.dart';
import '../../untils/app_fonts.dart';
import '../account screen/account_screen.dart';
import '../checkout_screen/checkout_delivery.dart';
import '../explore screen/explore_screen.dart';
import 'confirm_order.dart';

class CartScreen extends StatefulWidget {
  final String productImage;
  final String productName;
  final String productPrice;
  final String productId;

  const CartScreen(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productId})
      : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int itmes = 1;
  String? productImage;
  String? productName;
  String? productPrice;
  String? productId;
  List<CartModal> cartList = [];

  String? uid;
  int total = 0;
  int totali = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    total = 0;
    totali = 0;
    productPrice = widget.productPrice;
    productName = widget.productName;
    productImage = widget.productImage;
    productId = widget.productId;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    uid = user?.uid;
    getUserCart();
  }

  getUserCart() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    String? uid = user?.uid;
    FirebaseFirestore.instance
        .collection(FirebaseString.userCollection)
        .doc(uid)
        .collection(FirebaseString.cartListCollection)
        .get()
        .then((value) {
      // WidgetsBinding.instance?.addPostFrameCallback((_) {
      for (var element in value.docs) {
        CartModal cartModal = CartModal.fromJson(element.data());
        setState(() {
          cartList.add(cartModal);
          total = int.parse(cartModal.productPrice.toString()) + total;
          int quantity = cartModal.quantity ?? 1;
        });
      }

      // });
    });
    // FirebaseFirestore.instance
    //     .collection(FirebaseString.userCollection)
    //     .get()
    //     .then((querySnapshot) {
    //   querySnapshot.docs.forEach((result) {
    //     FirebaseFirestore.instance
    //         .collection(FirebaseString.userCollection)
    //         .doc(result.id)
    //         .collection(FirebaseString.addressCollection)
    //         .get()
    //         .then((querySnapshot) {
    //       querySnapshot.docs.forEach((result) {
    //         AddressModal addressModal = AddressModal.fromJson(result.data());
    //         // DebitCardModal debitsCardModal = DebitCardModal.fromJson(result.data());
    //
    //         print("--------------------- Books ---------------------\n"
    //             "id: ${addressModal.userId}\n"
    //             "name: ${addressModal.fullName}\n"
    //             "street: ${addressModal.addStreetNo}\n"
    //             "address: ${addressModal.addStreet}\n"
    //             "city: ${addressModal.addCity}");
    //       });
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cartList.length,
                  itemBuilder: (BuildContext context, index) {
                    CartModal cartModal = cartList[index];
                    totali =
                        int.parse(cartModal.productPrice.toString()) + totali;
                    print("${total.toString()}");
                    return Dismissible(
                      key: Key(cartModal.addId![index]),
                      background: slideLeftBackground(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          CartRepository.cartDetailDelete(
                              context: context,
                              productId: cartModal.productId.toString());
                          setState(() {
                            total = total -
                                int.parse(cartModal.productPrice.toString());
                            cartList.removeAt(index);
                          });
                        }
                        return;
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 70,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                margin: const EdgeInsets.only(
                                    bottom: 8, top: 8, left: 16, right: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: cartModal.productImage.toString(),
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                          color: colorGrey)),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: Text(
                                        cartModal.productName.toString(),
                                        style: defaultTextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        "₹${cartModal.productPrice.toString()}",
                                        style: defaultTextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            fontColors: colorGreen),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              84,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              itmes++;
                                              // quantity==itmes;
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 32,
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4),
                                                  bottomLeft:
                                                      Radius.circular(4),
                                                ),
                                                color: colorLightGrey),
                                            child: Image.asset(
                                                "assets/images/plus.png"),
                                          ),
                                        ),
                                        InkWell(
                                          child: Container(
                                              height: 30,
                                              width: 32,
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                  color: colorLightGrey),
                                              child: Text(itmes.toString())),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (itmes > 0) {
                                                itmes--;
                                                // quantity==itmes;

                                              }
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 32,
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(4),
                                                  bottomRight:
                                                      Radius.circular(4),
                                                ),
                                                color: colorLightGrey),
                                            child: Image.asset(
                                                "assets/images/minus.png"),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  ToastMethod.simpleToast(massage: "◀ Swipe Left For Delete !!");
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 75),
                                  height: 20,
                                  width: 20,
                                  child: const Icon(Icons.delete),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: MediaQuery.of(context).size.height / 15,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "PRICE",
                        style: defaultTextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.00,
                            fontColors: colorGrey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "₹ ${total.toString()}",
                        style: defaultTextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.00,
                            fontColors: colorGreen),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  ConfirmOrder(total: total)));
                    },
                    child: Container(
                      height: 50,
                      width: 146,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colorGreen,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "CONFIRM ORDER",
                        style: defaultTextStyle(
                            fontColors: colorWhite,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
