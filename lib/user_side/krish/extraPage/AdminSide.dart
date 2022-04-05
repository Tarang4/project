import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';

class AdminSide extends StatefulWidget {
  const AdminSide({Key? key}) : super(key: key);

  @override
  State<AdminSide> createState() => _AdminSideState();
}

class _AdminSideState extends State<AdminSide> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  bool S = false;
  bool M = false;
  bool XL = false;
  bool XXL = false;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  final ImagePicker _picker = ImagePicker();
  int? grpValue = 0;
  Color? mycolor1 = Colors.redAccent;
  Color? mycolor2 = Colors.green;
  Color? mycolor3 = Colors.yellow;
  Color? mycolor4 = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      radioLayout(
                          value: 1,
                          name: "Man",
                          valueChanged: (value) => onChange(value)),
                      radioLayout(
                          value: 2,
                          name: "Women",
                          valueChanged: (value) => onChange(value)),
                      radioLayout(
                          value: 3,
                          name: "Devices",
                          valueChanged: (value) => onChange(value)),
                      radioLayout(
                          value: 4,
                          name: "Gadgets",
                          valueChanged: (value) => onChange(value)),
                      radioLayout(
                          value: 5,
                          name: "perfumes",
                          valueChanged: (value) => onChange(value)),
                      TextFormField(
                        controller: productName,
                        cursorColor: colorGreen,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen)),
                            focusColor: colorGreen,
                            label: Text(
                              "Product Name",
                              style: TextStyle(
                                color: colorGreen,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: productDescription,
                        cursorColor: colorGreen,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen)),
                            focusColor: colorGreen,
                            label: Text(
                              "Product Description",
                              style: TextStyle(color: colorGreen),
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: productPrice,
                        cursorColor: colorGreen,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        decoration: InputDecoration(
                            counterText: "",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: colorGreen)),
                            focusColor: colorGreen,
                            label: Text(
                              "Product Price",
                              style: TextStyle(color: colorGreen),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Select Color:",
                        style: TextStyle(color: colorGreen, fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Pick a color!'),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: mycolor1!,
                                          //default color
                                          onColorChanged: (Color color) {
                                            //on color picked
                                            setState(() {
                                              mycolor1 = color;
                                            });
                                          },
                                        ),
                                      ),
                                      actions: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            margin: EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: colorLightGrey,
                                                      blurRadius: 0.9,
                                                      spreadRadius: 0.9,
                                                      offset: Offset(0.7, 0.7))
                                                ],
                                                color: colorGreen,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: colorGreen)),
                                            child: Text(
                                              "DONE",
                                              style: defaultTextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontColors: colorWhite,
                                                  fontSize: 14.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              margin: EdgeInsets.only(bottom: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 1, color: colorGreen)),
                              child: Text("Color 1"),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Pick a color!'),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: mycolor2!,
                                          //default color
                                          onColorChanged: (Color color) {
                                            //on color picked
                                            setState(() {
                                              mycolor2 = color;
                                            });
                                          },
                                        ),
                                      ),
                                      actions: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            margin: EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: colorLightGrey,
                                                      blurRadius: 0.9,
                                                      spreadRadius: 0.9,
                                                      offset: Offset(0.7, 0.7))
                                                ],
                                                color: colorGreen,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: colorGreen)),
                                            child: Text(
                                              "DONE",
                                              style: defaultTextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontColors: colorWhite,
                                                  fontSize: 14.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              margin: EdgeInsets.only(bottom: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 1, color: colorGreen)),
                              child: Text("Color 2"),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Pick a color!'),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: mycolor3!,
                                          //default color
                                          onColorChanged: (Color color) {
                                            //on color picked
                                            setState(() {
                                              mycolor3 = color;
                                            });
                                          },
                                        ),
                                      ),
                                      actions: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            margin: EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: colorLightGrey,
                                                      blurRadius: 0.9,
                                                      spreadRadius: 0.9,
                                                      offset: Offset(0.7, 0.7))
                                                ],
                                                color: colorGreen,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: colorGreen)),
                                            child: Text(
                                              "DONE",
                                              style: defaultTextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontColors: colorWhite,
                                                  fontSize: 14.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              margin: EdgeInsets.only(bottom: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 1, color: colorGreen)),
                              child: Text("Color 3"),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Pick a color!'),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: mycolor4!,
                                          //default color
                                          onColorChanged: (Color color) {
                                            //on color picked
                                            setState(() {
                                              mycolor4 = color;
                                            });
                                          },
                                        ),
                                      ),
                                      actions: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 70,
                                            margin: EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: colorLightGrey,
                                                      blurRadius: 0.9,
                                                      spreadRadius: 0.9,
                                                      offset: Offset(0.7, 0.7))
                                                ],
                                                color: colorGreen,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: colorGreen)),
                                            child: Text(
                                              "DONE",
                                              style: defaultTextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontColors: colorWhite,
                                                  fontSize: 14.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              margin: EdgeInsets.only(bottom: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 1, color: colorGreen)),
                              child: Text("Color 4"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: mycolor1,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: mycolor2,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: mycolor3,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: mycolor4,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select Size",
                                style: TextStyle(
                                  color: colorGreen,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Transform.scale(
                                        scale: 1.2,
                                        child: Checkbox(
                                          activeColor: colorGreen,
                                          side: const BorderSide(
                                              color: colorGrey),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          value: S,
                                          onChanged: (value) {
                                            setState(() {
                                              S = !S;
                                            });
                                          },
                                        ),
                                      ),
                                      Text("S"),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Transform.scale(
                                        scale: 1.2,
                                        child: Checkbox(
                                            activeColor: colorGreen,
                                            side: const BorderSide(
                                                color: colorGrey),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            value: M,
                                            onChanged: (value) {
                                              setState(() {
                                                M = !M;
                                              });
                                            }),
                                      ),
                                      Text("M"),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Transform.scale(
                                        scale: 1.2,
                                        child: Checkbox(
                                            activeColor: colorGreen,
                                            side: const BorderSide(
                                                color: colorGrey),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            value: XL,
                                            onChanged: (value) {
                                              setState(() {
                                                XL = !XL;
                                              });
                                            }),
                                      ),
                                      Text("XL"),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Transform.scale(
                                        scale: 1.2,
                                        child: Checkbox(
                                            activeColor: colorGreen,
                                            side: const BorderSide(
                                                color: colorGrey),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            value: XXL,
                                            onChanged: (value) {
                                              setState(() {
                                                XXL = !XXL;
                                              });
                                            }),
                                      ),
                                      Text("XXL"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Select Image",
                        style: TextStyle(
                          color: colorGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              chooseImage1(ImageSource.gallery);
                            },
                            child: image1 != null && image1!.isNotEmpty
                                ? Container(
                                    height: 100,
                                    width: 80,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: colorLightGrey,
                                    ),
                                    child: Image.file(
                                      File(
                                        image1 ?? "",
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : Container(
                                    height: 100,
                                    width: 80,
                                    color: colorLightGrey,
                                    child: Icon(Icons.add),
                                  ),
                          ),
                          InkWell(
                            onTap: () {
                              chooseImage2(ImageSource.gallery);
                            },
                            child: image2 != null && image2!.isNotEmpty
                                ? Container(
                                    height: 100,
                                    width: 80,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: colorLightGrey,
                                    ),
                                    child: Image.file(
                                      File(
                                        image2 ?? "",
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : Container(
                                    height: 100,
                                    width: 80,
                                    color: colorLightGrey,
                                    child: Icon(Icons.add),
                                  ),
                          ),
                          InkWell(
                            onTap: () {
                              chooseImage3(ImageSource.gallery);
                            },
                            child: image3 != null && image3!.isNotEmpty
                                ? Container(
                                    height: 100,
                                    width: 80,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: colorLightGrey,
                                    ),
                                    child: Image.file(
                                      File(
                                        image3 ?? "",
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : Container(
                                    height: 100,
                                    width: 80,
                                    color: colorLightGrey,
                                    child: Icon(Icons.add),
                                  ),
                          ),
                          InkWell(
                            onTap: () {
                              chooseImage4(ImageSource.gallery);
                            },
                            child: image4 != null && image4!.isNotEmpty
                                ? Container(
                                    height: 100,
                                    width: 80,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      color: colorLightGrey,
                                    ),
                                    child: Image.file(
                                      File(
                                        image4 ?? "",
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : Container(
                                    height: 100,
                                    width: 80,
                                    color: colorLightGrey,
                                    child: Icon(Icons.add),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  chooseImage1(ImageSource imageSource) async {
    final galImage = await _picker.pickImage(source: imageSource);
    setState(() {
      image1 = galImage?.path;
    });
  }

  chooseImage2(ImageSource imageSource) async {
    final galImage = await _picker.pickImage(source: imageSource);
    setState(() {
      image2 = galImage?.path;
    });
  }

  chooseImage3(ImageSource imageSource) async {
    final galImage = await _picker.pickImage(source: imageSource);
    setState(() {
      image3 = galImage?.path;
    });
  }

  chooseImage4(ImageSource imageSource) async {
    final galImage = await _picker.pickImage(source: imageSource);
    setState(() {
      image4 = galImage?.path;
    });
  }

  radioLayout({int? value, ValueChanged? valueChanged, String? name}) => Row(
        children: [
          Radio(
              value: value,
              groupValue: grpValue,
              onChanged: valueChanged,
              activeColor: colorGreen),
          Text(name ?? ""),
        ],
      );

  onChange(int? value) {
    setState(() {
      grpValue = value;
    });
  }
}
