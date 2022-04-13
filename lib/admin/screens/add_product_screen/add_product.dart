import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/admin/repository/add_product_photo.dart';
import '../../../user_side/config/app_colors.dart';
import '../../../user_side/untils/app_fonts.dart';
import '../../repository/add_product_repository.dart';
import 'add_photo_screen/add_photo_screen.dart';

class AddProductAdminSide extends StatefulWidget {
  const AddProductAdminSide({Key? key}) : super(key: key);

  @override
  State<AddProductAdminSide> createState() => _AddProductAdminSideState();
}

class _AddProductAdminSideState extends State<AddProductAdminSide> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController productName = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  bool red = false;
  bool green = false;
  bool yellow = false;
  bool blue = false;
  bool grey = false;
  bool orange = false;
  bool purple = false;
  bool S = false;
  bool M = false;
  bool XL = false;
  bool XXL = false;
  File? image1;
  File? image2;
  File? image3;
  File? image4;

  Color? mycolor1 = Colors.redAccent;
  Color? mycolor2 = Colors.green;
  Color? mycolor3 = Colors.yellow;
  Color? mycolor4 = Colors.blue;

  bool absorbPointer = false;

  final ImagePicker _picker = ImagePicker();
  int? grpValue = 0;
  String? urlImage1;
  String? urlImage2;
  String? urlImage3;
  String? urlImage4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite.withOpacity(0.5),
        title: Text(
          "Add Product",
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
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(
                left: 4,
                right: 4,
                top: 5,
              ),
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 40),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Category",
                          style: defaultTextStyle(
                              fontColors: colorGreen,
                              fontWeight: FontWeight.w100),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              radioLayout(
                                  name: "Men",
                                  value: 1,
                                  valueChanged: (value) => onChange(value)),
                              radioLayout(
                                  name: "Women",
                                  value: 2,
                                  valueChanged: (value) => onChange(value)),
                              radioLayout(
                                  name: "Kids",
                                  value: 3,
                                  valueChanged: (value) => onChange(value)),
                              radioLayout(
                                  name: "Shoes",
                                  value: 4,
                                  valueChanged: (value) => onChange(value)),
                              radioLayout(
                                  name: "Devices",
                                  value: 5,
                                  valueChanged: (value) => onChange(value)),
                              radioLayout(
                                  name: "Perfumes",
                                  value: 6,
                                  valueChanged: (value) => onChange(value)),
                              radioLayout(
                                  name: "Watches",
                                  value: 7,
                                  valueChanged: (value) => onChange(value)),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: productName,
                          cursorColor: colorGreen,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Name';
                            }
                          },
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: colorGreen)),
                              focusColor: colorGreen,
                              label: const Text(
                                "Product Name",
                                style: TextStyle(
                                  color: colorGreen,
                                ),
                              ),
                              labelStyle: defaultTextStyle(
                                  fontWeight: FontWeight.w400)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: productDescription,
                          cursorColor: colorGreen,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Discription';
                            }
                          },
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: colorGreen)),
                              focusColor: colorGreen,
                              label: const Text(
                                "Product Description",
                                style: TextStyle(color: colorGreen),
                              ),
                              labelStyle: defaultTextStyle(
                                  fontWeight: FontWeight.w400)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: productPrice,
                          cursorColor: colorGreen,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Price';
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          decoration: InputDecoration(
                              counterText: "",
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: colorGreen)),
                              focusColor: colorGreen,
                              label: const Text(
                                "Product Price",
                                style: TextStyle(color: colorGreen),
                              ),
                              labelStyle: defaultTextStyle(
                                  fontWeight: FontWeight.w400)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Select Color:",
                          style: TextStyle(color: colorGreen, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Pick a color!'),
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
                                              margin: const EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: colorLightGrey,
                                                        blurRadius: 0.9,
                                                        spreadRadius: 0.9,
                                                        offset:
                                                            Offset(0.7, 0.7))
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
                                margin: const EdgeInsets.only(bottom: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: colorGreen)),
                                child: const Text("Color 1"),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Pick a color!'),
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
                                              margin: const EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: colorLightGrey,
                                                        blurRadius: 0.9,
                                                        spreadRadius: 0.9,
                                                        offset:
                                                            Offset(0.7, 0.7))
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
                                margin: const EdgeInsets.only(bottom: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: colorGreen)),
                                child: const Text("Color 2"),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Pick a color!'),
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
                                              margin: const EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: colorLightGrey,
                                                        blurRadius: 0.9,
                                                        spreadRadius: 0.9,
                                                        offset:
                                                            Offset(0.7, 0.7))
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
                                margin: const EdgeInsets.only(bottom: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: colorGreen)),
                                child: const Text("Color 3"),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Pick a color!'),
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
                                              margin: const EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: colorLightGrey,
                                                        blurRadius: 0.9,
                                                        spreadRadius: 0.9,
                                                        offset:
                                                            Offset(0.7, 0.7))
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
                                margin: const EdgeInsets.only(bottom: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: colorGreen)),
                                child: const Text("Color 4"),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
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
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          elevation: 3,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
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
                                        const Text("S"),
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
                                                      BorderRadius.circular(
                                                          50)),
                                              value: M,
                                              onChanged: (value) {
                                                setState(() {
                                                  M = !M;
                                                });
                                              }),
                                        ),
                                        const Text("M"),
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
                                                      BorderRadius.circular(
                                                          50)),
                                              value: XL,
                                              onChanged: (value) {
                                                setState(() {
                                                  XL = !XL;
                                                });
                                              }),
                                        ),
                                        const Text("XL"),
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
                                                      BorderRadius.circular(
                                                          50)),
                                              value: XXL,
                                              onChanged: (value) {
                                                setState(() {
                                                  XXL = !XXL;
                                                });
                                              }),
                                        ),
                                        const Text("XXL"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => AddImagee(
                                          productName: productName.text,
                                          grpValue: grpValue,
                                        )));
                          },
                          child: const Text(
                            "Select Image",
                            style: TextStyle(
                              color: colorGreen,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                chooseImage1(ImageSource.gallery);
                              },
                              child: image1 != null
                                  ? Container(
                                      height: 100,
                                      width: 80,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          color: colorLightGrey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.file(
                                        image1!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      height: 100,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: colorLightGrey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(Icons.add),
                                    ),
                            ),
                            InkWell(
                              onTap: () {
                                chooseImage2(ImageSource.gallery);
                              },
                              child: image2 != null
                                  ? Container(
                                      height: 100,
                                      width: 80,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: colorLightGrey,
                                      ),
                                      child: Image.file(
                                        image2!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      height: 100,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: colorLightGrey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(Icons.add),
                                    ),
                            ),
                            InkWell(
                              onTap: () {
                                chooseImage3(ImageSource.gallery);
                              },
                              child: image3 != null
                                  ? Container(
                                      height: 100,
                                      width: 80,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: colorLightGrey,
                                      ),
                                      child: Image.file(
                                        image3!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      height: 100,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: colorLightGrey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(Icons.add),
                                    ),
                            ),
                            InkWell(
                              onTap: () {
                                chooseImage4(ImageSource.gallery);
                              },
                              child: image4 != null
                                  ? Container(
                                      height: 100,
                                      width: 80,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: colorLightGrey,
                                      ),
                                      child: Image.file(
                                        image4!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      height: 100,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: colorLightGrey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(Icons.add),
                                    ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                absorbPointer = true;
                              });
                              uploadImageFireBase();
                            }
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: colorGreen,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text(
                              "SAVE",
                              style: defaultTextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontColors: colorWhite),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          absorbPointer == false
              ? Container()
              : AbsorbPointer(
                  absorbing: absorbPointer,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.6),
                    child: Center(
                      child: Lottie.asset('assets/lottie/lpaty_product.json',
                          fit: BoxFit.cover),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  radioLayout({int? value, ValueChanged? valueChanged, String? name}) =>
      Container(
        margin: const EdgeInsets.only(left: 2, right: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: colorGrey, width: 1),
        ),
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: grpValue,
              onChanged: valueChanged,
              activeColor: colorGreen,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            ),
            Text(
              name ?? "",
              style:
                  defaultTextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
            ),
            const SizedBox(
              width: 7,
            ),
          ],
        ),
      );

  onChange(int? value) {

    setState(() {
      grpValue = value;
      // value==1?"ME";
    });
  }

  chooseImage1(ImageSource imageSource) async {
    final pickedFile = await _picker.pickImage(source: imageSource);
    setState(() {
      image1 = File(pickedFile!.path);
    });
  }

  chooseImage2(ImageSource imageSource) async {
    final pickedFile = await _picker.pickImage(source: imageSource);
    setState(() {
      image2 = File(pickedFile!.path);
    });
  }

  chooseImage3(ImageSource imageSource) async {
    final pickedFile = await _picker.pickImage(source: imageSource);
    setState(() {
      image3 = File(pickedFile!.path);
    });
  }

  chooseImage4(ImageSource imageSource) async {
    final pickedFile = await _picker.pickImage(source: imageSource);
    setState(() {
      image4 = File(pickedFile!.path);
    });
  }

  uploadImageFireBase() async {
    if (image1 != null) {
      final destination = 'product/$grpValue/${productName.text}';

      UploadTask? uploadTask =
          ProductPhotoRepository.uploadFile(destination, image1!, "1");

      if (uploadTask != null) {
        final TaskSnapshot downloadUrl = (await uploadTask);

        urlImage1 = await downloadUrl.ref.getDownloadURL();
        if (image2 != null) {
          final destination = 'product/$grpValue/${productName.text}';

          UploadTask? uploadTask =
              ProductPhotoRepository.uploadFile(destination, image2!, "2");

          if (uploadTask != null) {
            final TaskSnapshot downloadUrl = (await uploadTask);

            urlImage2 = await downloadUrl.ref.getDownloadURL();
            if (image3 != null) {
              final destination = 'product/$grpValue/${productName.text}';
              UploadTask? uploadTask =
                  ProductPhotoRepository.uploadFile(destination, image3!, "3");

              if (uploadTask != null) {
                final TaskSnapshot downloadUrl = (await uploadTask);

                urlImage3 = await downloadUrl.ref.getDownloadURL();
                if (image4 != null) {
                  final destination = 'product/$grpValue/${productName.text}';

                  UploadTask? uploadTask = ProductPhotoRepository.uploadFile(
                      destination, image4!, "4");

                  if (uploadTask != null) {
                    final TaskSnapshot downloadUrl = (await uploadTask);

                    urlImage4 = await downloadUrl.ref.getDownloadURL();
                    ProductRepository.productsAdd(
                      context: context,
                      uId: 'categories',
                      productName: productName.text,
                      productPrice: productPrice.text,
                      productInfo: productDescription.text,
                      categories: "$grpValue",
                      img1: urlImage1,
                      img2: urlImage2,
                      img3: urlImage3,
                      img4: urlImage4,
                      color1:
                          "0x${mycolor1?.value.toRadixString(16).toString()}",
                      color2:
                          "0x${mycolor2?.value.toRadixString(16).toString()}",
                      color3:
                          "0x${mycolor3?.value.toRadixString(16).toString()}",
                      color4:
                          "0x${mycolor4?.value.toRadixString(16).toString()}",
                      sizeS: M.toString(),
                      sizeM: S.toString(),
                      sizeXL: XL.toString(),
                      sizeXXL: XXL.toString(),
                    );
                    setState(() {
                      absorbPointer = false;
                    });
                    Navigator.pop(context);
                    print("download url is :$urlImage4");
                  } else {
                    print(" no download url 4");
                  }
                }
              } else {
                print(" no download url 3");
              }
            }
          } else {
            print(" no download url 2");
          }
        }
      } else {
        print(" no download url 1");
      }
    }
  }
}
