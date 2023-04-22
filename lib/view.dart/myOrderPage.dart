import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/orderPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../utils/customeElevatedButton.dart';

class MyOrderPage extends GetView<OrderpageController> {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.customeAppbar(
        title: "Order",
        color: AppColor.blackColor,
      ),
      body: Column(
        children: [
          height20,
          Align(
            alignment: Alignment.center,
            child: Container(
              height: Get.height * 0.33,
              width: Get.width * 0.90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.blackColor)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalSize(10),
                        vertical: getVerticalSize(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "OrderID: 200113239",
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText(
                              fontSize: 12,
                              text: "Date: 14 Feb 2023",
                              fontWeight: FontWeight.w500,
                            ),
                            AppText(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              text: "Total: ₹4130",
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomAssetsImage(
                    height: Get.height * 0.15,
                    imagePath: "assets/image/bgg2.png",
                  ),
                  AppText(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    text: "Tecla - Black Gold (Medium)",
                  ),
                  height5,
                  CustomElevatedButtons(
                      isBorder: true,
                      buttoncolor: AppColor.orangeColor,
                      height: Get.height * 0.040,
                      width: Get.width * 0.50,
                      textcolor: AppColor.whiteColor,
                      textButton: "View Details",
                      ontap: () {
                        // Get.toNamed(Routes.MAINPAGE);
                        // Get.to(const Signin(),
                        //     transition: Transition.zoom);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
