import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled/user_side/config/app_colors.dart';
import 'package:untitled/user_side/modal/user_model.dart';

import '../../user_side/config/FireStore_string.dart';
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
                child: StreamBuilder(
                  stream:  FirebaseFirestore.instance
                      .collection(FirebaseString.userCollection)
        .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return  ListView.builder(
                        padding: EdgeInsets.all(_w / 30),
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          UserModal userModal=
                              UserModal.fromJson(
                                  snapshot.data.docs[index].data());

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
                                      Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(30)),
                                          child:  CachedNetworkImage(
                                            fit: BoxFit.cover,height: 100,width: 100,
                                            imageUrl: userModal.profilePhoto.toString(),
                                            placeholder: (context, url) =>
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: CircularProgressIndicator(color: colorGreen),
                                                ),
                                            errorWidget: (context,url,error) => new Icon(Icons.error),
                                          )),
                                      Row(
                                        children: [

                                          heading(title: "First Name"),
                                          description(description: userModal.firstName.toString())
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "last Name"),
                                          description(description: userModal.lastName.toString())
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "Gender"),
                                          description(description: userModal.gender.toString())
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "Email"),
                                          description(description: userModal.email.toString())
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "Phone"),
                                          description(description: userModal.phone.toString())
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "BirthDate"),
                                          description(description: userModal.birthdate.toString())
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "Created Time"),
                                          description(description: userModal.createAt.toString())
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "Login Time"),
                                          description(description: userModal.isLoginTime.toString())
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "Last Updated"),
                                          description(description: userModal.updateAt.toString())
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: colorGreen,
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
