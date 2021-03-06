import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../../../admin/modal/admin_product_modal.dart';
import '../../config/FireStore_string.dart';
import '../../config/app_colors.dart';
import '../../modal/product_modal.dart';
import '../../untils/app_fonts.dart';
import '../../untils/categories_product.dart';
import '../../untils/product_container.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({Key? key}) : super(key: key);

  @override
  _SeeAllScreenState createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite.withOpacity(0.1),
        centerTitle: true,
        title: Text(
          "See All Products",
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
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(FirebaseString.productCollection)
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return IntrinsicGridView.vertical(
                        padding:
                        const EdgeInsets.only(top: 21, left: 5, right: 5),
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
                                          categories: productModal.categories
                                              .toString(),
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

                    return Center(
                        child: CircularProgressIndicator(
                          color: colorGreen,
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
