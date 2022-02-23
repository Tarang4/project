import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';import 'package:untitled/untils/app_colors.dart';

import 'forget_password.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final TextEditingController _fNameController = TextEditingController();

  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();

  int? isGender;
  bool isPassword = true;
  final ImagePicker _imagePicker = ImagePicker();
  String? photo;
  final updateScreenKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 0),
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Form(
                key: updateScreenKey,
                child: Card(
                  elevation: 7,
                  shadowColor: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 14, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Edit Your Details",
                              style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.w700),
                            ),
                            TextButton(
                              onPressed: () async {
                                if (updateScreenKey.currentState!.validate()) {
                                  // updateData();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const ProfileScreen()));
                                }
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: colorGreen),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => openImageDialog(),
                          child: photo != null && photo!.isNotEmpty
                              ? Container(
                            height: 100,
                            width: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                            ),
                            child: Image.file(
                              File(photo ?? ""),
                              fit: BoxFit.cover,
                            ),
                          )
                              : Container(
                            height: 100,
                            width: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                color: Colors.grey.withOpacity(0.5)),
                            child: const Icon(
                              Icons.person,
                              size: 45,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "First Name",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: colorGrey,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Name';
                              }
                            },
                            controller: _fNameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.black,
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
                          "Last Name",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: colorGrey,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Name';
                              }
                            },
                            controller: _lNameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.black,
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
                        Text("Gender",
                            style: TextStyle(
                                color: colorGrey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: List.generate(
                              2,
                                  (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    isGender = index;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: isGender == index
                                            ? colorGreen
                                            : colorGrey,
                                      )),
                                  margin: EdgeInsets.only(
                                      top: 10, right: 10, bottom: 10),
                                  child: Text(
                                      index == 0
                                          ? "Male"
                                          : index == 1
                                          ? "Female"
                                          : "Male",
                                      style: TextStyle(
                                          color: isGender == index
                                              ? colorBlack
                                              : colorGrey,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400)),
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Mobile Number",
                            style: TextStyle(
                                color: colorGrey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Phone Number';
                              }
                              if (_phoneController.text.length < 10) {
                                return 'Wrong Phone Number';
                              }
                            },
                            controller: _phoneController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: colorBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen),
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
                        const Text("Address",
                            style: TextStyle(
                                color: colorGrey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            controller: _addressController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Address';
                              }
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.streetAddress,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: colorBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen),
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
                            Container(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("city",
                                      style: TextStyle(
                                          color: colorGrey,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 33,
                                    child: TextFormField(
                                      controller: _cityController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter City';
                                        }
                                      },
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Colors.black,
                                      style: const TextStyle(
                                          color: colorBlack,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: colorGreen),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: colorGreen),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Pin Code",
                                        style: TextStyle(
                                            color: colorGrey,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 33,
                                      child: TextFormField(
                                        controller: _pinCodeController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter PinCode';
                                          }
                                          if (_passwordController.text.length <
                                              6) {
                                            return 'Please Enter valid PinCode';
                                          }
                                        },
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                        cursorColor: Colors.black,
                                        style: const TextStyle(
                                            color: colorBlack,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal),
                                        decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                            borderSide:
                                            BorderSide(color: colorGreen),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                            BorderSide(color: colorGreen),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword(email: '',))); },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: colorGreen),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  openImageDialog() {
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text(
              "select",
              style: TextStyle(fontSize: 25),
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  getIamge(ImageSource.camera);
                },
                child: const Text('camera'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  getIamge(ImageSource.gallery);
                },
                child: const Text('gallery'),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(context);
                  photo = (await _imagePicker.pickImage(
                      source: ImageSource.gallery)) as String?;
                },
                child: const Text('close'),
              ),
            ],
          );
        });
  }

  getIamge(ImageSource imageSource) async {
    final getIamge = await _imagePicker.pickImage(source: imageSource);
    setState(() {
      photo = getIamge?.path;
    });
  }
}
