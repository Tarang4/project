import 'package:flutter/material.dart';
import 'package:untitled/untils/app_fonts.dart';

Widget accountOption({
  @required BuildContext? context,
  @required String? title,
  @required String? icon,
  @required Function()? onPressed,
}){
  return GestureDetector(
    onTap: onPressed,
    child: Row(
      children: [
        Image.asset(
          icon!,
          height: 40,
        ),
        SizedBox(
          width: MediaQuery.of(context!).size.width / 16,
        ),
        Text(
          title!,
          style: defaultTextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          size: 14,
        )
      ],
    ),
  );
}