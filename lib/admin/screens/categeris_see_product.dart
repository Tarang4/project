import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/screens/product_edit.dart';

import '../../user_side/config/FireStore_string.dart';
import '../../user_side/config/app_colors.dart';
import '../../user_side/untils/app_fonts.dart';
import '../modal/admin_product_modal.dart';
import '../repository/add_product_repository.dart';
import 'add_product_screen/add_product.dart';

class CategoriesSeeProduct extends StatefulWidget {
  final String categories;

  const CategoriesSeeProduct({Key? key, required this.categories})
      : super(key: key);

  @override
  State<CategoriesSeeProduct> createState() => _CategoriesSeeProductState();
}

class _CategoriesSeeProductState extends State<CategoriesSeeProduct> {
  String? categoryName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryName = widget.categories == "1"
        ? "Male"
        : widget.categories == "2"
            ? "Women"
            : widget.categories == "3"
                ? "Kids"
                : widget.categories == "4"
                    ? "Shoes"
                    : widget.categories == "5"
                        ? "Devices"
                        : widget.categories == "6"
                            ? "Perfumes"
                            : widget.categories == "7"
                                ? "watch"
                                : "Men";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorGreen,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => AddProductAdminSide(
                    categories: widget.categories.toString(),
                  )));
        },
      ),
      appBar: AppBar(
        elevation: 2,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite,
        title: Text(
          "$categoryName Product",
          style: defaultTextStyle(
              fontSize: 20.0,
              fontColors: colorBlack,
              fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(FirebaseString.productCollection)
            .where("categories", isEqualTo: widget.categories)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        ProductModalAdmin productModal =
                            ProductModalAdmin.fromJson(
                                snapshot.data.docs[index].data());
                        String sSize = productModal.size!.s.toString();
                        String mSize = productModal.size!.m.toString();
                        String xlSize = productModal.size!.xL.toString();
                        String xxlSize = productModal.size!.xXL.toString();

                        return Card(
                          elevation: 3,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 180,
                                      width: 150,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: productModal.images!.img1
                                            .toString(),
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: colorGreen)),
                                        errorWidget: (context, url, error) =>
                                            new Icon(Icons.error),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Categories : $categoryName",
                                            style: defaultTextStyle(
                                                fontSize: 14.0,
                                                fontColors: colorBlack,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            productModal.productName.toString(),
                                            style: defaultTextStyle(
                                                fontSize: 16.0,
                                                fontColors: colorBlack,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            productModal.productInfo.toString(),
                                            style: defaultTextStyle(
                                                fontSize: 12.0,
                                                fontColors: colorBlack,
                                                fontWeight: FontWeight.w100),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "₹${productModal.productPrice.toString()}",
                                            style: defaultTextStyle(
                                                fontSize: 15.0,
                                                fontColors: colorBlack,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          (widget.categories == "5" ||
                                                  widget.categories == "6" ||
                                                  widget.categories == "7")
                                              ? Container()
                                              : Row(
                                                  children: [
                                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(widget.categories=="4"?sSize=="true"? "7: Available":"7: Unavailable":
                                                         sSize=="true"? "S: Available":"S: Unavailable",
                                                          style: defaultTextStyle(
                                                              fontSize: 12.0,
                                                              fontColors:
                                                                  colorBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                        Text(widget.categories=="4"?sSize=="true"? "8: Available":"8: Unavailable":
                                                          mSize=="true"? "M: Available":"M: Unavailable",
                                                          style: defaultTextStyle(
                                                              fontSize: 12.0,
                                                              fontColors:
                                                                  colorBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(widget.categories=="4"?sSize=="true"? "9: Available":"9: Unavailable":
                                                          xlSize=="true"? "XL: Available":"XL: Unavailable",
                                                          style: defaultTextStyle(
                                                              fontSize: 12.0,
                                                              fontColors:
                                                                  colorBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                        Text(widget.categories=="4"?sSize=="true"? "10: Available":"10:Unavailable":
                                                          xxlSize=="true"? "XXL: Available":"XXL: Unavailable",
                                                          style: defaultTextStyle(
                                                              fontSize: 12.0,
                                                              fontColors:
                                                                  colorBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          (widget.categories == "5" ||
                                                  widget.categories == "6" ||
                                                  widget.categories == "7")
                                              ? Container()
                                              : Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 20,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color: colorBlack),
                                                        shape: BoxShape.circle,
                                                        color: Color(int.parse(
                                                            productModal
                                                                .colorCode!
                                                                .color1
                                                                .toString())),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color: colorBlack),
                                                        shape: BoxShape.circle,
                                                        color: Color(int.parse(
                                                            productModal
                                                                .colorCode!
                                                                .color2
                                                                .toString())),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color: colorBlack),
                                                        shape: BoxShape.circle,
                                                        color: Color(int.parse(
                                                            productModal
                                                                .colorCode!
                                                                .color3
                                                                .toString())),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color: colorBlack),
                                                        shape: BoxShape.circle,
                                                        color: Color(int.parse(
                                                            productModal
                                                                .colorCode!
                                                                .color4
                                                                .toString())),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          const SizedBox(
                                            height: 9,
                                          ),
                                          Text(
                                            "Id : ${productModal.productId.toString()}",
                                            style: defaultTextStyle(
                                                fontSize: 12.0,
                                                fontColors: colorBlack,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    ProductRepository.deleteProducts(
                                        id: productModal.productId.toString());
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    child: Text(
                                      "Delete Producrt",
                                      style: defaultTextStyle(
                                          fontSize: 14.0,
                                          fontColors: Colors.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            print("error not found product ${snapshot.hasError}");
          }

          return const Center(
            child: CircularProgressIndicator(
              color: colorGreen,
            ),
          );
        },
      ),
    );
  }
}
