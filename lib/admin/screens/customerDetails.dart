import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../user_side/untils/app_fonts.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                Text(
                  "Customer Details",

                )
              ],
            ),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  padding: EdgeInsets.all(_w / 30),
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        verticalOffset: -250,
                        child: ScaleAnimation(
                          duration: Duration(milliseconds: 1500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    heading(title: "First Name"),
                                    description(description: "")
                                  ],
                                ),
                                Row(
                                  children: [
                                    heading(title: "last Name"),
                                    description(description: "")
                                  ],
                                ),
                                Row(
                                  children: [
                                    heading(title: "Gender"),
                                    description(description: "")
                                  ],
                                ),
                                Row(
                                  children: [
                                    heading(title: "Email"),
                                    description(description: "")
                                  ],
                                ),
                                Row(
                                  children: [
                                    heading(title: "Phone"),
                                    description(description: "")
                                  ],
                                ),
                                Row(
                                  children: [
                                    heading(title: "BirthDate"),
                                    description(description: "")
                                  ],
                                ),
                                Row(
                                  children: [
                                    heading(title: "Created Time"),
                                    description(description: "")
                                  ],
                                ),
                                Row(
                                  children: [
                                    heading(title: "Login Time"),
                                    description(description: "")
                                  ],
                                ),
                                Row(
                                  children: [
                                    heading(title: "Last Updated"),
                                    description(description: "")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget heading({String? title}) {
    return Text(
      "${title ?? ""} :",
      style: defaultTextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
    );
  }

  Widget description({String? description}) {
    return Text(
      " ${description ?? ""}",
      style: defaultTextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
    );
  }
}
