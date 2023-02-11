import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeDrawer.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/view.dart/catByGender.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';

class HomePage extends GetView<HomepageController> {
  HomePage({super.key});
  HomepageController homepageController = Get.put(HomepageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageSlider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Discover All",
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlassCategory(
                        ontap: () => Get.toNamed(Routes.CATEGORYBYGENDERPAGE,
                            arguments: {"type": "Shop Eyeglasses"}),
                        image: "assets/image/model1.png",
                        title: "Shop Eyeglasses",
                      ),
                      GlassCategory(
                        ontap: () => Get.toNamed(Routes.CATEGORYBYGENDERPAGE,
                            arguments: {"type": "Shop Sunglasses"}),
                        image: "assets/image/model2.png",
                        title: "Shop Sunglasses",
                      )
                    ],
                  ),
                  getheight(context, 0.040),
                  AppText(
                    text: "What's New",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  height5,
                  AppText(
                    text:
                        "Fall in love at first sight with rich hues and bolder than ever silhouettes this autumn",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor,
                  ),
                  BannerAd(),
                  getheight(context, 0.030),
                  AppText(
                    text: "Our Recommendation",
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      filterCategory("New Arrivals"),
                      filterCategory("Best Seller"),
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
              child: AppText(
                text: "Shop Our Collections",
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            ShopOurCollectionWidget()
          ],
        ),
      ),
    );
  }
}
