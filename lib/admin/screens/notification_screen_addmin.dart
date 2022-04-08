import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled/admin/repository/notification_repository.dart';
import '../../../admin/modal/notification_model.dart';

import '../../user_side/config/FireStore_string.dart';
import '../../user_side/config/app_colors.dart';
import '../../user_side/untils/app_fonts.dart';
import 'notification_add_admin.dart';

class NotificationAdminScreen extends StatefulWidget {
  const NotificationAdminScreen({Key? key}) : super(key: key);

  @override
  _NotificationAdminScreenState createState() =>
      _NotificationAdminScreenState();
}

class _NotificationAdminScreenState extends State<NotificationAdminScreen> {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite.withOpacity(0.1),
        centerTitle: true,
        title: Text(
          "Notification",
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorGreen,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => const NotificationAdmin()));
        },
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: AnimationLimiter(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(FirebaseString.adminCollection)
                    .doc("rha4OKCNrwpPoDiDtTvq")
                    .collection(FirebaseString.notificationCollection)
                    .snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.all(10),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        NotificationModal modal = NotificationModal.fromJson(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          modal.title.toString(),
                                          style: defaultTextStyle(),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              NotificationRepository
                                                  .deleteNotification(
                                                      notificationId: modal
                                                          .notificationId
                                                          .toString());
                                            },
                                            icon: const Icon(
                                              Icons.cancel_rounded,
                                              color: colorGrey,
                                            ))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(modal.description.toString()),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(modal.notificationDate.toString(),
                                            style: defaultTextStyle(
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w300,
                                                fontColors: colorGrey)),
                                        Text(
                                          modal.notificationTime.toString(),
                                          style: defaultTextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.w500,
                                              fontColors: colorGrey),
                                        ),
                                      ],
                                    )
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
      )),
    );
  }
}
