import 'package:flutter/material.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.27,
          width: double.infinity,
          // padding: const EdgeInsets.only(left: 0,right: 7,),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          info,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.normal, color: colorGrey),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          price,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.normal, color: colorGreen),
        ),
      ],
    );
  }
}
