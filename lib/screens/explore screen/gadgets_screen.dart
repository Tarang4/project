import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:untitled/modal/categories_modal.dart';
import 'package:untitled/modal/product_modal.dart';
import 'package:untitled/screens/search%20screen/search_s2.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';
import 'package:untitled/untils/product_container.dart';

import 'explore_screen.dart';

class GadgetsScreen extends StatefulWidget {
  const GadgetsScreen({Key? key}) : super(key: key);

  @override
  _GadgetsScreenState createState() => _GadgetsScreenState();
}

class _GadgetsScreenState extends State<GadgetsScreen> {
  List<TopBrand> topBrand = [
    TopBrand(
        name: "Apple inc",
        logo: "assets/images/Group 350.png",
        products: "5696 Products"),
    TopBrand(
        name: "Beats",
        logo: "assets/images/Group 338.png",
        products: "1124 Products"),
    TopBrand(
        name: "B&o",
        logo: "assets/images/Group 337.png",
        products: "5696 Products"),
  ];
  List<GadgetsModal> gadgetsList = [
    GadgetsModal(
        gImage: "assets/images/Image-1.png",
        gName: "BeoPlay Speaker",
        gInfo: "BeoPlay Speaker",
        gPrice: "\$700"),
    GadgetsModal(
        gImage: "assets/images/Image-3.png",
        gName: "BeoPlay Speaker",
        gInfo: "BeoPlay Speaker",
        gPrice: "\$700"),
    GadgetsModal(
        gImage: "assets/images/Image-2.png",
        gName: "BeoPlay Speaker",
        gInfo: "BeoPlay Speaker",
        gPrice: "\$700"),
    GadgetsModal(
        gImage: "assets/images/Image.png",
        gName: "BeoPlay Speaker",
        gInfo: "BeoPlay Speaker",
        gPrice: "\$700"),
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
                            builder: (context) => const ExploreScreen()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 18,
                  ),
                ),
                Text(
                  "Gadgets",
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
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                      ),
                      child: Text(
                        "Top Brands",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "SF",
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 75,
                    ),
                    Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 13, right: 13),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: topBrand.length,
                        itemBuilder: (context, index) {
                          TopBrand topB = topBrand[index];
                          return SingleChildScrollView(
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 180,
                                  color: Colors.white,
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        margin: const EdgeInsets.only(
                                            left: 22,
                                            top: 20,
                                            bottom: 20,
                                            right: 20),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          topB.logo ?? "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 19, bottom: 1.5),
                                            child: Text(
                                              topB.name ?? "",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "SF"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 1.5, bottom: 21),
                                            child: Text(topB.products ?? "",
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "SF",
                                                    color: Colors.grey)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    IntrinsicGridView.vertical(
                      padding:
                          const EdgeInsets.only(top: 21, left: 5, right: 5),
                      columnCount: 2,
                      verticalSpace: 14,
                      horizontalSpace: 16,
                      children: List.generate(
                        gadgetsList.length,
                        (index) => ProductContainer(
                          pImage: gadgetsList[index].gImage,
                          pName: gadgetsList[index].gName,
                          pInfo: gadgetsList[index].gInfo,
                          pPrice: gadgetsList[index].gPrice,
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
                      style: defaultTextStyle(fontColors: colorWhite,fontSize: 14.0,fontWeight: FontWeight.w400),
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
}
