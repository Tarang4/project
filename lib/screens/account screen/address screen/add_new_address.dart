import 'package:flutter/material.dart';
import 'package:untitled/screens/account%20screen/address%20screen/address_detail.dart';

import '../../../config/app_colors.dart';
import '../../../repository/add_account/add_address_repository.dart';
import '../../../untils/app_fonts.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController street1 = TextEditingController();
  TextEditingController street2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController fullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  Text(
                    "Add New Address",
                    style: defaultTextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      Text(
                        "Full Name",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      TextFormField(
                        controller: fullName,
                        cursorColor: colorGreen,
                        cursorHeight: 22,
                        cursorWidth: 1.2,
                        textInputAction: TextInputAction.next,
                        style: defaultTextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Text(
                        "Street 1",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      TextFormField(
                        controller: street1,
                        cursorColor: colorGreen,
                        cursorHeight: 22,
                        cursorWidth: 1.2,
                        textInputAction: TextInputAction.next,
                        style: defaultTextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Text(
                        "Street 2",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      TextFormField(
                        controller: street2,
                        cursorColor: colorGreen,
                        cursorHeight: 22,
                        cursorWidth: 1.2,
                        textInputAction: TextInputAction.next,
                        style: defaultTextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Text(
                        "City",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      TextFormField(
                        controller: city,
                        cursorColor: colorGreen,
                        cursorHeight: 22,
                        cursorWidth: 1.2,
                        textInputAction: TextInputAction.next,
                        style: defaultTextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "State",
                                  style: defaultTextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      fontColors: colorGrey),
                                ),
                                TextFormField(
                                  controller: state,
                                  cursorColor: colorGreen,
                                  cursorHeight: 22,
                                  cursorWidth: 1.2,
                                  textInputAction: TextInputAction.next,
                                  style: defaultTextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400),
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: colorGrey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 25),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Country",
                                  style: defaultTextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      fontColors: colorGrey),
                                ),
                                TextFormField(
                                  controller: country,
                                  cursorColor: colorGreen,
                                  cursorHeight: 22,
                                  cursorWidth: 1.2,
                                  textInputAction: TextInputAction.done,
                                  style: defaultTextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400),
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: colorGrey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      Text(
                        "pin",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      TextFormField(
                        controller: pin,
                        cursorColor: colorGreen,
                        cursorHeight: 22,
                        cursorWidth: 1.2,
                        textInputAction: TextInputAction.next,
                        style: defaultTextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorGrey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddressDetail()));
                      });
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
                        "CANCLE",
                        style: defaultTextStyle(
                            fontColors: colorBlack,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        print("SAVED");
                        insertAddress();
                      } else {
                        print('invalid!');
                      }
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
                        "SAVE",
                        style: defaultTextStyle(
                            fontColors: colorWhite,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  insertAddress() {
    AddressRepository.addressDetailAdd(
        context: context,
        addStreet1: street1.text,
        addStreet2: street2.text,
        country: country.text,
        state: state.text,
        addPinCode: pin.text,
        city: city.text,
        fullName: fullName.text);

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const AddressDetail()));
  }
}
