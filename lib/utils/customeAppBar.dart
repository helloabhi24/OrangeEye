import 'package:flutter/material.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';

class CustomAppbar {
  static PreferredSizeWidget customeAppbar(
      {String title = "appbar",
      double fontSize = 15,
      FontWeight fontWeight = FontWeight.w500,
      Color appBarColor = AppColor.whiteColor,
      bool isImage = false,
      String imagePath = ""}) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColor.blackColor),
      elevation: 1,
      backgroundColor: appBarColor,
      centerTitle: true,
      title: isImage == true
          ? CustomAssetsImage(
              height: 60,
              imagePath: imagePath,
            )
          : AppText(
              text: title,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
      actions: const [
        Icon(
          Icons.shopping_bag_outlined,
        ),
        Padding(
          padding: EdgeInsets.all(14.0),
          child: Icon(
            Icons.search,
          ),
        ),
      ],
    );
  }
}
