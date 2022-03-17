import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/admin/modal/admin_product_modal.dart';

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
        backgroundColor: colorGreen,
        title: Text(
          "Product Edit",
          style: defaultTextStyle(
              fontSize: 25.0,
              fontColors: colorBlack,
              fontWeight: FontWeight.normal),
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
                      margin: EdgeInsets.only(bottom: 10),
                      height: 200,
                      width: double.infinity,
                      color: Colors.blue,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        ProductModalAdmin productModal =
                            ProductModalAdmin.fromJson(
                                snapshot.data.docs[index].data());
                        int c1=int.parse(productModal.colorCode!.color1.toString());

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
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                                color:
                                                                    colorGreen)),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            ),
                                            SizedBox(
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
                                                    Center(
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
                                        SizedBox(
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
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                                color:
                                                                    colorGreen)),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            ),
                                            SizedBox(
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
                                                    Center(
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
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productModal.categories.toString(),
                                          style: defaultTextStyle(
                                              fontSize: 18.0,
                                              fontColors: colorBlack,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          height: 9,
                                        ),
                                        Text(
                                          productModal.productName.toString(),
                                          style: defaultTextStyle(
                                              fontSize: 18.0,
                                              fontColors: colorBlack,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          productModal.productInfo.toString(),
                                          style: defaultTextStyle(
                                              fontSize: 18.0,
                                              fontColors: colorBlack,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "\$ ${productModal.productPrice.toString()}",
                                          style: defaultTextStyle(
                                              fontSize: 18.0,
                                              fontColors: colorBlack,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          "S:${productModal.size!.s.toString()}             M:${productModal.size!.m.toString()} \nXL:${productModal.size!.xL.toString()}             XXL:${productModal.size!.xXL.toString()}",
                                          style: defaultTextStyle(
                                              fontSize: 12.0,
                                              fontColors: colorBlack,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 40,
                                                  color: Color(int.parse(productModal.colorCode!.color1.toString())),

                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 40,
                                                  color: Color(int.parse(productModal.colorCode!.color2.toString())),

                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 40,
                                                  color: Color(int.parse(productModal.colorCode!.color3.toString())),

                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 40,
                                                  color: Color(int.parse(productModal.colorCode!.color4.toString())),

                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
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
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
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

          return Center(
              child: CircularProgressIndicator(
            color: colorGreen,
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorGreen,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => AddProductAdminSide()));
        },
      ),
    );
  }
}
