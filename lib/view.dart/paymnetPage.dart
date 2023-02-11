import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

import '../utils/customeElevatedButton.dart';
import '../widgets/cartPageWidget.dart';

class PaymentPage extends GetView<AddNewAddressController> {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.customeAppbar(
          title: "Checkout", color: AppColor.blackColor),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getHorizontalSize(10), vertical: getVerticalSize(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Payment Options",
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              AppText(
                text: "All transctions are secure and encrypted",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.greyColor,
              ),
              getheight(context, 0.04),
              Container(
                color: AppColor.blueColor.withOpacity(0.05),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Radio(
                              value: true, groupValue: true, onChanged: (v) {}),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * 0.70,
                                child: AppText(
                                  text:
                                      "Credit Cards / Debit Cards / Net Banking",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.78,
                                child: AppText(
                                  text:
                                      "Your money is secure! if for some reason your order does not get delivered, you get full refunded",
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.blackColor.withOpacity(0.5),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      height15,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Radio(
                              value: true, groupValue: true, onChanged: (v) {}),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * 0.70,
                                child: AppText(
                                  text: "Cash On Delivery",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.78,
                                child: AppText(
                                  text:
                                      "We recommended paying online for contactless delivery",
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.blackColor.withOpacity(0.5),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: AppColor.greyColor.withOpacity(0.3),
              ),
              getheight(context, 0.010),
              AppText(
                  text: "Delivering To ",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor),
              getheight(context, 0.007),
              AppText(
                  text: "abdul",
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor),
              getheight(context, 0.007),
              AppText(
                  text: "Sector 24, sector 24, noida - 201301",
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor),
              getheight(context, 0.007),
              AppText(
                  text: "+914085620556",
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor),
              getheight(context, 0.007),
              Divider(
                thickness: 1,
                color: AppColor.greyColor.withOpacity(0.3),
              ),
              ProductPaymentDetails(),
              getheight(context, 0.020),
              CustomElevatedButtons(
                  isBorder: false,
                  buttoncolor: AppColor.orangeColor,
                  height: Get.height * 0.060,
                  width: Get.width,
                  textcolor: AppColor.whiteColor,
                  textButton: "Place your order",
                  ontap: () {
                    // Get.toNamed(Routes.MAINPAGE);
                    // Get.to(const Signin(),
                    //     transition: Transition.zoom);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
