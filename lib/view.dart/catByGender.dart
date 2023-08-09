import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/catByGenderController.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

import '../controller.dart/homeController.dart';

class CategoryByGenderPage extends GetView<CategoryByGenderController> {
  const CategoryByGenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainpageController mainpageController = Get.find();
    CategoryByGenderController categoryByGenderController = Get.find();

    return Obx(
      () => Scaffold(
        appBar: CustomAppbar.customeAppbar(
            title: controller.nameOfGlass.value == "Sunglasses"
                ? "Sunglasses"
                : "Eyeglasses",
            color: AppColor.blackColor),
        // Get.arguments["type"]
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(10), vertical: getVerticalSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: controller.nameOfGlass.value == "Sunglasses"
                    ? "Sunglasses"
                    : "Eyeglasses",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              height2,
              AppText(
                text: "Popular Categories",
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              getheight(context, 0.020),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...Iterable.generate(
                            mainpageController.getCategoryName.length)
                        .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    categoryByGenderController.getallCategory(
                                        Get.arguments["id"].toString(),
                                        mainpageController.getCategoryName[e].id
                                            .toString());
                                    categoryByGenderController
                                        .whichGlassesDataShow.value = e;
                                    print("THis is value of e");
                                    print(e);
                                    print("THis is value of controller");
                                    print(categoryByGenderController
                                        .whichGlassesDataShow.value);
                                  },
                                  child: CircleAvatar(
                                    radius: 32.h,
                                    backgroundColor: e ==
                                            categoryByGenderController
                                                .whichGlassesDataShow.value
                                        ? AppColor.orangeColor
                                        : AppColor.whiteColor,
                                    child: CircleAvatar(
                                      radius: 30.h,
                                      backgroundImage: NetworkImage(
                                          "https://orangeeyewearindia.com/public/uploads/categories/" +
                                              mainpageController
                                                  .getCategoryName[e].image
                                                  .toString()),
                                    ),
                                  ),
                                ),
                                height10,
                                AppText(
                                  text: mainpageController
                                      .getCategoryName[e].name
                                      .toString(),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            )))
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                    // height: Get.height * 0.60,
                    child: categoryByGenderController.getallCategoryList.isEmpty
                        ? Center(
                            child: AppText(
                              text: "No Data!",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: Get.height * 0.30,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 0),
                            itemCount: categoryByGenderController
                                .getallCategoryList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return GogleCategoryWiseWidget(
                                index: index,
                              );
                            })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
