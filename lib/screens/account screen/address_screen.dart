import 'package:flutter/material.dart';
import 'package:untitled/untils/app_fonts.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
                  "Cards",
                  style: defaultTextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),

          ],
        ),
      ),
      // bottomNavigationBar: buildMyNavBar(context),
    );
  }
}
