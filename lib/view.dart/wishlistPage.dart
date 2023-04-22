import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/whishlistController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/widgets/wishlist.dart';

import '../utils/appText.dart';

class WishlistPage extends GetView<WishlistPageController> {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar.customeAppbar(
            title: "Wishlist", color: AppColor.blackColor),
        body: controller.whislistProductList!.isEmpty
            ? AppText(
                text: "Create Wallet",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              )
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return WishlistWidget(index: index);
                },
                itemCount: controller.whislistProductList!.length,
              ));
  }
}
