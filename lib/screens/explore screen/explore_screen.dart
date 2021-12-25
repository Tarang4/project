  import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
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
    CategoriesModal(catImage: "assets/images/icons/C3.png", catName: "Device"),
    CategoriesModal(catImage: "assets/images/icons/C4.png", catName: "Games"),
    CategoriesModal(catImage: "assets/images/icons/C5.png", catName: "Gadgets"),
    CategoriesModal(catImage: "assets/images/icons/C3.png", catName: "Man"),
  ];
  List<FeturedBrand> fetureBrand = [
    FeturedBrand(name: "B&o", logo: "assets/images/Group 337.png", products: "5696 Products"),
    FeturedBrand(name: "Beats", logo: "assets/images/Group 338.png", products: "1124 Products"),
    FeturedBrand(name: "B&o", logo: "assets/images/Group 337.png", products: "5696 Products"),
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
  ];
  List<RecoList> recoList = [
    RecoList(
        image: "assets/images/reco2.png",
        title: "Wireless Remote",
        detail: "Tesla Inc",
        price: "\$790"),
    RecoList(
        image: "assets/images/reco2.png",
        title: "Airdrops",
        detail: "Apple Inc",
        price: "\$120"),
    RecoList(
        image: "assets/images/reco1.png",
        title: "Wireless Remote",
        detail: "Tesla Inc",
        price: "\$790"),
    RecoList(
        image: "assets/images/reco2.png",
        title: "Airdrops",
        detail: "Apple Inc",
        price: "\$120"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16,top: 20,right: 16),
                child: Hero(
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
              ),
              SizedBox(
                height: 158,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 28),
                      child: Text(
                        "Categories",
                        style:
                            defaultTextStyle(),
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 16),
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
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 30),
                child: Row(
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
              ),
              IntrinsicGridView.vertical(
                padding:
                const EdgeInsets.only(top: 21,left: 5,right: 5),
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
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 32, bottom: 24),
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/Promo Image.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24, left: 10, bottom: 9),
                child: Text(
                  "Featured Brands",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "SF",
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                height: 90,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: fetureBrand.length,
                  itemBuilder: (context, index) {
                    FeturedBrand feb = fetureBrand[index];
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
                                      shape: BoxShape.circle,),
                                  child: Image.asset(feb.logo??"",fit: BoxFit.cover,),
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 19, bottom: 1.5),
                                      child: Text(
                                        feb.name ?? "",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "SF"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1.5, bottom: 21),
                                      child: Text(feb.products ?? "",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10, bottom: 31),
                    child: Text(
                      "Recommended",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "SF",
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 10, bottom: 31),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "SF",
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 400,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recoList.length,
                    itemBuilder: (context, index) {
                      RecoList recList = recoList[index];
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 319,
                              width: 164,
                              margin:
                              const EdgeInsets.only(right: 16, left: 15),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                recList.image ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 10, bottom: 3),
                              child: Text(
                                recList.title ?? "",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "SF",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 3, bottom: 3),
                              child: Text(
                                recList.detail ?? "",
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: "SF",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 3, bottom: 3),
                              child: Text(
                                recList.price ?? "",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "SF",
                                    color: Colors.green,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
