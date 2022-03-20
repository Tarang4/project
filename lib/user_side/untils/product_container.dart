import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class ProductContainer extends StatefulWidget {
  final String pImage;
  final String pName;
  final String pInfo;
  final String pPrice;
  final GestureTapCallback onTap;

  const ProductContainer(
      {Key? key,
      required this.pImage,
      required this.pName,
      required this.pInfo,
      required this.pPrice,
      required this.onTap})
      : super(key: key);

  @override
  _ProductContainerState createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  late final String image;
  late final String name;
  late final String info;
  late final String price;
  late final GestureTapCallback onTap;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = widget.pImage;
    name = widget.pName;
    info = widget.pInfo;
    price = widget.pPrice;
    onTap = widget.onTap;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            // padding: const EdgeInsets.only(left: 3,right: 3,),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: image,
              placeholder: (context, url) =>
                  const Center(
                      child:
                      CircularProgressIndicator(
                          color:
                          colorGrey)),
              errorWidget:
                  (context, url, error) =>
              const Icon(Icons.error),
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
      ),
    );
  }
}
