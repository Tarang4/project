import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:untitled/modal/product_modal.dart';
import 'package:untitled/screens/explore%20screen/categories_product.dart';
import 'package:untitled/screens/explore%20screen/seeall_screen.dart';
import 'package:untitled/untils/app_fonts.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/product_container.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  List<ProductModal> productList = [
    ProductModal(
        pImage: "assets/images/G2.png",
        pName: "BeoPlay Speaker",
        pInfo: "BeoPlay Speaker",
        pPrice: "\$700"),
    ProductModal(
        pImage: "assets/images/icons/G1.png",
        pName: "ll Speaker",
        pInfo: "BeoPlay Speaker",
        pPrice: "\$700"),
    ProductModal(
        pImage: "assets/images/G2.png",
        pName: "BeoPlay Speaker",
        pInfo: "BeoPlay Speaker",
        pPrice: "\$700"),
    ProductModal(
        pImage: "assets/images/icons/G1.png",
        pName: "ll Speaker",
        pInfo: "BeoPlay Speaker",
        pPrice: "\$700"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.1,
                  ),
                  Text(
                    "Wishlist",
                    style: defaultTextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 120,
                    margin:
                        EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 120,
                          child: Image.asset(
                            "assets/images/G2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "OD-87801226 -N",
                                style: defaultTextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "\$400",
                                style: defaultTextStyle(
                                    fontSize: 15.0,
                                    fontColors: colorGreen,
                                    fontWeight: FontWeight.w400),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                height: 30,
                                alignment: Alignment.center,
                                width: 80,
                                child: Text(
                                  "in stock",
                                  style: defaultTextStyle(
                                      fontSize: 15.0,
                                      fontColors: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                decoration: BoxDecoration(
                                    color: colorGreen,
                                    borderRadius: BorderRadius.circular(4)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended",
                      style: defaultTextStyle(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeeAllScreen()));
                      },
                      child: Hero(
                        tag: 'seeAll',
                        child: Material(
                          child: Text(
                            "See All",
                            style: defaultTextStyle(
                                fontColors: colorBlack,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IntrinsicGridView.vertical(
                padding: const EdgeInsets.only(top: 21, left: 5, right: 5),
                columnCount: 2,
                verticalSpace: 14,
                horizontalSpace: 16,
                children: List.generate(
                  productList.length,
                      (index) => ProductContainer(
                    pImage: productList[index].pImage,
                    pName: productList[index].pName,
                    pInfo: productList[index].pInfo,
                    pPrice: productList[index].pPrice,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoriesProduct()));
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
