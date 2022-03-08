import 'package:flutter/material.dart';
import 'package:untitled/repository/add_account/add_address_repository.dart';

import '../../../config/app_colors.dart';
import '../../../untils/app_fonts.dart';
import 'address_detail.dart';

class UpdateAddress extends StatefulWidget {
  final String refid;
  final String street1;
  final String street2;
  final String city;
  final String state;
  final String country;
  final String fullName;
  final String pin;

  const UpdateAddress({
    Key? key,
    required this.street1,
    required this.street2,
    required this.city,
    required this.state,
    required this.country,
    required this.fullName,
    required this.pin,
    required this.refid,
  }) : super(key: key);

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String? refId;
  TextEditingController _street1 = TextEditingController();
  TextEditingController _street2 = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _country = TextEditingController();
  TextEditingController _fullName = TextEditingController();
  TextEditingController _pin = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _street1.text = widget.street1;
    _street2.text = widget.street2;
    _city.text = widget.city;
    _state.text = widget.state;
    _country.text = widget.country;
    _fullName.text = widget.fullName;
    _pin.text = widget.pin;
    _pin.text = widget.pin;
    refId = widget.refid;
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
                  width: MediaQuery.of(context).size.width / 9,
                ),
                Text(
                  "Update Addresss Detail",
                  style: defaultTextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Expanded(
              child: Container(
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
                        "Enter Name",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      TextFormField(
                        controller: _fullName,
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
                        controller: _street1,
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
                        controller: _street2,
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
                        controller: _city,
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
                                  controller: _state,
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
                                  controller: _country,
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
                        "pinCode",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      TextFormField(
                        controller: _pin,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      // AddressRepository.AddressDetailDelete(context: context);
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
                      updateAddress();
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
                      "UPDATE",
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
    );
  }

  updateAddress() async {
    AddressRepository.addressDetailUpdate(
        context: context,
        fullName: _fullName.text,
        addStreet1: _street1.text,
        addStreet2: _street2.text,
        country: _country.text,
        state: _state.text,
        city: _city.text,
        addPinCode: _pin.text,
        refId: refId);

    Navigator.pop(context);
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const CardsScreen()));
  }
}
