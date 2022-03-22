import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:untitled/user_side/screens/explore%20screen/review_screen.dart';

import '../../admin/repository/add_product_repository.dart';
import '../config/FireStore_string.dart';
import '../config/app_colors.dart';
import '../modal/review_modal.dart';
import 'app_fonts.dart';

class CategoriesProduct extends StatefulWidget {
  final String pID;
  final String pImage1;
  final String pImage2;
  final String pImage3;
  final String pImage4;
  final String pName;
  final String pInfo;
  final String pPrice;
  final String color1;
  final String color2;
  final String color3;
  final String color4;
  final String size1;
  final String size2;
  final String size3;
  final String size4;
  final String review;
  final String reviewStar;

  const CategoriesProduct(
      {Key? key,
      required this.pImage1,
      required this.pImage2,
      required this.pImage3,
      required this.pImage4,
      required this.pName,
      required this.pInfo,
      required this.pPrice,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.color4,
      required this.size1,
      required this.size2,
      required this.size3,
      required this.size4,
      required this.review,
      required this.reviewStar,
      required this.pID})
      : super(key: key);

  @override
  _CategoriesProductState createState() => _CategoriesProductState();
}

class _CategoriesProductState extends State<CategoriesProduct> {
  String? pID;
  String? pImage1;
  String? pImage2;
  String? pImage3;
  String? pImage4;
  String? pName;
  String? pInfo;
  String? pPrice;
  Color? color1;
  Color? color2;
  Color? color3;
  Color? color4;
  String? size1;
  String? size2;
  String? size3;
  String? size4;
  String? review;
  String? reviewStar;

  int selectSize = 0;
  int selectColor = 0;

  String? size;
  bool isOne = false;
  bool isTwo = false;
  bool isThree = false;
  bool isFour = false;

  bool isColorOne = false;
  bool isColorTwo = false;
  bool isColorThree = false;
  bool isColorFour = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pID = widget.pID;

    pImage1 = widget.pImage1;
    pImage2 = widget.pImage2;
    pImage3 = widget.pImage3;
    pImage4 = widget.pImage4;

    pName = widget.pName;
    pInfo = widget.pInfo;
    pPrice = widget.pPrice;

    color1 = Color(int.parse(widget.color1)) == Color(0xffff5252)
        ? Colors.transparent
        : Color(int.parse(widget.color1));
    color2 = Color(int.parse(widget.color2)) == Color(0xff4caf50)
        ? Colors.transparent
        : Color(int.parse(widget.color2));
    color3 = Color(int.parse(widget.color3)) == Color(0xffffeb3b)
        ? Colors.transparent
        : Color(int.parse(widget.color3));
    color4 = Color(int.parse(widget.color4)) == Color(0xff2196f3)
        ? Colors.transparent
        : Color(int.parse(widget.color4));

