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
import 'categeris_see_product.dart';

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
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: colorWhite.withOpacity(0.3),
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
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only( left: 10,top: 25,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const CategoriesSeeProduct(
                                            categories: '1',
                                          )));
                            },
                            child: Container(
                              height: 135,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/manadmin.png",
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Men",
                                      style: defaultTextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const CategoriesSeeProduct(
                                            categories: '2',
                                          )));
                            },
                            child: Container(
                              height: 135,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/womenadmin.png",
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Women",
                                      style: defaultTextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/75,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const CategoriesSeeProduct(
                                            categories: '3',
                                          )));
                            },
                            child: Container(
                              height: 135,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/kidsadmin.png",
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Kids",
                                      style: defaultTextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const CategoriesSeeProduct(
                                            categories: '4',
                                          )));
                            },
                            child: Container(
                              height: 135,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/shoesadmin.png",
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Shoes",
                                      style: defaultTextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/75,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const CategoriesSeeProduct(
                                            categories: '5',
                                          )));
                            },
                            child: Container(
                              height: 135,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/devicesadmin.png",
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Devices",
                                      style: defaultTextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          const CategoriesSeeProduct(
                                            categories: '6',
                                          )));
                            },
                            child: Container(
                              height: 135,
                              width: 100,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/perfumeadmin.png",
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Perfumes",
                                      style: defaultTextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/75,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const CategoriesSeeProduct(
                                          categories: '7',
                                        )));
                          },
                          child: Container(
                            height: 135,
                            width: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/watchadmin.png",
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Watch",
                                    style: defaultTextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
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
