import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../../../modal/product_modal.dart';
import '../../../untils/app_fonts.dart';
import '../../../untils/categories_product.dart';
import '../../../untils/product_container.dart';

class MenScreen extends StatefulWidget {
  const MenScreen({Key? key}) : super(key: key);

  @override
  _MenScreenState createState() => _MenScreenState();
}

class _MenScreenState extends State<MenScreen> {
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
        productPrice: "\$700"), ProductModal(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Mens Products",
                        style: defaultTextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),


              IntrinsicGridView.vertical(
                padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
                columnCount: 2,
                verticalSpace: 14,
                horizontalSpace: 16,
                children: List.generate(
                  productList.length,
                      (index) => ProductContainer(
                    pImage: productList[index].img2,
                    pName: productList[index].productName,
                    pInfo: productList[index].productInfo,
                    pPrice: productList[index].productPrice,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
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
