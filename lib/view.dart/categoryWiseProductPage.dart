import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';

import '../controller.dart/catByGenderController.dart';
import '../utils/appColor.dart';
import '../utils/customeAppBar.dart';

class CategoryWiseProductPage extends GetView<CategoryByGenderController> {
  const CategoryWiseProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryByGenderController categoryByGenderController = Get.find();
    return Scaffold(
        appBar: CustomAppbar.customeAppbar(
            title: Get.arguments["type"], color: AppColor.blackColor),
        body: categoryByGenderController.allProductByGenderList.isEmpty
            ? Center(
                child: AppText(
                  text: "No Product Found !",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            : GridView.builder(
                itemCount:
                    categoryByGenderController.allProductByGenderList.length,
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
        );
  }
}
