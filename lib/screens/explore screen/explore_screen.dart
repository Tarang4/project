import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modal/categories_modal.dart';
import 'package:untitled/modal/product_modal.dart';
import 'package:untitled/screens/search%20screen/search_s2.dart';
import 'package:untitled/untils/app_colors.dart';
import 'package:untitled/untils/app_fonts.dart';
import 'package:untitled/untils/categories_container.dart';
import 'package:untitled/untils/product_container.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<CategoriesModal> categoriesList = [
    CategoriesModal(catImage: "assets/images/icons/C1.png", catName: "Man"),
    CategoriesModal(catImage: "assets/images/icons/C2.png", catName: "Women"),
    CategoriesModal(catImage: "assets/images/icons/C3.png", catName: "Man"),
    CategoriesModal(catImage: "assets/images/icons/C4.png", catName: "Man"),
    CategoriesModal(catImage: "assets/images/icons/C5.png", catName: "Man"),
  ];

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
    ProductModal(
        pImage: "assets/images/two.jpg",
        pName: "BeoPlay Speaker",
        pInfo: "BeoPlay Speaker",
        pPrice: "\$700"),
    ProductModal(
        pImage: "assets/images/icons/G1.png",
        pName: "ll Speaker",
        pInfo: "BeoPlay Speaker",
        pPrice: "\$700"),
    ProductModal(
        pImage: "assets/images/two.jpg",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 19,
              ),
              Hero(
                tag: "search",
                child: Material(
                  color: Colors.transparent,
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SearchS2()));
                            },
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: colorLightGrey,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 18,
                                    margin: const EdgeInsets.only(
                                        top: 11, bottom: 11),
                                    width: 18,
                                    child: Image.asset(
                                      "assets/images/icons/Group 341@3x.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          clipBehavior: Clip.antiAlias,
                          width: 40,
                          child: Image.asset(
                            "assets/images/icons/Group 3403.png",
                            height: 20,
                            width: 20,
                          ),
                          decoration: BoxDecoration(
                              color: colorGreen,
                              borderRadius: BorderRadius.circular(30)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 24,
              ),
              SizedBox(
                height: 132,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style:
                          defaultTextStyle(),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesList.length,
                          itemBuilder: (BuildContext context, index) {
                            CategoriesModal categoriesModal =
                                categoriesList[index];
                            return CategoriesContainer(
                              catImage: categoriesModal.catImage,
                              catName: categoriesModal.catName,
                            );
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling",
                    style: defaultTextStyle(),
                  ),
                  Text(
                    "See All",
                    style: defaultTextStyle(
                      fontColors: colorBlack,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
              SizedBox(
                height: 2000,
                child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 10, top: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 18,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      ProductModal productModal = productList[index];
                      return ProductContainer(
                        pInfo: productModal.pInfo,
                        pImage: productModal.pImage,
                        pName: productModal.pName,
                        pPrice: productModal.pPrice,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
