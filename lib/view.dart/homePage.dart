import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/constant/imageConstantValue.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/customeDrawer.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';

class HomePage extends GetView<HomepageController> {
  const HomePage({super.key});

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
                  const AppText(
                    text: "Discover All",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      GlassCategory(
                        image: "assets/image/model1.png",
                        title: "Shop Eyeglasses",
                      ),
                      GlassCategory(
                        image: "assets/image/model2.png",
                        title: "Shop Sunglasses",
                      )
                    ],
                  ),
                  getheight(context, 0.020),
                  const AppText(
                    text: "What's New",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  height5,
                  const AppText(
                    text:
                        "Fall in love at first sight with rich hues and bolder than ever silhouettes this autumn",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyColor,
                  ),
                  BannerAd(),
                  getheight(context, 0.020),
                  const AppText(
                    text: "Our Recommendation",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: AppText(
                text: "Shop Our Collections",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            ShopOurCollectionWidget()
          ],
        ),
      ),
    );
  }
}
