import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/cartPageController.dart';
import 'package:orangeeye/controller.dart/coupounsController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'dart:math' as math;

class Coupounspage extends GetView<CoupounspageController> {
  Coupounspage({super.key});
  CartpageController cartpageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: AppColor.blackColor),
            backgroundColor: AppColor.whiteColor,
            centerTitle: true,
            title: AppText(
              text: "Coupons",
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColor.blackColor,
            ),
          ),
          body: SizedBox(
            child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return coupounsWidget(index, context);
                },
                itemCount: cartpageController.coupounsList.length),
          )),
    );
  }

  coupounsWidget(int index, context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.REDDEMPAGE);
              },
              child: CustomAssetsImage(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
                imagePath: "assets/image/coupoun.png",
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getVerticalSize(40),
                    horizontal: getHorizontalSize(15)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          color: AppColor.whiteColor,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w700,
                          text: "Coupouns Code",
                        ),
                        AppText(
                          color: AppColor.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          text: cartpageController.coupounsList[index].code,
                        ),
                      ],
                    ),
                    getheight(context, 0.010),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          color: AppColor.whiteColor,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w700,
                          text: "Coupouns Name",
                        ),
                        AppText(
                          color: AppColor.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          text: cartpageController.coupounsList[index].title,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          color: AppColor.whiteColor,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w700,
                          text: "Discount",
                        ),
                        AppText(
                          color: AppColor.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          text: "₹ " +
                              cartpageController.coupounsList[index].value,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          color: AppColor.whiteColor,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w700,
                          text: "Mini order amount",
                        ),
                        AppText(
                          color: AppColor.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          text: "₹ " +
                              cartpageController
                                  .coupounsList[index].minOrderAmt,
                        ),
                      ],
                    ),
                  ],
                )
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         AppText(
                //           color: AppColor.whiteColor,
                //           fontSize: 19.sp,
                //           fontWeight: FontWeight.w700,
                //           text: cartpageController.coupounsList[index].title,
                //         ),
                //         AppText(
                //           color: AppColor.whiteColor,
                //           fontSize: 19.sp,
                //           fontWeight: FontWeight.w700,
                //           text: cartpageController.coupounsList[index].title,
                //         ),
                //       ],
                //     ),
                //     Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         AppText(
                //           fontWeight: FontWeight.w600,
                //           fontSize: 17.sp,
                //           color: AppColor.whiteColor,
                //           text: cartpageController.coupounsList[index].code,
                //         ),
                //         height13,
                //         SizedBox(
                //           width: Get.width * 0.30,
                //           child: AppText(
                //             fontWeight: FontWeight.w600,
                //             fontSize: 12,
                //             color: AppColor.whiteColor,
                //             textAlign: TextAlign.center,
                //             text: "On your next purchase ",
                //           ),
                //         ),
                //         height5,
                //         AppText(
                //           color: AppColor.whiteColor,
                //           fontSize: 9,
                //           fontWeight: FontWeight.w400,
                //           text: "Used by 29 january 2021",
                //         ),
                //       ],
                //     )
                //   ],
                // ),
                )
          ],
        ));
  }
}
