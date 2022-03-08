import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modal/address_modal.dart';
import 'package:untitled/screens/account%20screen/address%20screen/update_address_screen.dart';
import '../../../config/FireStore_string.dart';
import '../../../config/app_colors.dart';
import '../../../untils/app_fonts.dart';
import 'add_new_address.dart';

class AddressDetail extends StatefulWidget {
  const AddressDetail({Key? key}) : super(key: key);

  @override
  State<AddressDetail> createState() => _AddressDetailState();
}

class _AddressDetailState extends State<AddressDetail> {
  bool address = false;
  List<AddressModal> addressList = [];
  String? uid;
  bool isProgress = true;

  getUserAddress() {
    setState(() {
      isProgress = true;
    });
    FirebaseFirestore.instance
        .collection(FirebaseString.userCollection)
        .doc(uid)
        .collection(FirebaseString.addressCollection)
        .get()
        .then((value) {
      print(value);
      value.docs.forEach((element) {
        AddressModal addressModal = AddressModal.fromJson(element.data());
        setState(() {
          addressList.add(addressModal);
        });
      });
      print(addressList);
      setState(() {
        isProgress = false;
      });
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
  void initState() {
    // TODO: implement initState
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    uid = user?.uid;
    getUserAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 5,
                ),
                Text(
                  "Address Detail",
                  style: defaultTextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),

            Expanded(
              child: isProgress
                  ? Center(child: CircularProgressIndicator())
                  : addressList.isNotEmpty
                  ? ListView.builder(
                itemCount: addressList.length,
                itemBuilder: (BuildContext context, int index) {
                  AddressModal addressModal = addressList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              addressModal.fullName.toString(),
                              style: defaultTextStyle(),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 290,
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "${addressModal.addStreetNo
                                        .toString()},${addressModal.addStreet
                                        .toString()},${addressModal.addCity
                                        .toString()},${addressModal.addState
                                        .toString()},${addressModal.addCountry
                                        .toString()},${addressModal.addPinCode
                                        .toString()},",
                                  ),
                                ),
                                Spacer(),
                                Checkbox(
                                    activeColor: colorGreen,
                                    side: const BorderSide(
                                        color: colorGrey),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            50)),
                                    value: address,
                                    onChanged: (value) {
                                      setState(() {
                                        address = !address;
                                      });
                                    }),
                              ],
                            ),
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
                                          street2: addressModal.addStreet
                                              .toString(),
                                          state: addressModal.addState
                                              .toString(),
                                          city: addressModal.addCity
                                              .toString(),
                                          country: addressModal.addCountry
                                              .toString(),
                                          fullName: addressModal.fullName
                                              .toString(),
                                          pin: addressModal.addPinCode
                                              .toString(),
                                          refid: addressModal.addId.toString(),
                                        ),
                                  ),
                                );
                              },
                              child: Text(
                                "Change",
                                style: TextStyle(color: colorGreen),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
                  : Container(),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNewAddress()));
              },
              child: Container(
                height: 50,
                width: 146,
                margin: const EdgeInsets.only(left: 200, top: 10, bottom: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: colorGreen, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "NEW",
                  style: defaultTextStyle(
                      fontColors: colorWhite,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
