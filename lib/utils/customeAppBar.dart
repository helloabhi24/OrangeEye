import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/whishlistController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

class CustomAppbar {
  static PreferredSizeWidget customeAppbar({
    Color? color,
    String title = "appbar",
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.w500,
    Color appBarColor = AppColor.whiteColor,
    bool isImage = false,
    String imagePath = "",
  }) {
    WishlistPageController whishlistController = Get.find();
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
              color: color,
            ),
      actions: [
        GestureDetector(
            onTap: () {
              Get.toNamed(Routes.NOTIFICATION);
            },
            child: Icon(Icons.notifications_outlined)),
        width8,
        Icon(
          Icons.shopping_bag_outlined,
        ),
        width8,
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 14),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.WISHLISTPAGE);
                },
                child: Icon(
                  Icons.favorite_outline,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getHorizontalSize(10), bottom: getVerticalSize(20)),
              child: CircleAvatar(
                radius: 9,
                backgroundColor: AppColor.orangeColor,
                child: Padding(
                  padding: EdgeInsets.only(bottom: getVerticalSize(0)),
                  child: AppText(
                    text: whishlistController.whislistProductList!.length
                        .toString(),
                    fontSize: 11.sp,
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

PreferredSizeWidget cartPage() {
  return AppBar(
    toolbarHeight: 0,
    backgroundColor: AppColor.whiteColor,
  );
}
