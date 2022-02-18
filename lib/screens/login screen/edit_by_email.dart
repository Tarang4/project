// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/screens/account%20screen/account_screen.dart';
import 'package:untitled/screens/login%20screen/submit_screen2.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';
import 'package:untitled/untils/user_database_util.dart';

class EditByEmail extends StatefulWidget {
  final String email;
  final String profile;
  final String username;
  final String address;
  final String phone;
  final String pincode;
  final String city;

  const EditByEmail(
      {Key? key,
      required this.email,
      required this.profile,
      required this.username,
      required this.address,
      required this.phone,
      required this.pincode,
      required this.city})
      : super(key: key);

  @override
  _EditByEmailState createState() => _EditByEmailState();
}

class _EditByEmailState extends State<EditByEmail> {
  String? photo;
  final ImagePicker _imagePicker = ImagePicker();
  bool isPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  // TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    emailController.text = widget.email;
    photo=widget.profile;
    userNameController.text = widget.username;
    addressController.text = widget.address;
    phoneController.text = widget.phone;
    pincodeController.text = widget.pincode;
    cityController.text = widget.city;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountScreen()));
                      },
                      child: Container(
                          width: 20,
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            top: 10,
                          ),
                          alignment: Alignment.centerLeft,
                          child: const Icon(Icons.arrow_back)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Card(
                      elevation: 6.8,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 14, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Edit Profile",
                              style: defaultTextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () => openImageDialog(),
                                    child: photo != null && photo!.isNotEmpty
                                        ? Container(
                                            height: 100,
                                            width: 100,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.file(
                                              File(photo ?? ""),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: colorLightGrey,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.person_pin,
                                              size: 70,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Name",
                              style: defaultTextStyle(
                                  fontSize: 14.0,
                                  fontColors: colorGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 33,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'First Name';
                                  }
                                },
                                controller: userNameController,
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
                                        BorderSide(color: colorLightGrey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorGreen),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 39,
                            ),
                            Text(
                              "Email",
                              style: defaultTextStyle(
                                  fontSize: 14.0,
                                  fontColors: colorGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 33,
                              child: TextFormField(
                                enabled: false,
                                validator: (value) {
                                  if (!EmailValidator.validate(value ?? "")) {
                                    return 'Enter valid email';
                                  }
                                },
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
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
                              height: 39,
                            ),
                            Text(
                              "Address",
                              style: defaultTextStyle(
                                  fontSize: 14.0,
                                  fontColors: colorGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 33,
                              child: TextFormField(
                                controller: addressController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
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
                              height: 39,
                            ),
                            Text(
                              "Phone",
                              style: defaultTextStyle(
                                  fontSize: 14.0,
                                  fontColors: colorGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: TextFormField(
                                controller: phoneController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
                                cursorColor: Colors.black,
                                maxLength: 10,
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
                              height: 39,
                            ),
                            Text(
                              "pincode",
                              style: defaultTextStyle(
                                  fontSize: 14.0,
                                  fontColors: colorGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: TextFormField(
                                maxLength: 6,
                                controller: pincodeController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
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
                              height: 39,
                            ),
                            Text(
                              "city",
                              style: defaultTextStyle(
                                  fontSize: 14.0,
                                  fontColors: colorGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 33,
                              child: TextFormField(
                                controller: cityController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
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
                            // Text(
                            //   "Password",
                            //   style: defaultTextStyle(
                            //       fontSize: 14.0,
                            //       fontColors: colorGrey,
                            //       fontWeight: FontWeight.w400),
                            // ),
                            const SizedBox(
                              height: 17,
                            ),
                            // SizedBox(
                            //   width: double.infinity,
                            //   height: 33,
                            //   child: TextFormField(
                            //     obscureText: isPassword,
                            //     validator: (value) {
                            //       if (value!.isEmpty) {
                            //         return 'Please Enter Password';
                            //       }
                            //       if (passwordController.text.length < 8) {
                            //         return 'Please Enter 8 Digits Password';
                            //       }
                            //     },
                            //     controller: passwordController,
                            //     textInputAction: TextInputAction.done,
                            //     keyboardType: TextInputType.emailAddress,
                            //     cursorColor: Colors.black,
                            //     style: const TextStyle(
                            //         color: colorBlack,
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.normal),
                            //     decoration: InputDecoration(
                            //       suffix: IconButton(
                            //           onPressed: () {
                            //             setState(() {
                            //               isPassword = !isPassword;
                            //             });
                            //           },
                            //           icon: isPassword
                            //               ? Icon(Icons.remove_red_eye_outlined)
                            //               : Icon(Icons.password_sharp)),
                            //       border: UnderlineInputBorder(
                            //         borderSide: BorderSide(color: colorGreen),
                            //       ),
                            //       focusedBorder: UnderlineInputBorder(
                            //         borderSide: BorderSide(color: colorGreen),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () async {
                                await DatabaseUtils.db.updateByEmail(
                                  profile: photo.toString(),
                                  email: emailController.text,
                                  username: userNameController.text,
                                  city: cityController.text,
                                  pincode: pincodeController.text,
                                  phone: phoneController.text,
                                  address: addressController.text,
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SubmitScreen2()));
                                // Fluttertoast.showToast(
                                //     msg: "Account Already Exist",
                                //     backgroundColor: Colors.white54,
                                //     textColor: Colors.white,
                                //     toastLength: Toast.LENGTH_SHORT,
                                //     gravity: ToastGravity.BOTTOM,
                                //     timeInSecForIosWeb: 1);
                              },
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.height,
                                color: colorGreen,
                                alignment: Alignment.center,
                                child: const Text(
                                  "UPDATE",
                                  style: TextStyle(color: colorWhite),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
        builder: (context) {
          return CupertinoActionSheet(
            title: Text("Select Profile"),
            message: Text("Select One Option From Below"),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  getImage(ImageSource.camera);
                },
                child: Text("Camera"),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  getImage(ImageSource.gallery);
                },
                child: Text("Gallary"),
              ),
            ],
          );
        });
  }

  getImage(ImageSource imageSource) async {
    final gelImage = await _imagePicker.pickImage(source: imageSource);
    setState(() {
      photo = gelImage?.path;
    });
  }
}
