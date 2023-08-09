import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/whishlistController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/view.dart/authenticationPage/inputMobileNumberPage.dart';
import '../view.dart/cartPage.dart';

class CustomAppbar {
  static PreferredSizeWidget customeAppbar({
    Color? color,
    String title = "appbar",
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.w500,
    // Color appBarColor = AppColor.whiteColor,
    Color appBarColor = AppColor.whiteColor,
    bool isImage = false,
    String imagePath = "",
  }) {
    WishlistPageController whishlistController = Get.find();
    HomepageController homepageController = Get.find();

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
        // GestureDetector(
        //     onTap: () {
        //       // Get.toNamed(Routes.NOTIFICATIOsN);
        //       // Get.to(InvoicePage());
        //     },
        //     child: Icon(Icons.notifications_outlined)),
        getWidth(Get.context, 0.030),
        Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (homepageController.sharedPref.userToken.value.isEmpty) {
                  Get.to(LoginScreen());
                } else {
                  Get.to(CartPage());
                }
              },
              child: Icon(
                Icons.shopping_bag_outlined,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getHorizontalSize(10), bottom: getVerticalSize(20)),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: AppColor.orangeColor,
                child: Padding(
                  padding: EdgeInsets.only(bottom: getVerticalSize(0)),
                  child: AppText(
                    text: homepageController.getCartList!.length.toString(),
                    fontSize: 11.sp,
                    color: AppColor.whiteColor,
                  ),
                ),
              ),
            )
          ],
        ),
        getWidth(Get.context, 0.035),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 14),
              child: GestureDetector(
                onTap: () {
                  if (homepageController.sharedPref.userToken.value.isEmpty) {
                    Get.to(LoginScreen());
                    // loginDialouge(Get.context);
                  } else {
                    Get.toNamed(Routes.WISHLISTPAGE);
                  }
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
                radius: 8,
                backgroundColor: AppColor.orangeColor,
                child: Padding(
                  padding: EdgeInsets.only(bottom: getVerticalSize(0)),
                  child: AppText(
                    text: whishlistController.whistList.length.toString(),
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
