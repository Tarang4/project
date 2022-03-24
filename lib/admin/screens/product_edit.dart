import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/modal/admin_product_modal.dart';
import 'package:untitled/admin/repository/add_product_repository.dart';
import '../../user_side/config/FireStore_string.dart';
import '../../user_side/config/app_colors.dart';
import '../../user_side/untils/app_fonts.dart';
import 'add_product_screen/add_product.dart';

class ProductEdit extends StatefulWidget {
  const ProductEdit({Key? key}) : super(key: key);

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite,
        title: Text(
          "Product Edit",
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
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 200,
                      width: double.infinity,
                      color: Colors.blue,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        ProductModalAdmin productModal =
                            ProductModalAdmin.fromJson(
                                snapshot.data.docs[index].data());
                        int c1 = int.parse(
                            productModal.colorCode!.color1.toString());

                        // Color hexToColor(String c1) {
                        //   return new Color(int.parse(c1.substring(1, 7), radix: 16) + 0xFF000000);
                        // }

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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: productModal
                                                    .images!.img1
                                                    .toString(),
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                                color:
                                                                    colorGreen)),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Container(
                                              height: 70,
                                              width: 70,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: productModal
                                                    .images!.img2
                                                    .toString(),
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                                color:
                                                                    colorGreen)),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: productModal
                                                    .images!.img3
                                                    .toString(),
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                                color:
                                                                    colorGreen)),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            Container(
                                              height: 70,
                                              width: 70,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: productModal
                                                    .images!.img4
                                                    .toString(),
                                                placeholder: (context, url) =>
                                                    const Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                                color:
                                                                    colorGreen)),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
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
                                            "Categories : ${productModal.categories.toString()}",
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
                                          Text(
                                            "S:${productModal.size!.s.toString()}             M:${productModal.size!.m.toString()} \nXL:${productModal.size!.xL.toString()}          XXL:${productModal.size!.xXL.toString()}",
                                            style: defaultTextStyle(
                                                fontSize: 12.0,
                                                fontColors: colorBlack,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
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
                                                          .colorCode!.color1
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
                                                          .colorCode!.color2
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
                                                          .colorCode!.color3
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
                                                          .colorCode!.color4
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
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorGreen,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => const AddProductAdminSide()));
        },
      ),
    );
  }
}
