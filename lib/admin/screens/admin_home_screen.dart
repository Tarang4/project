import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/screens/product_edit.dart';

import '../../user_side/config/app_colors.dart';
import '../../user_side/untils/app_fonts.dart';
import 'customerDetails.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite,
        title: Text(
          "Admin Side",
          style: defaultTextStyle(
              fontSize: 20.0,
              fontColors: colorBlack,
              fontWeight: FontWeight.normal),
        ),
        actions: [
          FlatButton(
              onPressed: () {},
              child: const Text(
                'LogOut',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => ProductEdit()));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorGrey.withOpacity(0.3),
                  ),
                  child: Text(
                    "Product Edit",
                    style: defaultTextStyle(
                        fontSize: 20.0,
                        fontColors: colorBlack,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => CustomerDetails()));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorGrey.withOpacity(0.3),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "User Information",
                    style: defaultTextStyle(
                        fontSize: 20.0,
                        fontColors: colorBlack,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
