import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../../main.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../../repository/add_account/update_usersdata_respository.dart';
import '../../repository/firebase_store_photo/photo_upload_repository.dart';
import '../../untils/app_fonts.dart';
import '../../untils/toast/flutter_toast_method.dart';
import '../explore screen/explore_screen.dart';

class EditProfileScreen extends StatefulWidget {
  final String? password;

  const EditProfileScreen({Key? key, this.password}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  int? isGender;
  bool isPassword = true;
  final ImagePicker _imagePicker = ImagePicker();
  String? photo;
  String? password;
  final updateScreenKey = GlobalKey<FormState>();
  String? urlImage;
  String? userProfilePNG;
  final ImagePicker picker = ImagePicker();
  File? _photo;
  String? assetsImage="assets/images/user_profile.png" ;
  String prefEmail = pref!.getString(LocalStorageKey.email)!;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    password = widget.password;
    userProfilePNG =
        "https://firebasestorage.googleapis.com/v0/b/snatchkart-99b13.appspot.com/o/do%20not%20open%2Fkindpng_526237.png?alt=media&token=131ba55d-df96-4dbc-87a0-b5ab36865711";
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
                        Text(
                          "Edit Your Details",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w700),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => openImageDialog(),
                          child: _photo != null
                              ? Container(
                                  height: 100,
                                  width: 100,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                  ),
                                  child: Image.file(
                                    _photo!,
                                    fit: BoxFit.cover,
                                  ))
                              :
                          Container(
                            height: 100,
                            width: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70),
                                color: Colors.grey.withOpacity(0.5)),
                            child:Image.asset(assetsImage!)),

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
                            textCapitalization: TextCapitalization.sentences,
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
                            textCapitalization: TextCapitalization.sentences,
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
                        Container(
                          height: 200,
                          color: Colors.transparent,
                          margin: EdgeInsets.only(top: 15),
                          child: ScrollDatePicker(
                            style: DatePickerStyle(
                                selectedTextStyle: TextStyle(
                                    color: colorGreen,
                                    fontWeight: FontWeight.w500)),
                            selectedDate: _selectedDate,
                            locale: DatePickerLocale.enUS,
                            onDateTimeChanged: (DateTime value) {
                              setState(() {
                                _selectedDate = value;
                                _birthDateController.text =
                                    "${_selectedDate.day.toString()} -${_selectedDate.month.toString()} -${_selectedDate.year.toString()}";
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        InkWell(
                          onTap: () {
                            if (updateScreenKey.currentState!.validate()) {
                              uploadFile();
                            }
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colorGreen,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Create Account ",
                              style: defaultTextStyle(
                                fontColors: colorWhite,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 29,
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     // Navigator.push(
                        //     //     context,
                        //     //     CupertinoPageRoute(
                        //     //         builder: (context) => ForgotPassword(
                        //     //           email: '',
                        //     //         )));
                        //   },
                        //   child: Text(
                        //     "Forgot Password",
                        //     style: TextStyle(
                        //         fontSize: 14.0,
                        //         fontWeight: FontWeight.w400,
                        //         color: colorGreen),
                        //   ),
                        // ),
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
                child: const Text(
                  "Camera",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: colorGreen),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  getIamge(ImageSource.gallery);
                },
                child: const Text(
                  "Gallery",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: colorGreen),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: colorGreen),
                ),
              ),
            ],
          );
        });
  }

  getIamge(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);
    setState(() async {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('No image selected.');
        ToastMethod.simpleToast(massage: "No image selected.");
      }
    });
  }

  Future uploadFile() async {
    if (_photo != null) {
      final destination = 'UserProfile/$prefEmail';
      UploadTask? uploadTask = FireBasePhoto.uploadFile(destination, _photo!);

      if (uploadTask != null) {
        final TaskSnapshot downloadUrl = (await uploadTask);
        urlImage = await downloadUrl.ref.getDownloadURL();

        print("download url is :$urlImage");
        UserUpDateRepository.upDateProfile(
          firstName: _fNameController.text,
          lastName: _lNameController.text,
          gender: isGender.toString(),
          birthDate: _birthDateController.text,
          profilePhoto: urlImage,
          context: context,
        ).then((value) {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => ExploreScreen()));
        });
      } else {
        print(" no download url ");
      }
    } else {
      UserUpDateRepository.upDateProfile(
        firstName: _fNameController.text,
        lastName: _lNameController.text,
        gender: isGender.toString(),
        birthDate: _birthDateController.text,
        profilePhoto: assetsImage,
        context: context,
      ).then((value) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => ExploreScreen()));
      });
      print(" no photo found file ");
    }
  }
}