import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../utils/appColor.dart';
import '../utils/customeAssetsImage.dart';
import '../utils/customeElevatedButton.dart';

class EmailConfirmationPage extends StatelessWidget {
  const EmailConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height * 0.02,
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    CustomAssetsImage(
                      height: Get.height * 0.18,
                      imagePath: "assets/image/appLogo.png",
                    ),
                    getheight(context, 0.020),
                    AppText(
                      text: "Your Order is confirm!",
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    getheight(context, 0.020),
                    AppText(
                      text: "Estimated Delivery",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    getheight(context, 0.015),
                    AppText(
                      text: "June 5 - June 9",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    getheight(context, 0.015),
                    CustomElevatedButtons(
                        fontWeight: FontWeight.w600,
                        isBorder: true,
                        buttoncolor: AppColor.orangeColor,
                        height: Get.height * 0.050,
                        width: Get.width * 0.53,
                        textcolor: AppColor.whiteColor,
                        textButton: "TRACK MY PACKAGE",
                        ontap: () {}),
                    getheight(context, 0.010),
                    AppText(
                      textAlign: TextAlign.center,
                      text:
                          "Please note , it may take up to 24hrs \n for tracking to become available",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              getheight(context, 0.020),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Items in your order",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      text: "#201305",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.greyColor,
                    ),
                  ],
                ),
              ),
              getheight(context, 0.030),
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColor.greyColor.withOpacity(0.2))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAssetsImage(
                      height: Get.height * 0.15,
                      imagePath: "assets/image/g3.png",
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "LZ-012",
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.greyColor,
                        ),
                        AppText(
                          text: "color : Red",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor,
                        ),
                        AppText(
                          text: "Model-20152",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor,
                        ),
                      ],
                    ),
                    AppText(
                      text: "₹ 2000.00",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  text: " Order Total:          Rs.2000.00",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.greyColor,
                ),
              ),
              getheight(context, 0.030),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Ship To:",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        textAlign: TextAlign.left,
                        text:
                            "Akash Sharma \n 8927487552 \n as453168@gmail.com \n Murgasol Amedkar Road",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.greyColor,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        text: "Shipping Method:",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        textAlign: TextAlign.right,
                        text: "5 to 7 days free delivery \n \n \n",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.greyColor,
                      ),
                    ],
                  )
                ],
              ),
              getheight(context, 0.040),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_outlined),
                        width13,
                        AppText(
                          text: "Any Question ?",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Container(
                      width: Get.width * 0.60,
                      child: AppText(
                        textAlign: TextAlign.center,
                        text:
                            "If you need any help whatever or just want to chat , email us any time..........",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              getheight(context, 0.020),
            ],
          ),
        ),
      ),
    );
  }
}
