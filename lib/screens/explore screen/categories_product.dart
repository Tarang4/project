import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/modal/review_modal.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';
import 'package:untitled/untils/review_container.dart';

class CategoriesProduct extends StatefulWidget {
  const CategoriesProduct({Key? key}) : super(key: key);

  @override
  _CategoriesProductState createState() => _CategoriesProductState();
}

class _CategoriesProductState extends State<CategoriesProduct> {
  String sizeValue = 'S';
  String colorValue = 'Red';
  List<ReviewModal> reviewList = [
    ReviewModal("assets/images/icons/G1.png", "Tarang Sardhara",
        "hhgs I want to create a So you want your image to be just 600*400 and not expand to 900. · I want to ..."),
    ReviewModal("assets/images/G2.png", "Tarang Sardhara",
        "hhgs I want to create a So you want your image to be just 600*400 and not expand to 900. · I want to ..."),
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
                    "assets/images/G2.png",
                    width: double.infinity,
                    height: 450,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 100 * 43,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(width: 1, color: colorLightGrey)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Size",
                                style: defaultTextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.00),
                              ),
                              DropdownButton(
                                value: sizeValue,
                                // menuMaxHeight: 100,
                                itemHeight: 70,
                                alignment: Alignment.bottomCenter,
                                style: defaultTextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.00),
                                elevation: 16,
                                iconDisabledColor: Colors.blue,
                                dropdownColor: Colors.white,
                                iconSize: 19,
                                underline: Container(
                                  height: 0.1,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    sizeValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'S',
                                  'M',
                                  'XL',
                                  'XXL'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 100 * 43,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(width: 1, color: colorLightGrey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Color",
                                style: defaultTextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.00),
                              ),
                              // DropdownButton(
                              //     value: colorValue,
                              //     // menuMaxHeight: 100,
                              //     itemHeight: 70,
                              //     alignment: Alignment.bottomCenter,
                              //     style: defaultTextStyle(
                              //         fontWeight: FontWeight.normal,
                              //         fontSize: 14.00),
                              //     elevation: 16,
                              //     iconDisabledColor: Colors.blue,
                              //     dropdownColor: Colors.white,
                              //     iconSize: 0,
                              //     underline: Container(
                              //       height: 0.1,
                              //       color: Colors.transparent,
                              //     ),
                              //     onChanged: (String? newValue) {
                              //       setState(() {
                              //         colorValue = newValue!;
                              //       });
                              //     },
                              //     items
                              //     :
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                    height: 19,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Text(
                      "Color SELECT TOP clause. MySQL supports the clause to select a limited number of records, while Oracle uses FETCH FIRST n ROWS ONLY and ROWNUM.",
                      style: defaultTextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.00,
                          wordSpacing: 1.0),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Text(
                      "Read More",
                      style: defaultTextStyle(
                          fontColors: colorGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.00),
                    ),
                  ),
                  const SizedBox(
                    height: 29,
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
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Text(
                      "Write Your",
                      style: defaultTextStyle(
                          fontColors: colorGreen,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.00),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: reviewList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        ReviewModal reviewModal = reviewList[index];
                        return ReviewContainer(
                          review: reviewModal.review,
                          img: reviewModal.img,
                          userName: reviewModal.userName,
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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
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

class ExtraClass extends StatefulWidget {
  const ExtraClass({Key? key}) : super(key: key);

  @override
  _ExtraClassState createState() => _ExtraClassState();
}

class _ExtraClassState extends State<ExtraClass> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
