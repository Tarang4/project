import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:untitled/user_side/screens/explore%20screen/review_screen.dart';

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
  List<ReviewModal> reviewList = [
    ReviewModal(
        userName: "tarang boss",
        review: "this product is good and a am confortable product",
        img: "assets/images/icons/G1.png"),
    ReviewModal(
        userName: "tarang boss",
        review: "this product is good and a am confortable product",
        img: "assets/images/icons/G1.png"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pImage1=widget.pImage1;
   pImage2=widget.pImage2;
    pImage3=widget.pImage3;
    pImage4=widget.pImage4;
    pName=widget.pName;
    pInfo=widget.pInfo;
   pPrice=widget.pPrice;

     color1 = Color(int.parse(widget.color1));
     color2 = Color(int.parse(widget.color2));
     color3 = Color(int.parse(widget.color3));
     color4 = Color(int.parse(widget.color4));

     size1 = widget.size2=="true"?"S":"";
     size2 = widget.size1=="true"?"M":"";
     size3 = widget.size3=="true"?"XL":"";
     size4 = widget.size4=="true"?"XXL":"";

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
                    height: MediaQuery.of(context).size.height / 100 * 55,

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
                    autoPlayInterval: 900,
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
                            children: List<Widget>.generate(
                                4,
                                (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectSize = index;
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 60,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: selectSize == index
                                                ? colorGreen
                                                : colorLightGrey,
                                            width: 0.6,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(
                                          index == 0
                                              ? size1!
                                              : index == 1
                                                  ? size2!
                                                  : index == 2
                                                      ? size3!
                                                      : index == 3
                                                          ? size4!
                                                          : size1!,
                                          style: defaultTextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13.00,
                                              fontColors: selectSize == index
                                                  ? colorGreen
                                                  : colorBlack),
                                        ),
                                      ),
                                    )),
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
                            children: List<Widget>.generate(
                                4,
                                (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectColor = index;
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
                                            color: selectColor == index
                                                ? colorGreen
                                                : Colors.transparent,
                                            width: 1.3,
                                          ),
                                        ),
                                        margin: EdgeInsets.only(right: 10),
                                        child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: index == 0
                                                ? color1
                                                : index == 1
                                                    ? color2
                                                    : index == 2
                                                        ? color3
                                                        : index == 3
                                                            ? color4
                                                            : color1),
                                      ),
                                    )),
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
                    child:  Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                          pInfo! ,
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
                                    builder: (context) => ReviewScreen()));
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
                  SizedBox(
                    height: 600,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: ListView.builder(
                          itemCount: reviewList.length.toInt(),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: false,
                          itemBuilder: (BuildContext context, int index) {
                            ReviewModal reviewModal = reviewList[index];
                            return Container(
                              height: 90,
                              padding: EdgeInsets.only(top: 10),
                              margin: EdgeInsets.only(bottom: 25),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Image.asset(
                                        reviewModal.img ?? "",
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 150,
                                              child: Text(
                                                reviewModal.userName ?? "",
                                                style: defaultTextStyle(
                                                  fontWeight: FontWeight.bold,
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
                                                    5,
                                                    (index) => Container(
                                                          child: Icon(
                                                            Icons.star,
                                                            size: 20,
                                                            color: colorYellow,
                                                          ),
                                                        )),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          reviewModal.review ?? "",
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
                            );
                          },
                        )),
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
                    ),const SizedBox(height: 5,),
                    Text(
                      "\$ ${pPrice!}",
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
}
