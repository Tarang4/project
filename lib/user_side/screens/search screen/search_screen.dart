import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../../../admin/modal/admin_product_modal.dart';
import '../../config/FireStore_string.dart';
import '../../config/app_colors.dart';
import '../../untils/categories_product.dart';
import '../../untils/product_container.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _search = TextEditingController();
  List<ProductModalAdmin> productList = [];
  List<ProductModalAdmin> productFoundList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  onchange(String search) {
    if(_search.text.isEmpty){
      setState(() {
        productFoundList.length=0;

      });
    }else {
      setState(() {
        productFoundList = productList
            .where((element) =>
            element.productName
                .toString()
                .toLowerCase()
                .contains(search.toLowerCase()))
            .toList();
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 6.0, right: 6),
      child: SingleChildScrollView(
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
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(left: 6.0, right: 6),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: colorLightGrey,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        margin: EdgeInsets.only(top: 11, bottom: 11),
                        width: 18,
                        child: Image.asset(
                          "assets/images/icons/Group 341@3x.png",
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 5.5, left: 8),
                          child: TextFormField(
                            onChanged: (value) => onchange(value),
                            controller: _search,
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: colorBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 12,
                          margin: EdgeInsets.only(top: 11, bottom: 11),
                          width: 12,
                          child: Image.asset(
                            "assets/images/icons/Group 342@3x.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            productFoundList.isEmpty
                ? const Text("no found")
                : IntrinsicGridView.vertical(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    columnCount: 2,
                    verticalSpace: 14,
                    horizontalSpace: 16,
                    children: List.generate(
                      productFoundList.length,
                      (index) {
                        ProductModalAdmin productModal = productFoundList[index];

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
                                          color1: productModal.colorCode!.color1
                                              .toString(),
                                          color2: productModal.colorCode!.color2
                                              .toString(),
                                          color3: productModal.colorCode!.color3
                                              .toString(),
                                          color4: productModal.colorCode!.color4
                                              .toString(),
                                          size1:
                                              productModal.size!.s.toString(),
                                          size2:
                                              productModal.size!.m.toString(),
                                          size3:
                                              productModal.size!.xL.toString(),
                                          size4:
                                              productModal.size!.xXL.toString(),
                                          review: "",
                                          reviewStar: "",
                                          pID:
                                              productModal.productId.toString(),
                                        )));
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    ));
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
}
