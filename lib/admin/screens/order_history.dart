import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../../user_side/config/app_colors.dart';
import '../../user_side/untils/app_fonts.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  bool orderConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          automaticallyImplyLeading: false,
          backgroundColor: colorWhite,
          title: Text(
            "Order History",
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
        body: Column(
          children: [
            // ListView.builder(
            //     physics: const BouncingScrollPhysics(),
            //     itemCount: 2,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Container(
            //         child: ExpandableNotifier(
            //             child: Padding(
            //           padding: const EdgeInsets.all(10),
            //           child: Card(
            //             clipBehavior: Clip.antiAlias,
            //             child: Column(
            //               children: <Widget>[
            //                 SizedBox(
            //                   height: 170,
            //                   child: Container(
            //                     decoration: const BoxDecoration(
            //                       color: Colors.orange,
            //                       shape: BoxShape.rectangle,
            //                     ),
            //                   ),
            //                 ),
            //                 ScrollOnExpand(
            //                   scrollOnExpand: true,
            //                   scrollOnCollapse: false,
            //                   child: ExpandablePanel(
            //                     theme: const ExpandableThemeData(
            //                       headerAlignment:
            //                           ExpandablePanelHeaderAlignment.center,
            //                       tapBodyToCollapse: true,
            //                     ),
            //                     header: Padding(
            //                         padding: const EdgeInsets.all(10),
            //                         child: Text(
            //                           "Product Category : Name",
            //                           style: defaultTextStyle(fontSize: 14.0),
            //                         )),
            //                     collapsed: const Text(
            //                       "See More......",
            //                       softWrap: true,
            //                       maxLines: 2,
            //                       overflow: TextOverflow.ellipsis,
            //                     ),
            //                     expanded: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: <Widget>[
            //                         Row(
            //                           children: [
            //                             Text(
            //                               "Product Name : ",
            //                               style: defaultTextStyle(fontSize: 14.0),
            //                             ),
            //                             Text(
            //                               "Product Name",
            //                               style: defaultTextStyle(
            //                                   fontSize: 14.0,
            //                                   fontWeight: FontWeight.w300),
            //                             )
            //                           ],
            //                         ),
            //                         Row(
            //                           children: [
            //                             Text(
            //                               "Color And Size : ",
            //                               style: defaultTextStyle(fontSize: 14.0),
            //                             ),
            //                             Text(
            //                               "Color And Size",
            //                               style: defaultTextStyle(
            //                                   fontSize: 14.0,
            //                                   fontWeight: FontWeight.w300),
            //                             )
            //                           ],
            //                         ),
            //                         Row(
            //                           children: [
            //                             Text(
            //                               "Price : ",
            //                               style: defaultTextStyle(fontSize: 14.0),
            //                             ),
            //                             Text(
            //                               "Product Price",
            //                               style: defaultTextStyle(
            //                                   fontSize: 14.0,
            //                                   fontWeight: FontWeight.w300),
            //                             )
            //                           ],
            //                         ),
            //                         Row(
            //                           children: [
            //                             Text(
            //                               "Card Number : ",
            //                               style: defaultTextStyle(fontSize: 14.0),
            //                             ),
            //                             Text(
            //                               "Card Detaile:",
            //                               style: defaultTextStyle(
            //                                   fontSize: 14.0,
            //                                   fontWeight: FontWeight.w300),
            //                             )
            //                           ],
            //                         ),
            //                         Row(
            //                           children: [
            //                             Text(
            //                               "Address : ",
            //                               style: defaultTextStyle(fontSize: 14.0),
            //                             ),
            //                             Text(
            //                               "Address:",
            //                               style: defaultTextStyle(
            //                                   fontSize: 14.0,
            //                                   fontWeight: FontWeight.w300),
            //                             )
            //                           ],
            //                         ),
            //                         const SizedBox(height: 15,),
            //                         InkWell(
            //                           onTap: (){
            //
            //                           },
            //                           child: orderConfirm? Container(
            //                             height: 25,
            //                             width: 100,
            //                             alignment: Alignment.center,
            //                             decoration: BoxDecoration(
            //                                 color: colorGreen,
            //                                 borderRadius: BorderRadius.circular(10),
            //                                 border: Border.all(
            //                                     width: 1, color: colorGreen)),
            //                             child: Text(
            //                               "CONFIRM",
            //                               style: defaultTextStyle(
            //                                   fontSize: 14.0,
            //                                   fontColors: colorWhite,
            //                                   fontWeight: FontWeight.w500),
            //                             ),
            //                           ): Container(
            //                             height: 25,
            //                             width: 100,
            //                             alignment: Alignment.center,
            //                             decoration: BoxDecoration(
            //                                 borderRadius: BorderRadius.circular(10),
            //                                 border: Border.all(
            //                                     width: 1, color: colorGreen)),
            //                             child: Text(
            //                               "✓ CHECKED",
            //                               style: defaultTextStyle(
            //                                   fontSize: 14.0,
            //                                   fontWeight: FontWeight.w500),
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                     builder: (_, collapsed, expanded) {
            //                       return Padding(
            //                         padding: const EdgeInsets.only(
            //                             left: 10, right: 10, bottom: 10),
            //                         child: Expandable(
            //                           collapsed: collapsed,
            //                           expanded: expanded,
            //                           theme: const ExpandableThemeData(
            //                               crossFadePoint: 0),
            //                         ),
            //                       );
            //                     },
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         )),
            //       );
            //     }),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: colorLightGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (orderConfirm == true) {
                                orderConfirm = false;
                                if (orderConfirm == false) {
                                } else {
                                  orderConfirm = true;
                                }
                              }
                            });
                          },
                          child: orderConfirm == true
                              ? Container(
                                  height: 25,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: colorGreen,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1, color: colorGreen)),
                                  child: Text(
                                    "CONFIRM",
                                    style: defaultTextStyle(
                                        fontSize: 14.0,
                                        fontColors: colorWhite,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              : Container(
                                  height: 25,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1, color: colorGreen)),
                                  child: Text(
                                    "✓ CHECKED",
                                    style: defaultTextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                        )

                        // Container(
                        //   height: 30,
                        //   width: 110,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.grey
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Category : ",
                                style: defaultTextStyle(fontSize: 13.0),
                              ),
                              Text(
                                "Category type",
                                style: defaultTextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          Text(
                            "Product Name : ",
                            style: defaultTextStyle(fontSize: 13.0),
                          ),
                          Text(
                            "Product Name",
                            style: defaultTextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w300),
                          ),
                          Row(
                            children: [
                              Text(
                                "Color And Size : ",
                                style: defaultTextStyle(fontSize: 13.0),
                              ),
                              Text(
                                "Color And Size",
                                style: defaultTextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Price : ",
                                style: defaultTextStyle(fontSize: 13.0),
                              ),
                              Text(
                                "Product Price",
                                style: defaultTextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          Text(
                            "Card Number : ",
                            style: defaultTextStyle(fontSize: 13.0),
                          ),
                          Text(
                            "Card Detaile",
                            style: defaultTextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "Address : ",
                            style: defaultTextStyle(fontSize: 13.0),
                          ),
                          Text(
                            "Address",
                            style: defaultTextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
