import 'package:flutter/material.dart';
import '../utils/appColor.dart';
import '../utils/sizeHelper.dart';

class ColorDots extends StatelessWidget {
  final Color? dotsColor;
  const ColorDots({this.dotsColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(25),
      width: getHorizontalSize(20),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.greyColor)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          radius: 10,
          backgroundColor: dotsColor,
        ),
      ),
    );
  }
}
