import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/categoryPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/widgets/categoryPageWidget.dart';

import '../utils/appText.dart';
import '../utils/sizeHelper.dart';

class CategoryPage extends GetView<CategorypageController> {
  CategoryPage({super.key});
  CategorypageController categorypageController =
      Get.put(CategorypageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [tabbar(), CategoryGridView()],
      ),
    );
  }

  tabbar() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.greyColor, width: 0.4),
          color: AppColor.whiteColor,
        ),
        height: getVerticalSize(45),
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Obx((() => InkWell(
                    onTap: () async {
                      controller.isFilter.value = true;
                      controller.isSortby.value = false;
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: controller.isFilter.value == true
                                      ? AppColor.orangeColor
                                      : AppColor.whiteColor,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              height: getHorizontalSize(5),
                              width: Get.width * 0.52,
                            ),
                            height2,
                            AppText(
                              color: controller.isFilter.value == true
                                  ? AppColor.orangeColor
                                  : AppColor.greyColor,
                              text: "Men",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )),
                  ))),
            ),
            Container(
              height: getVerticalSize(42),
              color: AppColor.greyColor,
              width: getHorizontalSize(0.4),
            ),
            Expanded(
              child: Obx((() => InkWell(
                    onTap: () {
                      controller.isFilter.value = false;
                      controller.isSortby.value = true;
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: controller.isSortby.value == true
                                      ? AppColor.orangeColor
                                      : AppColor.whiteColor,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              height: getHorizontalSize(5),
                              width: Get.width * 0.52,
                            ),
                            height2,
                            AppText(
                              color: controller.isSortby.value == true
                                  ? AppColor.orangeColor
                                  : AppColor.greyColor,
                              text: "Women",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        )),
                  ))),
            ),
          ],
        ));
  }
}
