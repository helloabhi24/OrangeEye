import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/cartPageController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/customeAppBar.dart';

import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/widgets/cartPageWidget.dart';

import '../utils/appColor.dart';
import '../utils/customeElevatedButton.dart';

class CartPage extends GetView<CartpageController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      //     CustomAppbar.customeAppbar(title: "Cart", color: AppColor.blackColor),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getheight(context, 0.010),
            const ProductReturnPolicy(),
            getheight(context, 0.010),
            const Productdesc(),
            getheight(context, 0.010),
            Coupouns(),
            getheight(context, 0.010),
            const ProductPaymentDetails(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: Get.height * 0.07,
        child: BottomAppBar(
          child: Padding(
            padding: EdgeInsets.only(
                left: getHorizontalSize(10),
                right: getHorizontalSize(10),
                top: getVerticalSize(8)),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomElevatedButtons(
                        fontWeight: FontWeight.w600,
                        isBorder: false,
                        buttoncolor: AppColor.orangeColor,
                        height: Get.height * 0.050,
                        width: Get.width * 0.93,
                        textcolor: AppColor.whiteColor,
                        textButton: "Lets Chat",
                        ontap: () {}),
                  ),
                ),
                width8,
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomElevatedButtons(
                        fontWeight: FontWeight.w600,
                        isBorder: false,
                        buttoncolor: AppColor.orangeColor,
                        height: Get.height * 0.050,
                        width: Get.width * 0.93,
                        textcolor: AppColor.whiteColor,
                        textButton: "Checkout",
                        ontap: () {
                          Get.toNamed(Routes.CARTPAGE);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
