import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../config/app_colors.dart';
import '../../../repository/add_account/add_address_repository.dart';
import '../../../untils/app_fonts.dart';
import 'address_detail.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String phoneController = '';

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
                      Container(
                        width: double.infinity,
                        height: 33,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Full Name';
                            }
                          },
                          controller: fullName,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          cursorColor: colorGreen,
                          cursorHeight: 22,
                          cursorWidth: 1.2,
                          style: const TextStyle(
                              color: colorBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorLightGrey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorGreen),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Enter Phone Number",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: colorGrey,
                            fontWeight: FontWeight.w400),
                      ),
                      IntlPhoneField(
                        cursorColor: colorGreen,
                        style: TextStyle(fontSize: 16),
                        disableLengthCheck: false,
                        textAlignVertical: TextAlignVertical.center,
                        dropdownTextStyle: TextStyle(fontSize: 16),
                        dropdownIcon:
                            Icon(Icons.arrow_drop_down, color: colorGreen),
                        decoration: const InputDecoration(
                          hintText: 'Phone Number',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: colorGreen,
                              width: 1,
                            ),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                          phoneController = phone.completeNumber.toString();
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "House No",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      Container(
                        width: double.infinity,
                        height: 33,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Full Name';
                            }
                          },
                          controller: street1,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: colorGreen,
                          cursorHeight: 22,
                          cursorWidth: 1.2,
                          style: const TextStyle(
                              color: colorBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorLightGrey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorGreen),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Street Name",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      Container(
                        width: double.infinity,
                        height: 33,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Full Name';
                            }
                          },
                          controller: street2,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          cursorColor: colorGreen,
                          cursorHeight: 22,
                          cursorWidth: 1.2,
                          style: const TextStyle(
                              color: colorBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorLightGrey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorGreen),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "City",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      Container(
                        width: double.infinity,
                        height: 33,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Full Name';
                            }
                          },
                          controller: city,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          cursorColor: colorGreen,
                          cursorHeight: 22,
                          cursorWidth: 1.2,
                          style: const TextStyle(
                              color: colorBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorLightGrey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorGreen),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
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
                                Container(
                                  width: double.infinity,
                                  height: 33,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter Your Full Name';
                                      }
                                    },
                                    controller: state,
                                    textCapitalization: TextCapitalization.sentences,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    cursorColor: colorGreen,
                                    cursorHeight: 22,
                                    cursorWidth: 1.2,
                                    style: const TextStyle(
                                        color: colorBlack,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: colorLightGrey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: colorGreen),
                                      ),
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
                                Container(
                                  width: double.infinity,
                                  height: 33,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter Country';
                                      }
                                    },
                                    controller: country,
                                    textCapitalization: TextCapitalization.sentences,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    cursorColor: colorGreen,
                                    cursorHeight: 22,
                                    cursorWidth: 1.2,
                                    style: const TextStyle(
                                        color: colorBlack,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(color: colorLightGrey),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: colorGreen),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "PinCode",
                        style: defaultTextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontColors: colorGrey),
                      ),
                      Container(
                        width: double.infinity,
                        height: 53,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Full Name';
                            }
                          },
                          controller: pin,maxLength: 6,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: colorGreen,
                          cursorHeight: 22,
                          cursorWidth: 1.2,
                          style: const TextStyle(
                              color: colorBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorLightGrey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorGreen),
                            ),
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
        fullName: fullName.text,
        phone: phoneController);

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const AddressDetail()));
  }
}
