import 'package:flutter/material.dart';
import 'package:untitled/untils/app_fonts.dart';

import '../config/app_colors.dart';

class CategoriesContainer extends StatefulWidget {
  final String catImage;
  final String catName;
  final GestureTapCallback onTap;

  const CategoriesContainer({Key? key, required this.catImage, required this.catName, required this.onTap}) : super(key: key);

  @override
  _CategoriesContainerState createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
   late String image;
   late String name;
   late GestureTapCallback onTap;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image=widget.catImage;
    name=widget.catName;
    onTap=widget.onTap;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 89,
      margin: const EdgeInsets.only(right: 20),
      child: GestureDetector(onTap: onTap,
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
              style: defaultTextStyle(fontSize: 12.0,fontWeight: FontWeight.w400)
            ),
          ],
        ),
      ),
    );
  }
}
