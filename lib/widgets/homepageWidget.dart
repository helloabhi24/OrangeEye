import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/view.dart/productDetailPage.dart';
import 'package:orangeeye/widgets/productDetailPage.dart';
import '../utils/customeAssetsImage.dart';

class HomePageSlider extends StatelessWidget {
  HomePageSlider({super.key});
  HomepageController homepageController = Get.put(HomepageController());
  @override
  Widget build(BuildContext context) {
    return Obx((() => Padding(
          padding: EdgeInsets.only(top: getVerticalSize(2)),
          child: SizedBox(
              height: Get.height * 0.60,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                          color: AppColor.whiteColor,
                          height: getVerticalSize(510),
                          width: Get.width,
                          child: homepageController.sliderIndex.value ==
                                  homepageController.sliderIndex.value
                              ? CustomAssetsImage(
                                  boxFit: BoxFit.cover,
                                  imagePath:
                                      homepageController.backgroudSliderList[
                                          homepageController.sliderIndex.value])
                              : null),
                      getheight(context, 0.030),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...Iterable.generate(
                                  homepageController.sliderList.length)
                              .map((e) => Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Container(
                                    height: 6,
                                    width:
                                        homepageController.sliderIndex.value ==
                                                e
                                            ? 15
                                            : 8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: homepageController
                                                    .sliderIndex.value ==
                                                e
                                            ? AppColor.orangeColor
                                            : AppColor.greyColor),
                                  )))
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CarouselSlider(
                          items: homepageController.sliderList,
                          options: CarouselOptions(
                            height: Get.height * 0.50,
                            aspectRatio: 16 / 8,
                            viewportFraction: 0.7,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeFactor: 0.2,
                            enlargeCenterPage: true,
                            onPageChanged: (v, c) {
                              homepageController.sliderIndex.value = v;
                            },
                            scrollDirection: Axis.horizontal,
                          )),
                    ],
                  )
                ],
              )),
        )));
  }
}

class GlassCategory extends StatelessWidget {
  final String title;
  final String image;
  const GlassCategory({this.image = "", this.title = "", super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160.h,
          width: 164.w,
          decoration: BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
              borderRadius: BorderRadius.circular(4),
              color: AppColor.orangeColor),
        ),
        height5,
        AppText(
          color: AppColor.blackColor,
          text: title,
          fontSize: 18,
        )
      ],
    );
  }
}

class BannerAd extends StatelessWidget {
  BannerAd({super.key});
  HomepageController homepageController = Get.put(HomepageController());
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: homepageController.sliderList2,
        options: CarouselOptions(
          height: Get.height * 0.40,
          aspectRatio: 16 / 8,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeFactor: 0.2,
          enlargeCenterPage: true,
          onPageChanged: (v, c) {
            homepageController.sliderIndex.value = v;
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}

filterCategory(String title) {
  return Row(
    children: [
      Radio(
          activeColor: AppColor.orangeColor,
          value: true,
          groupValue: true,
          onChanged: (v) {}),
      TextButton(
          onPressed: () {},
          child: AppText(
            color: AppColor.blackColor,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            text: title,
          ))
    ],
  );
}

class GogleSlider extends StatelessWidget {
  GogleSlider({super.key});
  HomepageController homepageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 177.h,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GogleWidget(
            index: index,
          );
        },
        itemCount: homepageController.gogleList.length,
      ),
    );
  }
}

class GogleWidget extends StatelessWidget {
  final int? index;
  GogleWidget({this.index, super.key});
  HomepageController homepageController = Get.find<HomepageController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () => Get.to(ProductDetailScreen()),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.greyColor, width: 0.4)),
            height: 160.h,
            width: 150.w,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAssetsImage(
                      height: 130.h,
                      width: 135.w,
                      imagePath: homepageController.gogleList[index!],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: getHorizontalSize(10)),
                              child: const AppText(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                text: "Tecla",
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: getHorizontalSize(10)),
                              child: const AppText(
                                fontSize: 13,
                                text: "₹4000",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                ColorDots(
                                  dotsColor: AppColor.blackColor,
                                ),
                                width5,
                                ColorDots(
                                  dotsColor: AppColor.redColor,
                                ),
                                width5,
                                ColorDots(
                                  dotsColor: AppColor.brownColor,
                                ),
                                width5,
                                ColorDots(
                                  dotsColor: AppColor.orangeColor,
                                ),
                                width5,
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.favorite_border,
                        color: AppColor.orangeColor,
                      )),
                ),
              ],
            )),
      ),
    );
  }
}

class GogleVariousCategory extends StatelessWidget {
  GogleVariousCategory({super.key});
  HomepageController homepageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 177.h,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.greyColor.withOpacity(0.3),
                    radius: 55,
                    child: CustomAssetsImage(
                      imagePath: homepageController.gogleList[index],
                    ),
                  ),
                  const AppText(
                    text: "Transparents",
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ));
        },
        itemCount: homepageController.gogleList.length,
      ),
    );
  }
}

class ShopOurCollectionWidget extends StatelessWidget {
  ShopOurCollectionWidget({super.key});
  HomepageController homepageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.greyColor)),
              height: Get.height * 0.24,
              width: Get.width * 0.45,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // height: Get.height * 0.22,
                      // width: Get.width * 0.40,
                      child: CustomAssetsImage(
                        boxFit: BoxFit.cover,
                        imagePath: homepageController.gogleList[index],
                      ),
                    ),
                  ),
                  const AppText(
                    text: "Rich Acetate",
                  )
                ],
              ),
            ),
          );
        },
        itemCount: homepageController.gogleList.length,
      ),
    );
  }
}
