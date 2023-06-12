import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'dart:math' as math;
import '../controller.dart/coupounsController.dart';
import '../routes/approutes.dart';
import '../utils/customeAssetsImage.dart';
import '../utils/customeElevatedButton.dart';

class CoupounRedeemPage extends GetView<CoupounspageController> {
  const CoupounRedeemPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.blackColor),
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
        title: AppText(
          text: "Redeem",
          color: AppColor.blackColor,
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            child: CustomAssetsImage(
              height: Get.height,
              width: Get.width,
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
              imagePath: "assets/image/redeem.png",
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: getVerticalSize(80)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    text: "Teclo",
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.whiteColor,
                  ),
                  AppText(
                    text: "Fashionable and Cool Glasses",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                    color: AppColor.whiteColor,
                  ),
                  getheight(context, 0.040),
                  AppText(
                    text: "15% OFF",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.whiteColor,
                  ),
                  getheight(context, 0.020),
                  AppText(
                    text: "On your next purchase",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.whiteColor,
                  ),
                  getheight(context, 0.080),
                  AppText(
                    text: "COUPOUN CODE",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.whiteColor,
                  ),
                  getheight(context, 0.010),
                  AppText(
                    text: "AS15SALE",
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.whiteColor,
                  ),
                  getheight(context, 0.050),
                  CustomElevatedButtons(
                      isBorder: true,
                      buttoncolor: AppColor.orangeColor,
                      height: Get.height * 0.060,
                      width: Get.width * 0.80,
                      textcolor: AppColor.whiteColor,
                      textButton: "REDEEM COUPOUNS",
                      ontap: () {
                        Get.toNamed(Routes.MAINPAGE);
                        // Get.to(const Signin(),
                        //     transition: Transition.zoom);
                      }),
                  getheight(context, 0.010),
                  AppText(
                    text: "Use by 29 january 2021",
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w300,
                    color: AppColor.whiteColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
