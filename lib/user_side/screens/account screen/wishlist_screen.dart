import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';
import 'package:untitled/user_side/repository/add_account/whishlist_repository.dart';
import '../../../admin/modal/admin_product_modal.dart';
import '../../config/FireStore_string.dart';
import '../../config/app_colors.dart';
import '../../modal/wishList_modal.dart';
import '../../untils/app_fonts.dart';
import '../../untils/categories_product.dart';
import '../../untils/product_container.dart';
import '../explore screen/seeall_screen.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  String? uid;
  List<ProductModalAdmin> productList = [];
  List<WishListModal> wishList = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    uid = user?.uid;
    getProducts();
    getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite.withOpacity(0.1),
        centerTitle: true,
        title: Text(
          "Wishlist",
          style: defaultTextStyle(
              fontSize: 20.0,
              fontColors: colorBlack,
              fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 17,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                itemCount: wishList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  WishListModal wishListModal = wishList[index];
                  return Dismissible(
                    background: slideLeftBackground(),
                    secondaryBackground: slideRightBackground(),
                    key: Key(wishListModal.productID![index]),
                    onDismissed: (direction){
                      if (direction == DismissDirection.endToStart||direction == DismissDirection.startToEnd){
                        WishListRepository.wishListDelete(context: context, productID: wishListModal.productID.toString());
                        wishList.removeAt(index);
                      }
                    },
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5,),
                      child: InkWell(
                        onTap: () {
                          String pid =
                          wishListModal.productID.toString();
                          int productIndex = productList
                              .indexWhere((f) => f.productId == pid);

                          if (productIndex != null) {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        CategoriesProduct(
                                          categories: productList[
                                          productIndex].categories
                                              .toString(),
                                          pImage1: productList[
                                          productIndex]
                                              .images!
                                              .img1
                                              .toString(),
                                          pImage2: productList[
                                          productIndex]
                                              .images!
                                              .img2
                                              .toString(),
                                          pImage3: productList[
                                          productIndex]
                                              .images!
                                              .img3
                                              .toString(),
                                          pImage4: productList[
                                          productIndex]
                                              .images!
                                              .img4
                                              .toString(),
                                          pName: productList[
                                          productIndex]
                                              .productName
                                              .toString(),
                                          pInfo: productList[
                                          productIndex]
                                              .productInfo
                                              .toString(),
                                          pPrice: productList[
                                          productIndex]
                                              .productPrice
                                              .toString(),
                                          color1: productList[
                                          productIndex]
                                              .colorCode!
                                              .color1
                                              .toString(),
                                          color2: productList[
                                          productIndex]
                                              .colorCode!
                                              .color2
                                              .toString(),
                                          color3: productList[
                                          productIndex]
                                              .colorCode!
                                              .color3
                                              .toString(),
                                          color4: productList[
                                          productIndex]
                                              .colorCode!
                                              .color4
                                              .toString(),
                                          size1: productList[
                                          productIndex]
                                              .size!
                                              .s
                                              .toString(),
                                          size2: productList[
                                          productIndex]
                                              .size!
                                              .m
                                              .toString(),
                                          size3: productList[
                                          productIndex]
                                              .size!
                                              .xL
                                              .toString(),
                                          size4: productList[
                                          productIndex]
                                              .size!
                                              .xXL
                                              .toString(),
                                          review: "",
                                          reviewStar: "",
                                          pID: productList[
                                          productIndex]
                                              .productId
                                              .toString(),
                                        )));
                          }
                          String productIDD = productList[
                          productIndex]
                              .productId
                              .toString();
                          print(productIDD);
                        },
                        child: Container(
                          height: 120,
                          margin: const EdgeInsets.only(
                              top: 7, left: 5, right: 10, bottom:7),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: wishListModal.productImage.toString(),
                                    errorWidget: (context, url, error) => const Icon(
                                      Icons.error,
                                      size: 26,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex:9,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        wishListModal.productName.toString(),
                                        style: defaultTextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "₹ ${wishListModal.productPrice.toString()}",
                                        style: defaultTextStyle(
                                            fontSize: 15.0,
                                            fontColors: colorGreen,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      InkWell(
                                        child: Container(
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
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
              IntrinsicGridView.vertical(
                padding: const EdgeInsets.only(top: 21, left: 5, right: 5),
                columnCount: 2,
                verticalSpace: 14,
                horizontalSpace: 16,
                children: List.generate(
                  productList.length,
                  (index) {
                    ProductModalAdmin productModal = productList[index];
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
                                  categories: productModal.categories
                                      .toString(),
                                      pImage1:
                                          productModal.images!.img1.toString(),
                                      pImage2:
                                          productModal.images!.img2.toString(),
                                      pImage3:
                                          productModal.images!.img3.toString(),
                                      pImage4:
                                          productModal.images!.img4.toString(),
                                      pName:
                                          productModal.productName.toString(),
                                      pInfo:
                                          productModal.productInfo.toString(),
                                      pPrice:
                                          productModal.productPrice.toString(),
                                      color1: productModal.colorCode!.color1
                                          .toString(),
                                      color2: productModal.colorCode!.color2
                                          .toString(),
                                      color3: productModal.colorCode!.color3
                                          .toString(),
                                      color4: productModal.colorCode!.color4
                                          .toString(),
                                      size1: productModal.size!.s.toString(),
                                      size2: productModal.size!.m.toString(),
                                      size3: productModal.size!.xL.toString(),
                                      size4: productModal.size!.xXL.toString(),
                                      review: "",
                                      reviewStar: "",
                                      pID: productModal.productId.toString(),
                                    )));
                      },
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

  getProducts() {
    ProductModalAdmin productModalAdmin = ProductModalAdmin();

    FirebaseFirestore.instance
        .collection(FirebaseString.productCollection)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        productModalAdmin = ProductModalAdmin.fromJson(result.data());
        productList.add(productModalAdmin);
      });
    });
  }

  getWishList() {
    WishListModal wishListModal = WishListModal();

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    FirebaseFirestore.instance
        .collection(FirebaseString.userCollection)
        .doc(user!.uid)
        .collection(FirebaseString.wishListCollection)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          wishListModal = WishListModal.fromJson(element.data());
          wishList.add(wishListModal);
        });
      });
    });
  }
  Widget slideLeftBackground() {
    return Container(
      color: colorGreen,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }Widget slideRightBackground() {
    return Container(
      color: colorGreen,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

}
