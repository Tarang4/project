import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/user_side/modal/cart_modal.dart';

import '../../config/FireStore_string.dart';
import '../../config/app_colors.dart';
import '../../modal/address_modal.dart';
import '../../repository/add_account/add_address_repository.dart';
import '../../untils/app_fonts.dart';
import '../account screen/address screen/add_new_address.dart';
import '../account screen/address screen/update_address_screen.dart';
import 'checkout_delivery.dart';
import 'checkout_Payment.dart';

class CheckAddress extends StatefulWidget {
  final int total;
  final List<CartModal>? cartList;

  const CheckAddress({Key? key, required this.total,required this.cartList, }) : super(key: key);

  @override
  _CheckAddressState createState() => _CheckAddressState();
}

class _CheckAddressState extends State<CheckAddress> {
  int? grpValue;
  String? uid;
  String? addressID;
  String? addressFull;
  String? addFullName;
  String? addPhoneNo;
  int? total;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    total = widget.total;

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    uid = user?.uid;
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
          "Checkout",
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
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 32, bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1.0, color: colorGreen)),
                          ),
                          Positioned(
                            right: 5,
                            left: 5,
                            top: 5,
                            bottom: 5,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                  color: colorGreen, shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width / 3,
                        color: colorGreen,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1.0, color: colorGreen)),
                          ),
                          Positioned(
                            right: 5,
                            left: 5,
                            top: 5,
                            bottom: 5,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                  color: colorGreen, shape: BoxShape.circle),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width / 3,
                        color: colorGrey,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1.0, color: colorGrey)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Delivery"),
                      Text("Address"),
                      Text("Payments"),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddNewAddress()));
                  },
                  child: Container(
                    height: 50,
                    width: 146,
                    margin:
                        const EdgeInsets.only(left: 200, top: 10, bottom: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: colorGreen,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "NEW",
                      style: defaultTextStyle(
                          fontColors: colorWhite,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection(FirebaseString.userCollection)
                      .doc(uid)
                      .collection(FirebaseString.addressCollection)
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          AddressModal addressModal =
                              AddressModal.fromDocs(snapshot.data.docs[index]);
                          int valueRadio = snapshot.data.docs.length;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 3,
                              child: Container(
                                margin: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      addressModal.fullName.toString(),
                                      style: defaultTextStyle(),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 290,
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            "${addressModal.addStreetNo.toString()}, ${addressModal.addStreet.toString()}, ${addressModal.addCity.toString()}, ${addressModal.addState.toString()}, ${addressModal.addCountry.toString()}, ${addressModal.addPinCode.toString()}",
                                          ),
                                        ),
                                        const Spacer(),
                                        Radio(
                                            value: index,
                                            activeColor: colorGreen,
                                            groupValue: grpValue,
                                            onChanged: (int? value) {
                                              setState(() {
                                                grpValue = value!;
                                                addressID = addressModal.addId
                                                    .toString();
                                                addressFull =
                                                    "${addressModal.addStreetNo.toString()}, ${addressModal.addStreet.toString()}, ${addressModal.addCity.toString()}, ${addressModal.addState.toString()}, ${addressModal.addCountry.toString()}, ${addressModal.addPinCode.toString()}";
                                                addFullName = addressModal
                                                    .fullName
                                                    .toString();
                                                addPhoneNo = addressModal
                                                    .phoneNo
                                                    .toString();
                                              });
                                            }),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateAddress(
                                                  street1: addressModal
                                                      .addStreetNo
                                                      .toString(),
                                                  street2: addressModal
                                                      .addStreet
                                                      .toString(),
                                                  state: addressModal.addState
                                                      .toString(),
                                                  city: addressModal.addCity
                                                      .toString(),
                                                  country: addressModal
                                                      .addCountry
                                                      .toString(),
                                                  fullName: addressModal
                                                      .fullName
                                                      .toString(),
                                                  pin: addressModal.addPinCode
                                                      .toString(),
                                                  addId: addressModal.addId
                                                      .toString(),
                                                  phone: addressModal.phoneNo
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          },
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    colorGreen
                                                        .withOpacity(0.2)),
                                          ),
                                          child: const Text(
                                            "Change",
                                            style: TextStyle(color: colorGreen),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            AddressRepository
                                                .AddressDetailDelete(
                                                    context: context,
                                                    addId: addressModal.addId
                                                        .toString());
                                          },
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    colorGreen
                                                        .withOpacity(0.2)),
                                          ),
                                          child: const Text(
                                            "Delete",
                                            style: TextStyle(color: colorGreen),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (!snapshot.hasData) {
                      print(" error :${snapshot.error}");
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const Center(
                      child: Text("No Data Found"),
                    );
                  },
                ),
                // jgya

                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 146,
                            margin: const EdgeInsets.only(left: 32),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: colorGreen),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "BACK",
                              style: defaultTextStyle(
                                  fontColors: colorBlack,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => CheckoutPayment(
                                          addFullName: addFullName.toString(),
                                          addPhoneNo: addPhoneNo.toString(),
                                          address: addressFull.toString(),
                                          total: widget.total.toInt(),
                                          addressID: addressID.toString(),
                                      cartList:widget.cartList
                                        )));
                          },
                          child: Container(
                            height: 50,
                            width: 146,
                            margin: const EdgeInsets.only(right: 32),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: colorGreen,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "NEXT",
                              style: defaultTextStyle(
                                  fontColors: colorWhite,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
