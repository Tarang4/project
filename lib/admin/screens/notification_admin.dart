import 'package:flutter/material.dart';
import '../../user_side/config/app_colors.dart';
import '../../user_side/untils/app_fonts.dart';

class NotificationAdmin extends StatefulWidget {
  const NotificationAdmin({Key? key}) : super(key: key);

  @override
  State<NotificationAdmin> createState() => _NotificationAdminState();
}

class _NotificationAdminState extends State<NotificationAdmin> {
  final _formkeyNotification = GlobalKey<FormState>();
  TextEditingController notiTitle = TextEditingController();
  TextEditingController notiDisc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          automaticallyImplyLeading: false,
          backgroundColor: colorWhite,
          title: Text(
            "Add Notification",
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
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formkeyNotification,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      cursorColor: colorGreen,
                      controller: notiTitle,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Title';
                        }
                      },
                      decoration: InputDecoration(
                        label: Text(
                          "NotiFication Title",
                          style: defaultTextStyle(
                              fontSize: 17.0, fontColors: colorGreen),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGreen),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGreen),
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: colorGreen,
                      controller: notiDisc,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Discription';
                        }
                      },
                      decoration: InputDecoration(
                        label: Text("NotiFication Discription",
                            style: defaultTextStyle(
                                fontSize: 17.0, fontColors: colorGreen)),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGreen),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGreen),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      cursorColor: colorGreen,
                      controller: notiDisc,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter URL';
                        }
                      },
                      decoration: InputDecoration(
                        label: Text("Notification Photo URl",
                            style: defaultTextStyle(
                                fontSize: 17.0, fontColors: colorGreen)),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGreen),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGreen),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  if(_formkeyNotification.currentState!.validate()){

                  }
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: colorGreen,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Confirm",
                    style: defaultTextStyle(
                        fontColors: colorWhite,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
