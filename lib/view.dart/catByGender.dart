import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/catByGenderController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../widgets/homepageWidget.dart';

class CategoryByGenderPage extends GetView<CategoryByGenderController> {
  const CategoryByGenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final HomepageController homepageController = Get.find();
    CategoryByGenderController categoryByGenderController = Get.find();
    return Obx(
      () => Scaffold(
        appBar: CustomAppbar.customeAppbar(
            title: Get.arguments["type"], color: AppColor.blackColor),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(10), vertical: getVerticalSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Eyeglasses",
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
                  children: [
                    ...Iterable.generate(controller.genderImgeList.length)
                        .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.oninit.value = false;
                                    controller.getCategoryAndProduct(
                                        Get.arguments["id"],
                                        controller.genderImgeList[e]["id"]
                                            .toString());
                                  },
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(controller
                                        .genderImgeList[e]["image"]
                                        .toString()),
                                  ),
                                ),
                                height10,
                                AppText(
                                  text: controller.genderImgeList[e]["title"]
                                      .toString(),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            )))
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                    // height: Get.height * 0.60,
                    child: categoryByGenderController
                            .allProductByGenderList.isEmpty
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
                                    mainAxisExtent: Get.height * 0.28,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 0),
                            itemCount: categoryByGenderController
                                .allProductByGenderList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return GogleWidget(
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
