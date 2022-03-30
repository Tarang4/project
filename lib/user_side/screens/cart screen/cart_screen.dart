import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/user_side/modal/cart_modal.dart';
import 'package:untitled/user_side/repository/add_account/add_cartlist_repository.dart';
import '../../config/FireStore_string.dart';
import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';
import 'confirm_order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int itmes = 1;
  List<CartModal> cartList = [];
  String? uid;
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    total = 0;

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
      for (var element in value.docs) {
        CartModal cartModal = CartModal.fromJson(element.data());
        setState(() {
          cartList.add(cartModal);
          total = int.parse(cartModal.productPrice.toString()) + total;
        });
      }
    });
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
                  itemCount: cartList.length,
                  itemBuilder: (BuildContext context, index) {
                    CartModal cartModal = cartList[index];

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
                                    Container(
                                      height: 28,
                                      width: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: colorLightGrey
                                      ),
                                      child: Text("Qty : 1",style: defaultTextStyle(fontWeight: FontWeight.w300,fontSize: 15.0),),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  CartRepository.cartDetailDelete(
                                      context: context,
                                      productId:
                                          cartModal.productId.toString());
                                  setState(() {
                                    total = total -
                                        int.parse(
                                            cartModal.productPrice.toString());
                                  });
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
                      const SizedBox(
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