    size1 = widget.size2 == "true" ? "S" : "";
    size2 = widget.size1 == "true" ? "M" : "";
    size3 = widget.size3 == "true" ? "XL" : "";
    size4 = widget.size4 == "true" ? "XXL" : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSlideshow(
                    width: double.infinity,
                    height: 450,
                    children: [
                      Image.network(
                        pImage1!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        pImage2!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        pImage3!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        pImage4!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                    onPageChanged: (value) {
                      print('Page changed: $value');
                    },
                    autoPlayInterval: 8000,
                    isLoop: true,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16,
                    ),
                    child: Text(
                      pName!,
                      style: defaultTextStyle(
                          fontWeight: FontWeight.bold, fontSize: 26.00),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size",
                            style: defaultTextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.00),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              size1 == "S"
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _sizeClick(
                                            one: true,
                                            two: false,
                                            four: false,
                                            three: false,
                                          );
                                          size = "S";
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 60,
                                        margin: EdgeInsets.only(right: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isOne == true
                                                ? colorGreen
                                                : colorLightGrey,
                                            width: 0.6,
                                          ),
                                        ),
                                        child: Text(
                                          size1!,
                                          style: defaultTextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13.00,
                                              fontColors: isOne == true
                                                  ? colorBlack
                                                  : colorGrey),
                                        ),
                                      ))
                                  : Container(),
                              size2 == "M"
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _sizeClick(
                                            one: false,
                                            two: true,
                                            four: false,
                                            three: false,
                                          );
                                          size = "M";
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 60,
                                        margin: EdgeInsets.only(right: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isTwo == true
                                                ? colorGreen
                                                : colorLightGrey,
                                            width: 0.6,
                                          ),
                                        ),
                                        child: Text(
                                          size2!,
                                          style: defaultTextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13.00,
                                              fontColors: isTwo == true
                                                  ? colorBlack
                                                  : colorGrey),
                                        ),
                                      ))
                                  : Container(),
                              size3 == "XL"
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _sizeClick(
                                            one: false,
                                            two: false,
                                            four: false,
                                            three: true,
                                          );
                                          size = "XL";
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 60,
                                        margin: EdgeInsets.only(right: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isThree == true
                                                ? colorGreen
                                                : colorLightGrey,
                                            width: 0.6,
                                          ),
                                        ),
                                        child: Text(
                                          size3!,
                                          style: defaultTextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13.00,
                                              fontColors: isThree == true
                                                  ? colorBlack
                                                  : colorGrey),
                                        ),
                                      ))
                                  : Container(),
                              size4 == "XXL"
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _sizeClick(
                                            one: false,
                                            two: false,
                                            four: true,
                                            three: false,
                                          );
                                          size = "XXL";
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 60,
                                        margin: EdgeInsets.only(right: 10),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isFour == true
                                                ? colorGreen
                                                : colorLightGrey,
                                            width: 0.6,
                                          ),
                                        ),
                                        child: Text(
                                          size4!,
                                          style: defaultTextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13.00,
                                              fontColors: isFour == true
                                                  ? colorBlack
                                                  : colorGrey),
                                        ),
                                      ))
                                  : Container(),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Color",
                            style: defaultTextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.00),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              color1 == Colors.transparent
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _colorClick(
                                            one: true,
                                            two: false,
                                            four: false,
                                            three: false,
                                          );
                                          size = "$color1";
                                        });
                                      },
                                      child: Container(
                                        height: 32,
                                        padding: EdgeInsets.all(1.5),
                                        width: 32,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: isColorOne == true
                                                ? colorGreen
                                                : color1!,
                                            width:
                                                isColorOne == true ? 2.3 : 1.3,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: color1),
                                      ),
                                    ),
                              color2 == Colors.transparent
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _colorClick(
                                            one: false,
                                            two: true,
                                            four: false,
                                            three: false,
                                          );
                                          size = "$color2";
                                        });
                                      },
                                      child: Container(
                                        height: 32,
                                        padding: EdgeInsets.all(1.5),
                                        width: 32,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: isColorTwo == true
                                                ? colorGreen
                                                : color2!,
                                            width:
                                                isColorTwo == true ? 2.3 : 1.3,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: color2),
                                      ),
                                    ),
                              color3 == Colors.transparent
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _colorClick(
                                            one: false,
                                            two: false,
                                            four: false,
                                            three: true,
                                          );
                                          size = "$color3";
                                        });
                                      },
                                      child: Container(
                                        height: 32,
                                        padding: EdgeInsets.all(1.5),
                                        width: 32,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: isColorThree == true
                                                ? colorGreen
                                                : color3!,
                                            width: isColorThree == true
                                                ? 2.3
                                                : 1.3,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: color3),
                                      ),
                                    ),
                              color4 == Colors.transparent
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _colorClick(
                                            one: false,
                                            two: false,
                                            four: true,
                                            three: false,
                                          );
                                          size = "$color4";
                                        });
                                      },
                                      child: Container(
                                        height: 32,
                                        padding: EdgeInsets.all(1.5),
                                        width: 32,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: isColorFour == true
                                                ? colorGreen
                                                : color4!,
                                            width:
                                                isColorFour == true ? 2.3 : 1.3,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: color4),
                                      ),
                                    )
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Text(
                      "Details",
                      style: defaultTextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.00),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(pInfo!,
                          style: TextStyle(
                              height: 1.3,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.00,
                              wordSpacing: 1.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Text(
                      "Read More",
                      style: defaultTextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.50,
                          fontColors: colorGreen),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Text(
                      "Reviews",
                      style: defaultTextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.00),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9.0,
                    ),
                    child: Hero(
                      tag: "review",
                      child: Material(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => ReviewScreen(
                                          productId: pID.toString(),
                                          productName: pName.toString(),
                                        )));
                          },
                          child: Text(
                            "Write your",
                            style: defaultTextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15.50,
                                fontColors: colorGreen),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection(FirebaseString.productCollection)
                          .doc(pID)
                          .collection(FirebaseString.productReviewCollection)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: false,
                            itemBuilder: (BuildContext context, int index) {
                              ReviewModal reviewModal = ReviewModal.fromJson(
                                  snapshot.data.docs[index].data());
                              setState(() {
                                ProductRepository.reviewUpdate(
                                    pId: reviewModal.productId.toString(),
                                    uId: reviewModal.userId.toString(),
                                    reviewId: reviewModal.reviewId.toString(),
                                    userFullName: reviewModal.productId.toString(),
                                    profilePhoto: reviewModal.productId.toString(),
                                    reviewText: reviewModal.reviewText.toString(),
                                    star: reviewModal.star.toString());
                              });

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                ),
                                child: Container(
                                  height: 90,
                                  padding: EdgeInsets.only(top: 10),
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Image.network(
                                            reviewModal.userprofile.toString(),
                                            height: 50,
                                            fit: BoxFit.cover,
                                            width: 50,
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 150,
                                                  child: Text(
                                                    reviewModal.userName
                                                        .toString(),
                                                    style: defaultTextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.50,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      100 *
                                                      10,
                                                ),
                                                Container(
                                                  width: 100,
                                                  child: Row(
                                                    children: List.generate(
                                                        int.parse(reviewModal
                                                            .star
                                                            .toString()),
                                                        (index) => Container(
                                                              child: Icon(
                                                                Icons.star,
                                                                size: 20,
                                                                color:
                                                                    colorYellow,
                                                              ),
                                                            )),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              reviewModal.reviewText.toString(),
                                              style: defaultTextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15.50,
                                                  height: 1.2,
                                                  wordSpacing: 1.00),
                                              maxLines: 3,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
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
                ],
              ),
            ),
          ),
          Container(
            height: 84,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PRICE",
                      style: defaultTextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12.00,
                          fontColors: colorGrey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "₹ ${pPrice!}",
                      style: defaultTextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.00,
                          fontColors: colorGreen),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 146,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: colorGreen,
                      borderRadius: BorderRadius.circular(3)),
                  child: Text(
                    "PRICE",
                    style: defaultTextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.00,
                        fontColors: colorWhite),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _sizeClick({
    bool one = false,
    bool two = false,
    bool three = false,
    bool four = false,
  }) {
    setState(() {
      isOne = one;
      isTwo = two;
      isThree = three;
      isFour = four;
    });
  }

  _colorClick({
    bool one = false,
    bool two = false,
    bool three = false,
    bool four = false,
  }) {
    setState(() {
      isColorOne = one;
      isColorTwo = two;
      isColorThree = three;
      isColorFour = four;
    });
  }
}
