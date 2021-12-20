import 'package:flutter/material.dart';
import 'package:untitled/untils/app_colors.dart';

class SearchS2 extends StatefulWidget {
  const SearchS2({Key? key}) : super(key: key);

  @override
  _SearchS2State createState() => _SearchS2State();
}

class _SearchS2State extends State<SearchS2> {
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 19,
          ),
          Hero(
            tag: "search",
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: 40,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: colorLightGrey,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: [
                    Container(
                      height: 18,
                      margin: EdgeInsets.only(top: 11, bottom: 11),
                      width: 18,
                      child: Image.asset(
                        "assets/images/icons/Group 341@3x.png",
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 5.5, left: 8),
                        child: TextFormField(
                          controller: _search,
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              color: colorBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 12,
                        margin: EdgeInsets.only(top: 11, bottom: 11),
                        width: 12,
                        child: Image.asset(
                          "assets/images/icons/Group 342@3x.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
