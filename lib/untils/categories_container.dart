import 'package:flutter/material.dart';

import 'app_colors.dart';

class CategoriesContainer extends StatefulWidget {
  final String catImage;
  final String catName;

  const CategoriesContainer({Key? key, required this.catImage, required this.catName}) : super(key: key);

  @override
  _CategoriesContainerState createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
   late String image;
   late String name;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image=widget.catImage;
    name=widget.catName;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 89,
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: colorWhite, borderRadius: BorderRadius.circular(50)),
            width: 60,
            child: Image.asset(image),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
