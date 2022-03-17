import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import 'app_fonts.dart';

class ReviewContainer extends StatefulWidget {
  String img;
  String userName;
  String review;

  ReviewContainer(
      {Key? key,
      required this.img,
      required this.userName,
      required this.review})
      : super(key: key);

  @override
  _ReviewContainerState createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer> {
  late String img;
  late String userName;
  late String review;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    img = widget.img;
    userName = widget.userName;
    review = widget.review;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 30),
        height: 85,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 47,
              width: 47,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 26,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userName,
                        style: defaultTextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.00),
                      ),
                      Row(
                          children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          size: 18,
                          color: colorYellow,
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                      child: Text(
                    review,
                    style: defaultTextStyle(
                        fontWeight: FontWeight.normal,
                        wordSpacing: 2.0,
                        fontSize: 14.00),
                  )),
                ],
              ),
            )
          ],
        ));
  }
}
