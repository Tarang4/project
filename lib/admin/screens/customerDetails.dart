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
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite,
        title: Text(
          "Customer Details",
          style: defaultTextStyle(
              fontSize: 20.0,
              fontColors: colorBlack,
              fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AnimationLimiter(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(FirebaseString.userCollection)
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: EdgeInsets.all(_w / 30),
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          UserModal userModal = UserModal.fromJson(
                              snapshot.data.docs[index].data());

                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              verticalOffset: -250,
                              child: ScaleAnimation(
                                duration: const Duration(milliseconds: 1500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 40,
                                        spreadRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(left: 130),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            height: 100,
                                            width: 100,
                                            imageUrl: userModal.profilePhoto
                                                .toString(),
                                            placeholder: (context, url) =>
                                                const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: CircularProgressIndicator(
                                                  color: colorGreen),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "First Name"),
                                          description(
                                              description: userModal.firstName
                                                  .toString())
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "last Name"),
                                          description(
                                              description:
                                                  userModal.lastName.toString())
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "Gender"),
                                          description(
                                              description:
                                                  userModal.gender.toString())
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "Email"),
                                          description(
                                              description:
                                                  userModal.email.toString())
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "Phone"),
                                          description(
                                              description:
                                                  userModal.phone.toString())
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "BirthDate"),
                                          description(
                                              description: userModal.birthdate
                                                  .toString())
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          heading(title: "Created Time"),
                                          description(
                                              description:
                                                  userModal.createAt.toString())
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          heading(title: "Login Time"),
                                          Expanded(
                                              child: description(
                                                  description: userModal
                                                      .isLoginTime
                                                      .toString()))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          heading(title: "Last Updated"),
                                          Expanded(
                                              child: description(
                                                  description: userModal
                                                      .updateAt
                                                      .toString()))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary: colorGreen, // background
                                            onPrimary: Colors.white, // foreground
                                          ),
                                          child: const Text("Delete User"))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Center(
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
      style: defaultTextStyle(fontSize: 15.0, fontWeight: FontWeight.w700),
    );
  }

  Widget description({String? description}) {
    return Text(
      " ${description ?? ""}",
      style: defaultTextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
    );
  }
}
