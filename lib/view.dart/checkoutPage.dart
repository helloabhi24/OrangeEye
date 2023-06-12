import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../routes/approutes.dart';
import '../utils/customeElevatedButton.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.customeAppbar(
          title: "Select address", color: AppColor.blackColor),
      body: Column(
        children: [
          getheight(context, 0.010),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
            child: CustomElevatedButtons(
                isBorder: true,
                buttoncolor: AppColor.orangeColor,
                height: Get.height * 0.060,
                width: Get.width,
                textcolor: AppColor.whiteColor,
                textButton: "+ Add New Address",
                ontap: () {
                  Get.toNamed(Routes.ADDNEWADDRESSPAGE);
                  // Get.to(const Signin(),
                  //     transition: Transition.zoom);
                }),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getHorizontalSize(10),
                vertical: getVerticalSize(10)),
            child: CustomElevatedButtons(
                isBorder: true,
                buttoncolor: AppColor.orangeColor,
                height: Get.height * 0.060,
                width: Get.width,
                textcolor: AppColor.whiteColor,
                textButton: "Continue",
                ontap: () {
                  Get.toNamed(Routes.PAYMENTPAGE);
                  // Get.to(const Signin(),
                  //     transition: Transition.zoom);
                }),
          ),
        ],
      ),
    );
  }
}
