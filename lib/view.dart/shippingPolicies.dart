import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';

class ShippingPoliciesPage extends GetView<MainpageController> {
  const ShippingPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.orangeColor,
          title: AppText(
            text: "Shipping Policies",
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: AppText(
            text: controller.policies.value,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
