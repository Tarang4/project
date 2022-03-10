import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modal/review_modal.dart';
import 'package:untitled/screens/explore%20screen/review_screen.dart';
import 'package:untitled/config/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';

class CategoriesProduct extends StatefulWidget {
  const CategoriesProduct({Key? key}) : super(key: key);

  @override
  _CategoriesProductState createState() => _CategoriesProductState();
}

class _CategoriesProductState extends State<CategoriesProduct> {
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
                  Image.asset(
                    "assets/images/icons/G1.png",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 100 * 55,
                    fit: BoxFit.cover,
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
                      "Nike Dri-fit Long Sleev",
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
                                              ? "large"
                                              : index == 1
                                                  ? "small"
                                                  : index == 2
                                                      ? "XL"
                                                      : index == 3
                                                          ? "XXl"
                                                          : "large",
                                          style: defaultTextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13.00,
                                              fontColors: selectSize == index
                                                  ? colorBlack
                                                  : colorGrey),
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
                                                  ? Colors.blue
                                                  : index == 1
                                                      ? Colors.purple
                                                      : index == 2
                                                          ? Colors.red
                                                          : index == 3
                                                              ? Colors.orange
                                                              : Colors.blue)),
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
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                          "Color SELECT TOP clause. MySQL supports the clause to select a limited number of records, while Oracle uses FETCH FIRST n ROWS ONLY and ROWNUM.",
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
                          onPressed: () { Navigator.push(context, CupertinoPageRoute(builder: (context)=>ReviewScreen())); },
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
                                            fontSize: 15.50,height: 1.2,wordSpacing: 1.00
                                          ),maxLines: 3,
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
                    ),
                    Text(
                      "\$1500",
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
