import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeDrawer.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';

class HomePage extends GetView<HomepageController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // floatingActionButton: CircularFavMenu(),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageSlider(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.getOurCollection();
                      },
                      child: AppText(
                        text: "Discover All",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    height10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GlassCategory(
                          ontap: () => Get.toNamed(Routes.CATEGORYBYGENDERPAGE,
                              arguments: {
                                "type": "Shop Eyeglasses",
                                "id": "1"
                              }),
                          image: "assets/image/eyeglass.png",
                          title: "Shop Eyeglasses",
                        ),
                        GlassCategory(
                          ontap: () => Get.toNamed(Routes.CATEGORYBYGENDERPAGE,
                              arguments: {
                                "type": "Shop Sunglasses",
                                "id": "2"
                              }),
                          image: "assets/image/sunglass2.png",
                          title: "Shop Sunglasses",
                        )
                      ],
                    ),
                    // getheight(context, 0.040),
                    // AppText(
                    //   text: "What's New",
                    //   fontSize: 18.sp,
                    //   fontWeight: FontWeight.w700,
                    // ),
                    // height5,
                    // AppText(
                    //   text:
                    //       "Fall in love at first sight with rich hues and bolder than ever silhouettes this autumn",
                    //   fontSize: 13.sp,
                    //   fontWeight: FontWeight.w400,
                    //   color: AppColor.greyColor,
                    // ),
                    // BannerAd(),
                    getheight(context, 0.030),
                    AppText(
                      text: "Our Recommendation",
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: AppColor.orangeColor,
                                value: "New Launches",
                                groupValue: controller.selected.value,
                                onChanged: (v) async {
                                  controller.selected.value = v!;
                                  controller.selected.value == true;
                                  controller.getOurRecommendation("");
                                }),
                            AppText(
                              color: AppColor.blackColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              text: "New Launches",
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Radio(
                                activeColor: AppColor.orangeColor,
                                value: "Best Seller",
                                groupValue: controller.selected.value,
                                onChanged: (v) async {
                                  controller.selected.value = v!;
                                  await controller.getOurRecommendation("1");
                                }),
                            AppText(
                              color: AppColor.blackColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              text: "Best Seller",
                            )
                          ],
                        )

                        // filterCategory("New Launches", (bool v) {
                        //   controller.IsNewLaunches.value = v;
                        //   print(controller.IsNewLaunches.value);
                        // }),
                        // filterCategory("Best Seller", (bool v) {
                        //   controller.IsNewLaunches.value = v;
                        //   print(controller.IsBestSeller.value);
                        // }),
                      ],
                    ),
                  ],
                ),
              ),
              getheight(context, 0.015),
              GogleSlider(),
              getheight(context, 0.015),
              GogleVariousCategory(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () async {
                    await controller.getDifferntTypeProduct();
                  },
                  child: AppText(
                    text: "Shop Our Collections",
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ShopOurCollectionWidget(),
            ],
          ),
        ),
      ),
    );
  }

  filterCategory(
    String title,
    Function ontap,
  ) {
    return Row(
      children: [
        Radio(
            activeColor: AppColor.orangeColor,
            value: buttonValue.BestSeller,
            groupValue: buttonValue,
            onChanged: (v) {
              ontap(v);
            }),
        AppText(
          color: AppColor.blackColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          text: title,
        )
      ],
    );
  }
}
