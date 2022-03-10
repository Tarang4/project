import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/config/app_colors.dart';
import 'package:untitled/untils/toast/flutter_toast_method.dart';

import '../../config/Localstorage_string.dart';
import '../../main.dart';
import '../../repository/add_account/update_usersdata_respository.dart';
import 'change_password.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  int? isGender;
  bool isPassword = true;
  final ImagePicker _imagePicker = ImagePicker();
  String? photo;
  final updateScreenKey = GlobalKey<FormState>();


  String prefEmail = pref!.getString(LocalStorageKey.email)!;
  String phone = pref!.getString(LocalStorageKey.phone)!;
  String firstName = pref!.getString(LocalStorageKey.firstName)!;
  String currentPassword = pref!.getString(LocalStorageKey.password)!;
  String lastName = pref!.getString(LocalStorageKey.lastName)!;
  String gender = pref!.getString(LocalStorageKey.gender)!;
  String birthdate = pref!.getString(LocalStorageKey.birthdate)!;
  bool? isLogins = pref!.getBool(LocalStorageKey.isLogin);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fNameController.text=firstName;
    _lNameController.text=lastName;
    isGender=int.parse(gender);
    _birthDateController.text=birthdate;

  }

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
                                  UserUpDateRepository.upDateProfile(
                                    firstName: _fNameController.text,
                                    lastName: _lNameController.text,
                                    gender: isGender.toString(),
                                    birthDate:_birthDateController.text,
                                    profilePhoto: '',

                                    context: context,
                                  );

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
                        Text("BirthDate",
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
                              if (_birthDateController.text.length < 10) {
                                return 'Wrong Phone Number';
                              }
                            },
                            controller: _birthDateController,
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
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangePassword(email: prefEmail,)));
                          },
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
