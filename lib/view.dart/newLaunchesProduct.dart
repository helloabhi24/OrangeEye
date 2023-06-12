import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';
import '../controller.dart/catByGenderController.dart';
import '../controller.dart/homeController.dart';
import '../routes/approutes.dart';
import '../utils/appColor.dart';
import '../utils/cachedNetworkImage.dart';
import '../utils/customeAppBar.dart';
import '../utils/sizeHelper.dart';
import '../widgets/productDetailPage.dart';

class NewLaunchesProduct extends GetView<HomepageController> {
  String? glassName;
  NewLaunchesProduct({this.glassName = "", super.key});

  @override
  Widget build(BuildContext context) {
    CategoryByGenderController categoryByGenderController = Get.find();
    return Obx(
      () => Scaffold(
          appBar: CustomAppbar.customeAppbar(
              title: glassName!, color: AppColor.blackColor),
          body: controller.finalHomepageProductList!.length == 0
              ? Center(
                  child: AppText(
                    text: "No Product Found !",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                )
              : GridView.builder(
                  itemCount: controller.finalHomepageProductList!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: Get.height * 0.28,
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return GogleWidget(
                      index: index,
                    );
                  },
                )
          // ListView.builder(
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       return GogleWidget(
          //         index: index,
          //       );
          //     },
          //     itemCount:
          //         categoryByGenderController.allProductByGenderList.length)
          ),
    );
  }
}
