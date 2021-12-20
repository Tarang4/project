import 'package:flutter/material.dart';
import 'package:untitled/untils/app_fonts.dart';

import 'app_colors.dart';

class ProductContainer extends StatefulWidget {
  final String pImage;
  final String pName;
  final String pInfo;
  final String pPrice;

  const ProductContainer(
      {Key? key,
      required this.pImage,
      required this.pName,
      required this.pInfo,
      required this.pPrice})
      : super(key: key);

  @override
  _ProductContainerState createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  late final String image;
  late final String name;
  late final String info;
  late final String price;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = widget.pImage;
    name = widget.pName;
    info = widget.pInfo;
    price = widget.pPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height/3.9,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 3),
          child: Text(
            name,
            style: defaultTextStyle(fontSize: 16.0,fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          info,
          style: defaultTextStyle(fontSize: 12.0,fontWeight: FontWeight.w400,fontColors: colorGrey),
        ),
        Text(
          price,
          style: defaultTextStyle(fontSize: 16.0,fontWeight: FontWeight.w500,fontColors: colorGreen),
        ),
      ],
    );
  }
}
