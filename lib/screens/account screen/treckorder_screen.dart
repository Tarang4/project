import 'package:flutter/material.dart';
import 'package:untitled/untils/app_fonts.dart';
import 'package:untitled/untils/app_colors.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.1,
                ),
                Text(
                  "Track Order",
                  style: defaultTextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Container(
              height: 175,
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "sept 23, 2021",
                    style: defaultTextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Container(
                    height: 140,
                    padding: EdgeInsets.only(
                        top: 18, left: 20, right: 20, bottom: 17),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "OD-87801226 -N",
                              style: defaultTextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "\$400",
                              style: defaultTextStyle(
                                  fontSize: 15.0,
                                  fontColors: colorGreen,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              height: 30,
                              alignment: Alignment.center,
                              width: 80,
                              child: Text(
                                "In Transit",
                                style: defaultTextStyle(
                                    fontSize: 15.0,
                                    fontColors: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              decoration: BoxDecoration(
                                  color: colorYellow,
                                  borderRadius: BorderRadius.circular(4)),
                            )
                          ],
                        ),
                        Container(
                          height: double.infinity,
                          color: Colors.blue,
                          width: 100,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 175,
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "sept 23, 2021",
                    style: defaultTextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Container(
                    height: 140,
                    padding: EdgeInsets.only(
                        top: 18, left: 20, right: 20, bottom: 17),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "OD-87801226 -N",
                              style: defaultTextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "\$400",
                              style: defaultTextStyle(
                                  fontSize: 15.0,
                                  fontColors: colorGreen,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              height: 30,
                              alignment: Alignment.center,
                              width: 80,
                              child: Text(
                                "In Transit",
                                style: defaultTextStyle(
                                    fontSize: 15.0,
                                    fontColors: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              decoration: BoxDecoration(
                                  color: colorYellow,
                                  borderRadius: BorderRadius.circular(4)),
                            )
                          ],
                        ),
                        Container(
                          height: double.infinity,
                          color: Colors.blue,
                          width: 100,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
