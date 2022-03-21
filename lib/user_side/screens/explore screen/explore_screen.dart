import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:untitled/user_side/screens/explore%20screen/categories_screen/devices_screen.dart';
import 'package:untitled/user_side/screens/explore%20screen/seeall_screen.dart';
import '../../../admin/modal/admin_product_modal.dart';
import '../../config/FireStore_string.dart';
import '../../config/app_colors.dart';
import '../../modal/categories_modal.dart';
import '../../modal/product_modal.dart';
import '../../untils/app_fonts.dart';
import '../../untils/categories_container.dart';
import '../../untils/product_container.dart';
import '../account screen/account_screen.dart';
import '../cart screen/cart_screen.dart';
import '../search screen/search_s2.dart';
import '../../untils/categories_product.dart';
import 'categories_screen/gadgets_screen.dart';
import 'categories_screen/men_screen.dart';
import 'categories_screen/perfumes_screen.dart';
import 'categories_screen/women_screen.dart';

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
    CategoriesModal(
        catImage: "assets/images/icons/C3.png", catName: "perfumes"),
  ];
  final List<String> imageList = [
    "https://images.unsplash.com/photo-1585565804112-f201f68c48b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1629077007578-a36bb1056b3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1542219550-37153d387c27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
"https://images.unsplash.com/photo-1568910748155-01ca989dbdd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
    "https://images.unsplash.com/photo-1621985499238-698dfd45b017?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",

  ];
  List<FeturedBrand> fetureBrand = [
    FeturedBrand(
        name: "NIKE",
        logo: "assets/images/logo/nike.jpg",
        products: "5696 Products"),
    FeturedBrand(
        name: "GUCCI",
        logo: "assets/images/logo/gucci.jpg",
        products: "1187 Products",),
    FeturedBrand(
        name: "ADIDAS",
        logo: "assets/images/logo/adidas.png",
        products: "1784 Products"),
    FeturedBrand(
        name: "ZARA",
        logo: "assets/images/logo/zara.jpg",
        products: "1354 Products"),
  ];
  List<ProductModal> productList = [
    ProductModal(
        img2: "assets/images/G2.png",
        productName: "BeoPlay Speaker",
        productInfo: "BeoPlay Speaker",
        productPrice: "\$700"),
    ProductModal(
        img2: "assets/images/icons/G1.png",
        productName: "ll Speaker",
        productInfo: "BeoPlay Speaker",
        productPrice: "\$700"),
    ProductModal(
        img2: "assets/images/G2.png",
        productName: "BeoPlay Speaker",
        productInfo: "BeoPlay Speaker",
        productPrice: "\$700"),
    ProductModal(
        img2: "assets/images/icons/G1.png",
        productName: "ll Speaker",
        productInfo: "BeoPlay Speaker",
        productPrice: "\$700"),
  ];
  List<RecoList> recoList = [
    RecoList(
        image: "assets/images/reco2.png",
        name: "Wireless Remote",
        info: "Tesla Inc",
        price: "790"),
    RecoList(
        image: "assets/images/reco2.png",
        name: "Airdrops",
        info: "Apple Inc",
        price: "120"),
    RecoList(
        image: "assets/images/reco1.png",
        name: "Wireless Remote",
        info: "Tesla Inc",
        price: "790"),
    RecoList(
        image: "assets/images/reco2.png",
        name: "Airdrops",
        info: "Apple Inc",
        price: "120"),
  ];
  int pageIndex = 0;
  final pages = [
    const ExploreScreen(),
    const CartScreen(),
    const AccountScreen(),
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
                padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
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
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const SearchS2()));
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
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 28),
                      child: Text(
                        "Categories",
                        style: defaultTextStyle(),
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
                              onTap: () {
                                if (index == 0) {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => const MenScreen()));
                                } else if (index == 1) {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => const WomenScreen()));
                                } else if (index == 2) {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const GadgetsScreen()));
                                } else if (index == 4) {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const DeviceScreen()));
                                } else if (index == 3) {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => const MenScreen()));
                                } else if (index == 5) {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const PerfumesScreen()));
                                }
                              },
                            );
                          }),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Selling",
                      style: defaultTextStyle(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const SeeAllScreen()));
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
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(FirebaseString.productCollection)
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return IntrinsicGridView.vertical(
                        padding:
                            const EdgeInsets.only(top: 1, left: 5, right: 5),
                        columnCount: 2,
                        verticalSpace: 14,
                        horizontalSpace: 16,
                        children: List.generate(
                          snapshot.data.docs.length,
                          (index) {
                            ProductModalAdmin productModal =
                                ProductModalAdmin.fromJson(
                                    snapshot.data.docs[index].data());
                            return ProductContainer(
                              pImage: productModal.images!.img1.toString(),
                              pName: productModal.productName.toString(),
                              pInfo: productModal.productInfo.toString(),
                              pPrice: productModal.productPrice.toString(),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => CategoriesProduct(
                                              pImage1: productModal.images!.img1
                                                  .toString(),
                                              pImage2: productModal.images!.img2
                                                  .toString(),
                                              pImage3: productModal.images!.img3
                                                  .toString(),
                                              pImage4: productModal.images!.img4
                                                  .toString(),
                                              pName: productModal.productName
                                                  .toString(),
                                              pInfo: productModal.productInfo
                                                  .toString(),
                                              pPrice: productModal.productPrice
                                                  .toString(),
                                              color1: productModal
                                                  .colorCode!.color1
                                                  .toString(),
                                              color2: productModal
                                                  .colorCode!.color2
                                                  .toString(),
                                              color3: productModal
                                                  .colorCode!.color3
                                                  .toString(),
                                              color4: productModal
                                                  .colorCode!.color4
                                                  .toString(),
                                              size1: productModal.size!.s
                                                  .toString(),
                                              size2: productModal.size!.m
                                                  .toString(),
                                              size3: productModal.size!.xL
                                                  .toString(),
                                              size4: productModal.size!.xXL
                                                  .toString(),
                                              review: "",
                                              reviewStar: "",
                                              pID: productModal.productId
                                                  .toString(),
                                            )));
                              },
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      print("error not found product ${snapshot.hasError}");
                    }

                    return const Center(
                        child: CircularProgressIndicator(
                      color: colorGreen,
                    ));
                  }),
              Container(
                margin: const EdgeInsets.only(top: 15,bottom: 15,),
                child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 200,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    reverse: false,
                    aspectRatio: 5.0,
                  ),
                  itemBuilder: (context, i, id) {
                    //for onTap to redirect to another screen
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                            )),
                        //ClipRRect for image border radius
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageList[i],
                            width: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () {
                        var url = imageList[i];
                        print(url.toString());
                      },
                    );
                  },
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
                                  height: 45,
                                  width: 45,
                                  clipBehavior: Clip.antiAlias,
                                  margin: const EdgeInsets.only(
                                      left: 15, top: 15, bottom: 15, right: 15),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    feb.logo ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 380,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recoList.length,
                    itemBuilder: (context, index) {
                      RecoList recList = recoList[index];
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5, left: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 300,
                                width: 164,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  recList.image ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                recList.name ?? "",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                recList.info ?? "",
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: colorGrey),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                               "₹${recList.price}" ?? "",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: colorGreen),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 74,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              splashColor: Colors.white,
              enableFeedback: false,
              onTap: () {
                setState(() {
                  pageIndex = 0;
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => pages[0]));
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                alignment: Alignment.center,
                child: pageIndex == 0
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Explore",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 3,
                            width: 7,
                            decoration: BoxDecoration(
                                color: colorBlack,
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ],
                      )
                    : const Icon(Icons.home_filled),
              )),
          InkWell(
              enableFeedback: false,
              splashColor: Colors.white,
              onTap: () {
                setState(() {
                  pageIndex = 1;
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => pages[1]));
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                alignment: Alignment.center,
                child: pageIndex == 1
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Cart",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 3,
                            width: 5,
                            decoration: BoxDecoration(
                                color: colorBlack,
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ],
                      )
                    : const Icon(Icons.card_travel),
              )),
          InkWell(
            enableFeedback: false,
            splashColor: Colors.white,
            onTap: () {
              setState(() {
                pageIndex = 2;
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => pages[2]));
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              alignment: Alignment.center,
              child: pageIndex == 2
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Account",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 3,
                          width: 8,
                          decoration: BoxDecoration(
                              color: colorBlack,
                              borderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    )
                  : const Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}
