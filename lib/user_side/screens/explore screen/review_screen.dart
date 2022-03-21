import 'package:flutter/material.dart';
import 'package:untitled/admin/repository/add_product_repository.dart';

import '../../config/app_colors.dart';
import '../../untils/app_fonts.dart';

class ReviewScreen extends StatefulWidget {
  final String productId;
  final String productName;

  const ReviewScreen({Key? key, required this.productId, required this.productName}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final TextEditingController _reviewTextController = TextEditingController();
  String? star;
  bool isZero = true;
  bool isOne = false;
  bool isTwo = false;
  bool isThree = false;
  bool isFour = false;
  String? productId;
  String? productName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productId = widget.productId;
    productName=widget.productName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "review",
                  child: Material(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 45.0, left: 0, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 35,
                            ),
                          ),
                          Text(
                            "Write Review",
                            style: defaultTextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 19.50,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 100 * 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 45.0, left: 16, right: 16),
                  child: Text(
                    productName!,
                    style: defaultTextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.50,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 16, right: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              categoryClick(
                                  zero: true,
                                  one: false,
                                  three: false,
                                  two: false,
                                  four: false);star="1";
                            });
                          },
                          child: isZero == true
                              ? iconStarYellow()
                              : iconStarOutLine(),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              categoryClick(
                                  zero: true,
                                  one: true,
                                  three: false,
                                  two: false,
                                  four: false);star="2";
                            });
                          },
                          child: isOne == true
                              ? iconStarYellow()
                              : iconStarOutLine(),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              categoryClick(
                                  zero: true,
                                  one: true,
                                  three: false,
                                  two: true,
                                  four: false);star="3";
                            });
                          },
                          child: isTwo == true
                              ? iconStarYellow()
                              : iconStarOutLine(),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              categoryClick(
                                  zero: true,
                                  one: true,
                                  three: true,
                                  two: true,
                                  four: false);star="4";
                            });
                          },
                          child: isThree == true
                              ? iconStarYellow()
                              : iconStarOutLine(),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              categoryClick(
                                  zero: true,
                                  one: true,
                                  three: true,
                                  two: true,
                                  four: true);star="5";
                            });
                          },
                          child: isFour == true
                              ? Icon(
                                  Icons.star,
                                  size: 60,
                                  color: colorYellow,
                                )
                              : Icon(
                                  Icons.star_border_outlined,
                                  size: 60,
                                  color: colorLightGrey,
                                ),
                        ),
                      ]),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                  child: TextFormField(
                    controller: _reviewTextController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                        color: colorBlack,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    decoration: const InputDecoration(
                      focusColor: colorGreen,
                      isDense: true,
                      hintText: "Tell us your experience",
                      hintStyle: TextStyle(color: colorGrey),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: colorGreen),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: colorGreen),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Material(
            child: Container(
              height: 84,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  InkWell(
                    onTap: () {
                      ProductRepository.productReviewAdd(
                        context: context,
                        pid: productId,
                        reviewText: _reviewTextController.text,
                        star: star,
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 146,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colorGreen,
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        "Send",
                        style: defaultTextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.00,
                            fontColors: colorWhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  iconStarYellow() {
    return const Icon(
      Icons.star,
      size: 60,
      color: colorYellow,
    );
  }

  iconStarOutLine() {
    return const Icon(
      Icons.star_border_outlined,
      size: 60,
      color: colorLightGrey,
    );
  }

  categoryClick(
      {bool zero = true,
      bool one = false,
      bool two = false,
      bool three = false,
      bool four = false}) {
    setState(() {
      isZero = zero;
      isOne = one;
      isTwo = two;
      isThree = three;
      isFour = four;
    });
  }
}
