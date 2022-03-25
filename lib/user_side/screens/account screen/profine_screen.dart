import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import '../../../main.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../../repository/add_account/update_usersdata_respository.dart';
import '../../repository/firebase_store_photo/photo_upload_repository.dart';
import '../../untils/app_fonts.dart';
import '../../untils/toast/flutter_toast_method.dart';
import 'account_screen.dart';
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
  final ImagePicker picker = ImagePicker();
  File? _photo;

  String? photo;
  final updateScreenKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();

  String prefEmail = pref!.getString(LocalStorageKey.email)!;
  String phone = pref!.getString(LocalStorageKey.phone)!;
  String profilePhoto = pref!.getString(LocalStorageKey.profilePhoto)!;
  String firstName = pref!.getString(LocalStorageKey.firstName)!;
  String currentPassword = pref!.getString(LocalStorageKey.password)!;
  String lastName = pref!.getString(LocalStorageKey.lastName)!;
  String gender = pref!.getString(LocalStorageKey.gender)!;
  String birthdate = pref!.getString(LocalStorageKey.birthdate)!;
  bool? isLogins = pref!.getBool(LocalStorageKey.isLogin);

  String? urlImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fNameController.text = firstName;
    _lNameController.text = lastName;
    isGender = int.parse(gender);
    _birthDateController.text = birthdate;
    // urlImage=profilePhoto;
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
          "Edit Profile",
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 0),
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: updateScreenKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 14, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () => openImageDialog(),
                          child: _photo != null
                              ? Stack(
                            children: [
                              Container(
                                  height: 110,
                                  width: 110,
                                  margin: EdgeInsets.all(3),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                  ),
                                  child: Image.file(
                                    _photo!,
                                    fit: BoxFit.cover,
                                  )),
                              Positioned(
                                left: 1,top: 1,bottom: 1,right: 1,
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: colorGreen,width: 1)
                                  ),
                                ),
                              ),

                            ],
                          )
                              : Stack(
                            children: [
                              Container(
                                height: 110,
                                width: 110,
                                margin: const EdgeInsets.all(3),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    color: Colors.grey.withOpacity(0.5)),
                                child: profilePhoto.contains("http")
                                    ? CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: profilePhoto,
                                  placeholder: (context, url) =>
                                  const CircularProgressIndicator(
                                      color: colorGreen),
                                  errorWidget: (context, url, error) =>
                                  new Icon(Icons.error),
                                )
                                    : Image.asset(
                                  profilePhoto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 0.1,top: 0.1,bottom: 0.1,right: 0.1,
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                      border: Border.all(color: colorGreen,width: 1)
                                  ),
                                ),
                              ),

                            ],
                          )
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
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
                          textCapitalization: TextCapitalization.sentences,
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
                      const Text(
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
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
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
                      const Text("Gender",
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
                                  splashColor: Colors.transparent,
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
                                    margin: const EdgeInsets.only(
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
                      const Text("BirthDate",
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
                        margin: const EdgeInsets.only(top: 15),
                        child: ScrollDatePicker(
                          style: const DatePickerStyle(
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePassword(
                                        email: prefEmail,
                                      )));
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              colorGreen.withOpacity(0.2)),
                        ),
                        child: const Text(
                          "Change Password",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: colorGreen),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async{
                          if (updateScreenKey.currentState!.validate()) {
                            uploadFile();
                          }
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: colorGreen,
                          ),
                          child: Text(
                            "SAVE",
                            style: defaultTextStyle(
                                fontColors: colorWhite,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0),
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
      ),
    );
  }

  openImageDialog() {
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: const Text(
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
                  photo = (await picker.pickImage(source: ImageSource.gallery))
                      as String?;
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
        setState(() {
          _photo = File(pickedFile.path);
        });
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
              CupertinoPageRoute(builder: (context) => const AccountScreen()));
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
        profilePhoto: profilePhoto,
        context: context,
      ).then((value) {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const AccountScreen()));
      });
      print(" no photo found file ");
    }
  }
}
