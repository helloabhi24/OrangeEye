import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/utils/appText.dart';
import '../controller.dart/catByGenderController.dart';
import '../utils/appColor.dart';
import '../utils/customeAppBar.dart';


class CategoryWiseProductPage extends GetView<CategoryByGenderController> {
  String? glassName;
  CategoryWiseProductPage({this.glassName = "", super.key});
  @override
  Widget build(BuildContext context) {
    CategoryByGenderController categoryByGenderController = Get.find();
    return Obx(
      () => Scaffold(
          appBar: CustomAppbar.customeAppbar(
              title: glassName!, color: AppColor.blackColor),
          body: categoryByGenderController.getallCategoryList.length == 0
              ? Center(
                  child: AppText(
                    text: "No Product Found !",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                )
              : GridView.builder(
                  itemCount:
                      categoryByGenderController.getallCategoryList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: Get.height * 0.28,
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return GogleCategoryWiseWidget(
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
