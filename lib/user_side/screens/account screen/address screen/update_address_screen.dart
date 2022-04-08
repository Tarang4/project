import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../config/app_colors.dart';
import '../../../repository/add_account/add_address_repository.dart';
import '../../../untils/app_fonts.dart';
import 'address_detail.dart';

class UpdateAddress extends StatefulWidget {
  final String addId;
  final String street1;
  final String street2;
  final String city;
  final String state;
  final String country;
  final String phone;
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
    required this.addId, required this.phone,
  }) : super(key: key);

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String? addId;
  String phoneController = '';


  TextEditingController street1 = TextEditingController();
  TextEditingController street2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController fullName = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    street1.text = widget.street1;
    street2.text = widget.street2;
    city.text = widget.city;
    state.text = widget.state;
    country.text = widget.country;
    fullName.text = widget.fullName;
    pin.text = widget.pin;
    pin.text = widget.pin;
    addId = widget.addId;
    phoneController = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite.withOpacity(0.2),
        centerTitle: true,
        title: Text(
          "Update Addresss Detail",
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
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
                        height: 45,
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
                        height: 20,
                      ),
                      const Text(
                        "Enter Phone Number",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: colorGrey,
                            fontWeight: FontWeight.w400),
                      ),
                      IntlPhoneField(
                        validator: (value) {
                          if (value==null) {
                            return 'Please Enter Your Phone No.';
                          }
                        },
                        cursorColor: colorGreen,
                        style: const TextStyle(fontSize: 16),
                        disableLengthCheck: false,
                        textAlignVertical: TextAlignVertical.center,
                        dropdownTextStyle: const TextStyle(fontSize: 16),
                        dropdownIcon:
                        const Icon(Icons.arrow_drop_down, color: colorGreen),
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
                      const SizedBox(
                        height: 20,
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
                        height: 45,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your House No';
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
                      const SizedBox(
                        height: 20,
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
                        height: 45,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Street';
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
                      const SizedBox(
                        height: 20,
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
                        height: 45,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your City';
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
                      const SizedBox(
                        height: 20,
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
                                  height: 45,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter Your State';
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
                                  height: 45,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter Your Country';
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
                      const SizedBox(
                        height: 20,
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
                        height: 60,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Pincode';
                            }
                          },
                          controller: pin,maxLength: 6,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/8.5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddressDetail()));
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
            ],
          ),
        ),
      ),
    );
  }

  updateAddress() async {
    AddressRepository.addressDetailUpdate(
        context: context,
        fullName: fullName.text,
        addStreet1: street1.text,
        addStreet2: street2.text,
        country: country.text,
        state: state.text,
        city:city.text,
        addPinCode: pin.text,
        addId: addId, phone:phoneController);
    Navigator.pop(context);
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const CardsScreen()));
  }
}
