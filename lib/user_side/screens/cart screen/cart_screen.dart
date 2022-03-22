import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/user_side/modal/cart_modal.dart';
import 'package:untitled/user_side/repository/add_account/add_cartlist_repository.dart';
import '../../../admin/modal/admin_product_modal.dart';
import '../../config/FireStore_string.dart';
import '../../config/app_colors.dart';
import '../../modal/product_modal.dart';
import '../../untils/app_fonts.dart';
import '../account screen/account_screen.dart';
import '../checkout_screen/checkout_delivery.dart';
import '../explore screen/explore_screen.dart';

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
  late int itmes = 1;
  String? productImage;
  String? productName;
  String? productPrice;
  String? productId;

  String? uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    productPrice = widget.productPrice;
    productName = widget.productName;
    productImage = widget.productImage;
    productId = widget.productId;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    uid = user?.uid;
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
            StreamBuilder<QuerySnapshot>(
                //TODO: to fix the issue
                stream: FirebaseFirestore.instance
                    .collection(FirebaseString.userCollection)
                    .doc(uid)
                    .collection(FirebaseString.cartListCollection)
                    .snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return !snapshot.hasData
                      ? const Center(
                        child: CircularProgressIndicator(),
                      )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (BuildContext context, index) {
                                CartModal cartModal = CartModal.fromJson(
                                    snapshot.data.docs[index].data());
                                return Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              70,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 120,
                                          margin: const EdgeInsets.only(
                                              bottom: 8,
                                              top: 8,
                                              left: 16,
                                              right: 30),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: cartModal.productImage
                                                .toString(),
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            color: colorGrey)),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25),
                                              child: Text(
                                                cartModal.productName
                                                    .toString(),
                                                style: defaultTextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3),
                                              child: Text(
                                                cartModal.productPrice
                                                    .toString(),
                                                style: defaultTextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontColors: colorGreen),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  84,
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      itmes++;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 32,
                                                    padding: EdgeInsets.all(10),
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(4),
                                                              bottomLeft: Radius
                                                                  .circular(4),
                                                            ),
                                                            color:
                                                                colorLightGrey),
                                                    child: Image.asset(
                                                        "assets/images/plus.png"),
                                                  ),
                                                ),
                                                InkWell(
                                                  child: Container(
                                                      height: 30,
                                                      width: 32,
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  colorLightGrey),
                                                      child: Text(
                                                          itmes.toString())),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (itmes > 0) {
                                                        itmes--;
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 30,
                                                    width: 32,
                                                    padding: EdgeInsets.all(10),
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topRight: Radius
                                                                  .circular(4),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            color:
                                                                colorLightGrey),
                                                    child: Image.asset(
                                                        "assets/images/minus.png"),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        TextButton(onPressed: (){
                                          CartRepository.cartDetailDelete(context: context, productId: cartModal.productId.toString());
                                        }, child: Text("Delete"))
                                      ],
                                    ),
                                  ],
                                );
                              }),
                        );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),
                      Text(
                        "TOTAL",
                        style: defaultTextStyle(
                            fontColors: colorGrey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "\$4500",
                        style: defaultTextStyle(
                            fontColors: colorGreen,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 65,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => CheckoutDelivery()));
                    },
                    child: Container(
                      height: 50,
                      width: 146,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colorGreen,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "CHECKOUT",
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
}
