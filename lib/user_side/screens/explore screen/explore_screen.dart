import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/user_side/repository/home/home_repository.dart';
import 'package:untitled/user_side/screens/explore%20screen/categories_screen/devices_screen.dart';
import 'package:untitled/user_side/screens/explore%20screen/seeall_screen.dart';
import '../../../main.dart';
import '../../config/FireStore_string.dart';
import '../../config/Localstorage_string.dart';
import '../../config/app_colors.dart';
import '../../modal/categories_modal.dart';
import '../../modal/product_modal.dart';
import '../../untils/app_fonts.dart';
import '../../untils/categories_container.dart';
import '../account screen/account_screen.dart';
import '../cart screen/cart_screen.dart';
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
  String? profilePhoto = pref!.getString(LocalStorageKey.profilePhoto)!;
  String? assetProfilePhoto = "assets/images/user_profile.png";
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
      products: "1187 Products",
    ),
    FeturedBrand(
        name: "ADIDAS",
        logo: "assets/images/logo/adidas.png",
        products: "1784 Products"),
    FeturedBrand(
        name: "ZARA",
        logo: "assets/images/logo/zara.jpg",
        products: "1354 Products"),
  ];
  List<ProductModal> productList = [];
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
  List<QueryDocumentSnapshot<Object?>>? searchProduct;
  QuerySnapshot? homeProductData;

  final TextEditingController searchController = TextEditingController();
  productData() async{
    homeProductData = await HomeRepository.getProduct(context: context,);
    searchProduct = homeProductData!.docs;
    print("home Data ---------------------------- ${homeProductData!.docs}");
    print("home Data ---------------------------- ${searchProduct}");
    setState(() {

    });
  }

  @override
  void initState() {
    productData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                            child: Container(
                              height: 43,
                              padding: EdgeInsets.only(left: 15,bottom: 9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: colorLightGrey,
                              ),
                              child: TextFormField(
                                cursorWidth: 1.5,
                                controller: searchController,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: colorGreen,
                                onChanged: (value) async{
                                  if(searchController.text.isEmpty){
                                    searchProduct = homeProductData!.docs;
                                    print("serch length ----------- ${searchProduct!.length}");
                                  } else{
                                    searchProduct = homeProductData!.docs.where((element) => element["productName"].toString().toLowerCase().contains(value.toLowerCase())).toList();
                                    print("serch length ----------- ${searchProduct!.length}");
                                  }
                                  setState(() {

                                  });
                                },
                                style: const TextStyle(
                                    color: colorBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                                decoration: const InputDecoration(
                                  fillColor: colorLightGrey,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Icon(Icons.search, color: Colors.black,),
                                  )
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 44,
                                width: 44,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: colorGreen)),
                              ),
                              Positioned(
                                right: 2,
                                bottom: 2,
                                top: 2,
                                left: 2,
                                child: Container(
                                  height: 40,
                                  clipBehavior: Clip.antiAlias,
                                  width: 40,
                                  child: profilePhoto!.contains("http")
                                      ? CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: profilePhoto!,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(
                                                  color: colorGreen),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        )
                                      : Image.asset(assetProfilePhoto!),
                                  decoration: BoxDecoration(
                                      color: colorWhite,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                            ],
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
                        physics: BouncingScrollPhysics(),
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
                                          builder: (context) =>
                                              const MenScreen()));
                                } else if (index == 1) {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const WomenScreen()));
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
                                          builder: (context) =>
                                              const MenScreen()));
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
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                            colorGreen.withOpacity(0.2)),
                      ),
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
              searchProduct == null
              ? Container()
              : Container(
                margin: EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding:
                    const EdgeInsets.only(top: 1, left: 5, right: 5),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                        mainAxisExtent: Get.size.height/2.3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 5),
                    itemCount: searchProduct!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CategoriesProduct(
                                    pImage1: searchProduct![index]["images"]["img1"],
                                    pImage2: searchProduct![index]["images"]["img2"],
                                    pImage3: searchProduct![index]["images"]["img3"],
                                    pImage4: searchProduct![index]["images"]["img4"],
                                    pName: searchProduct![index]["productName"],
                                    pInfo: searchProduct![index]["productInfo"],
                                    pPrice: searchProduct![index]["productPrice"],
                                    color1: searchProduct![index]["ColorCode"]["color1"],
                                    color2: searchProduct![index]["ColorCode"]["color2"],
                                    color3: searchProduct![index]["ColorCode"]["color3"],
                                    color4: searchProduct![index]["ColorCode"]["color4"],
                                    size1: searchProduct![index]["size"]["M"],
                                    size2: searchProduct![index]["size"]["S"],
                                    size3: searchProduct![index]["size"]["XL"],
                                    size4: searchProduct![index]["size"]["XXL"],
                                    review: "",
                                    reviewStar: "",
                                    pID: searchProduct![index]["productId"],
                                  )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              // padding: const EdgeInsets.only(left: 3,right: 3,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: colorLightGrey,
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      offset: Offset(3, 3))
                                ],
                              ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: searchProduct![index]["images"]["img1"],
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(color: colorGrey)),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              searchProduct![index]["productName"].toString(),
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              searchProduct![index]["productInfo"],
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.normal, color: colorGrey),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "₹ ${searchProduct![index]["productPrice"]}",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal, color: colorGreen),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              /*StreamBuilder(
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
                          searchProduct!.docs.length,
                          (index) {
                            ProductModalAdmin productModal =
                                ProductModalAdmin.fromJson(
                                    );
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
                  }),*/
              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
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
                  "Incomming Brands",
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
                  physics: BouncingScrollPhysics(),
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
                children:  [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, bottom: 20),
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
                    padding: const EdgeInsets.only(top: 10, right: 10, bottom: 20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const SeeAllScreen()));
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                            colorGreen.withOpacity(0.2)),
                      ),
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
                  )
                ],
              ),
              Container(
                height: 380,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(FirebaseString.productCollection)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasData){
                      return  ListView.builder(
                          physics: BouncingScrollPhysics(),
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
                                      "₹${recList.price}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: colorGreen),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
