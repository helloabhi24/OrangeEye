import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

class CustomElevatedButtons extends StatelessWidget {
  final Function ontap;
  final String textButton;
  final Color? buttoncolor;
  final Color? textcolor;
  final double width;
  final double height;
  final bool isBorder;
  final IconData? icon;
  final FontWeight? fontWeight;
  final String? image;
  final bool isImage;
  const CustomElevatedButtons(
      {this.isImage = false,
      this.image,
      this.icon,
      this.fontWeight,
      this.isBorder = false,
      this.buttoncolor,
      required this.height,
      required this.width,
      required this.textcolor,
      required this.textButton,
      required this.ontap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: isImage
          ? CustomAssetsImage(
              imagePath: "assets/images/google.png",
              height: getVerticalSize(18))
          : Icon(
              icon,
              color: AppColor.blackColor,
              size: getVerticalSize(20),
            ),
      label: Padding(
        padding: EdgeInsets.only(right: Get.height * 0.025),
        child: AppText(
            color: textcolor,
            text: textButton,
            fontSize: (MediaQuery.of(context).size.width >= 690) ? 9 : 13,
            fontWeight: fontWeight),
      ),
      onPressed: () {
        ontap();
      },
      style: ElevatedButton.styleFrom(
          shape: (isBorder == true)
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                  side: BorderSide(color: AppColor.whiteColor, width: 1))
              : const StadiumBorder(),
          backgroundColor: buttoncolor,
          minimumSize: Size(width, height)),
    );
  }
}
