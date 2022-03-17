import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../config/FireStore_string.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../../repository/auth/getUserById.dart';
import '../../untils/app_fonts.dart';
import '../../untils/toast/flutter_toast_method.dart';
import '../login screen/forget_screen.dart';

class ChangePassword extends StatefulWidget {
  final String email;

  const ChangePassword({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late String email;
  bool isPassword = true;

  final loginScreenKey = GlobalKey<FormState>();
  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  String currentPassword = pref!.getString(LocalStorageKey.password)!;
  String currentPasswordToken = pref!.getString(LocalStorageKey.passwordToken)!;

  FocusNode emailFocus = FocusNode();

  //get user data fore
  DocumentSnapshot? userDetailModel;
  String? uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    email = widget.email;
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
                height: MediaQuery.of(context).size.height * 0.175,
              ),
              Form(
                key: loginScreenKey,
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
                              "Change Password",
                              style: defaultTextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  fontColors: colorGreen),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text("OLD Password",
                            style: defaultTextStyle(
                                fontColors: colorGrey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            obscureText: isPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Password';
                              }
                              if (_oldController.text.length < 8) {
                                return 'Please Enter 8 Digits Password';
                              }
                            },
                            controller: _oldController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: colorBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: isPassword
                                    ? Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : Icon(Icons.visibility_off,
                                        color: Colors.black),
                                onPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                              ),
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
                        Text("Enter New Password",
                            style: defaultTextStyle(
                                fontColors: colorGrey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            obscureText: true,
                            controller: _password1Controller,
                            textInputAction: TextInputAction.done,
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
                        const SizedBox(
                          height: 39,
                        ),
                        Text("Confirm Password",
                            style: defaultTextStyle(
                                fontColors: colorGrey,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 33,
                          child: TextFormField(
                            obscureText: isPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Password';
                              }
                              if (_password2Controller.text.length < 8) {
                                return 'Please Enter 8 Digits Password';
                              }
                            },
                            controller: _password2Controller,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: colorBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: isPassword
                                    ? Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : Icon(Icons.visibility_off,
                                        color: Colors.black),
                                onPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                              ),
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
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgetScreen(email: email)));
                              },
                              child: Text(
                                "Forget Password",
                                style: defaultTextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    fontColors: colorGreen),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        InkWell(
                          onTap: () async {
                            if (loginScreenKey.currentState!.validate()) {
                              if (_password1Controller.text ==
                                  _password2Controller.text) {
                                _changePassword(_oldController.text,
                                    _password2Controller.text);
                              } else {
                                ToastMethod.simpleToast(
                                    massage: "enter same password");
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: colorGreen,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Change Password",
                              style: defaultTextStyle(
                                  fontColors: colorWhite,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
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

  void _changePassword(String oldPass, String newPassword) async {
    userDetailModel =
        await GetUserById.getUserData(context: context, userId: uid);
    if (currentPassword==_oldController.text) {
      pref?.remove(LocalStorageKey.password);
      User? user = await FirebaseAuth.instance.currentUser;

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: oldPass,
      );
      user?.updatePassword(newPassword).then((_) async {

        final FirebaseAuth _auth = FirebaseAuth.instance;
        final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

        var id = _auth.currentUser?.uid;
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        final CollectionReference _upDatePasswordCollection =
            firebaseFirestore.collection(FirebaseString.userCollection);
        if (id != null) {
          final CollectionReference _mainCollection =
              _fireStore.collection(FirebaseString.userCollection);

          DocumentReference? documentId;
          DocumentReference newPasswordToken =
              _mainCollection.doc(documentId?.id);
          String newPasswordTokenId = newPasswordToken.id;

          await _upDatePasswordCollection.doc(_auth.currentUser?.uid).update({
            "password": newPassword,
            "passwordToken": newPasswordTokenId,
          });
          print("Your password changed Successfully ");
          ToastMethod.simpleToast(massage: "Change Password");
          Navigator.pop(context);
          pref!.setString(LocalStorageKey.password, newPassword);
          pref!.setString(LocalStorageKey.passwordToken, newPasswordTokenId);
        }
      }).catchError((err) {
        ToastMethod.simpleToast(massage: " no Change Password $err");

        print("You can't change the Password" + err.toString());
      });
    } else {
      ToastMethod.simpleToast(massage: "Old Password Wrong");
    }
  }
}
