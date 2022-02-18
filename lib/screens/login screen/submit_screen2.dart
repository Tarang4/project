// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/modal/user_model.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/user_database_util.dart';

import 'edit_by_email.dart';
import 'login_screen.dart';


class SubmitScreen2 extends StatefulWidget {
  const SubmitScreen2({Key? key}) : super(key: key);

  @override
  _SubmitScreen2State createState() => _SubmitScreen2State();
}

class _SubmitScreen2State extends State<SubmitScreen2> {
  List<UserModel> userList = [];
  String spEmail = '';
  String spPassword = '';

  delete() async {
    final SharedPreferences sharePrefrences =
        await SharedPreferences.getInstance();
    sharePrefrences.remove("email");
    sharePrefrences.remove("password");
  }

  retrive() async {
    final SharedPreferences sharePrefrences =
        await SharedPreferences.getInstance();
    spEmail = sharePrefrences.getString("email")!;
    spPassword = sharePrefrences.getString("password")!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getDateSharePrefrence();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
            Text(spEmail),
            Text(spPassword),
            Expanded(
              child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    UserModel model = userList[index];
                    String firsName = model.firstName.toString();
                    String lastName = model.lastName.toString();
                    String address = model.address.toString();
                    String photo = model.profile.toString();
                    String phone = model.phone.toString();
                    String pincode = model.pincode.toString();
                    String city = model.city.toString();
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black26),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "FirstName : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      firsName,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "lastName : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      lastName,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Email : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      model.email.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Password : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      model.password.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Address : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      address == "null"
                                          ? "-"
                                          : model.address.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Phone : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      phone == "null"
                                          ? "-"
                                          : model.phone.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Pincode : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      pincode == "null"
                                          ? "-"
                                          : model.pincode.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "City : ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      city == "null"
                                          ? "-"
                                          : model.city.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.delete,
                                        size: 25.0,
                                      ),
                                      onPressed: () async {
                                        await DatabaseUtils.db
                                            .deleteData(model.id ?? 0);
                                        getData();
                                      },
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.edit,
                                        size: 25.0,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditByEmail(
                                              email: model.email.toString(),
                                              username:  firsName == "null"
                                                  ? ""
                                                  : firsName,
                                              address: address == "null"
                                                  ? ""
                                                  : address,
                                              phone:
                                                  phone == "null" ? "" : phone,
                                              pincode: pincode == "null"
                                                  ? ""
                                                  : pincode,
                                              city: city == "null" ? "" : city,
                                              profile:
                                                  photo == "null" ? "" : photo,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                photo == "null"
                                    ? Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: colorLightGrey,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.person_pin,
                                          size: 70,
                                        ),
                                      )
                                    : Container(
                                        height: 80,
                                        width: 80,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.file(
                                          File(photo),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                InkWell(
                                  onTap: () async {
                                    delete();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 70,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: colorGrey,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Log-Out",
                                      style: TextStyle(color: colorBlack),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  getData() async {
    List<UserModel> model = await DatabaseUtils.db.getData();
    setState(() {
      userList = model;
    });
  }

  getDateSharePrefrence() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? email = sharedPreferences.getString("email");
    String? password = sharedPreferences.getString("password");
    setState(() {
      spEmail = email!;
      spPassword = password!;
    });
  }
}
