import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:untitled/modal/product_modal.dart';
import 'package:untitled/screens/search%20screen/search_s2.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';
import 'package:untitled/untils/product_container.dart';
import 'gadgets_screen.dart';

class CategoriesBO extends StatefulWidget {
  const CategoriesBO({Key? key}) : super(key: key);

  @override
  _CategoriesBOState createState() => _CategoriesBOState();
}

class _CategoriesBOState extends State<CategoriesBO> {
  bool isAll = true;
  bool isHeadPhone = false;
  bool isSpeaker = false;
  bool isMicroPhone = false;
  bool isBluthooth = false;
  List<BOModal> BOList = [
    BOModal(
        BOImage: "assets/images/BO1.png",
        BOName: "BeoPlay Speaker",
        BOInfo: "BeoPlay Speaker",
        BOPrice: "\$700"),
    BOModal(
        BOImage: "assets/images/BO2.png",
        BOName: "BeoPlay Speaker",
        BOInfo: "BeoPlay Speaker",
        BOPrice: "\$700"),
    BOModal(
        BOImage: "assets/images/BO3.png",
        BOName: "BeoPlay Speaker",
        BOInfo: "BeoPlay Speaker",
        BOPrice: "\$700"),
    BOModal(
        BOImage: "assets/images/BO4.png",
        BOName: "BeoPlay Speaker",
        BOInfo: "BeoPlay Speaker",
        BOPrice: "\$700"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 65,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GadgetsScreen()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 18,
                  ),
                ),
                Text(
                  "B&o",
                  style: defaultTextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Hero(
                    tag: "search",
                    child: Material(
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            color: colorGreen, shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: colorWhite,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchS2()));
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 76,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 72,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                categoryClick(
                                    All: true,
                                    Headphone: false,
                                    Microphone: false,
                                    Speaker: false,
                                  Bluethooth: false,
                                );
                              },
                              child: isAll
                                  ? Text(
                                      "All",
                                      style: defaultTextStyle(
                                          fontSize: 20.0,
                                          fontColors: colorBlack),
                                    )
                                  : Text(
                                      "All",
                                      style: defaultTextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontColors: colorGrey),
                                    )),
                          TextButton(
                              onPressed: () {
                                categoryClick(
                                    All: false,
                                    Headphone: true,
                                    Microphone: false,
                                    Speaker: false,
                                  Bluethooth: false,
                                );
                              },
                              child: isHeadPhone
                                  ? Text(
                                      "Headphone",
                                      style: defaultTextStyle(
                                          fontSize: 20.0,
                                          fontColors: colorBlack),
                                    )
                                  : Text(
                                      "Headphone",
                                      style: defaultTextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontColors: colorGrey),
                                    )),
                          TextButton(
                              onPressed: () {
                                categoryClick(
                                    All: false,
                                    Headphone: false,
                                    Microphone: false,
                                    Speaker: true,
                                  Bluethooth: false,
                                );
                              },
                              child: isSpeaker
                                  ? Text(
                                      "Speakers",
                                      style: defaultTextStyle(
                                          fontSize: 20.0,
                                          fontColors: colorBlack),
                                    )
                                  : Text(
                                      "Speakers",
                                      style: defaultTextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontColors: colorGrey),
                                    )),
                          TextButton(
                              onPressed: () {
                                categoryClick(
                                    All: false,
                                    Headphone: false,
                                    Microphone: true,
                                    Speaker: false,
                                  Bluethooth: false,
                                );
                              },
                              child: isMicroPhone
                                  ? Text(
                                      "Microphones",
                                      style: defaultTextStyle(
                                          fontSize: 20.0,
                                          fontColors: colorBlack),
                                    )
                                  : Text(
                                      "Microphones",
                                      style: defaultTextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontColors: colorGrey),
                                    )),
                          TextButton(
                              onPressed: () {
                                categoryClick(
                                  All: false,
                                  Headphone: false,
                                  Microphone: false,
                                  Speaker: false,
                                  Bluethooth: true,

                                );
                              },
                              child: isBluthooth
                                  ? Text(
                                      "Bluethooth",
                                      style: defaultTextStyle(
                                          fontSize: 20.0,
                                          fontColors: colorBlack),
                                    )
                                  : Text(
                                      "Bluethooth",
                                      style: defaultTextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontColors: colorGrey),
                                    )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 75,
                    ),
                    IntrinsicGridView.vertical(
                      padding:
                          const EdgeInsets.only(top: 21, left: 5, right: 5),
                      columnCount: 2,
                      verticalSpace: 14,
                      horizontalSpace: 16,
                      children: List.generate(
                        BOList.length,
                        (index) => ProductContainer(
                          pImage: BOList[index].BOImage,
                          pName: BOList[index].BOName,
                          pInfo: BOList[index].BOInfo,
                          pPrice: BOList[index].BOPrice, onTap: () {  },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 12,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "No Fillter Applied",
                    style: defaultTextStyle(fontSize: 14.0),
                  ),
                  Container(
                    height: 50,
                    width: 146,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: colorGreen,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "FILTER",
                      style: defaultTextStyle(
                          fontColors: colorWhite,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  categoryClick({
    bool All = true,
    bool Headphone = false,
    bool Speaker = false,
    bool Microphone = false,
    bool Bluethooth = false,
  }) {
    setState(() {
      isAll = All;
      isHeadPhone = Headphone;
      isSpeaker = Speaker;
      isMicroPhone = Microphone;
      isBluthooth=Bluethooth;
    });
  }
}
