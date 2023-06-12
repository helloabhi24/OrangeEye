import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/whishlistController.dart';
import 'package:orangeeye/widgets/productDetailPage.dart';

import '../routes/approutes.dart';
import '../utils/appColor.dart';
import '../utils/appText.dart';
import '../utils/sizeHelper.dart';

class WishlistWidget extends GetView<WishlistPageController> {
  final int index;
  const WishlistWidget({required this.index, super.key});
  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(10), vertical: getVerticalSize(5)),
      child: GestureDetector(
        onTap: () async {
          await homepageController.getProductDetail(
              controller.whistList[index]["product"][0]["slug"]!);
          Get.toNamed(Routes.PRODUCTDESCRIPTIONPAGE);
        },
        child: Container(
          height: Get.height * 0.39,
          width: Get.width,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.greyColor.withOpacity(0.01)),
              borderRadius: BorderRadius.circular(10),
              color: AppColor.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    children: [
                      controller
                              .whistList[index]["product"][0]
                                  ["product_attributes"]
                              .isEmpty
                          ? Container(
                              alignment: Alignment.center,
                              height: Get.height * 0.30,
                              width: Get.width * 0.90,
                              child: AppText(
                                text: "No products!",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Obx(
                              () => SizedBox(
                                height: Get.height * 0.30,
                                width: Get.width * 0.90,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index1) {
                                    // print("length of product attributes");
                                    // print(controller
                                    //     .whislistProductList![index]
                                    //     .product![0]
                                    //     .productAttributes![index1]
                                    //     .colorName);
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.24,
                                          width: Get.width * 0.90,
                                          child: CarouselSlider(
                                              items: (controller.whistList[
                                                                      index]
                                                                  ["product"]
                                                              [0]
                                                          ["product_attributes"]
                                                      [
                                                      index1]["images"] as List)
                                                  .map((element) =>
                                                      CachedNetworkImage(
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          height:
                                                              Get.height * 0.60,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            image: DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .contain),
                                                          ),
                                                        ),
                                                        imageUrl:
                                                            "https://orangeeye.skardtech.com/public/uploads/products/${element}",
                                                        placeholder: (context,
                                                                url) =>
                                                            const Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                                Icons.error),
                                                        memCacheHeight: 300,
                                                      ))
                                                  .toList(),
                                              options: CarouselOptions(
                                                height: Get.height * 0.28,
                                                aspectRatio: 16 / 8,
                                                viewportFraction: 1,
                                                initialPage: 0,
                                                enableInfiniteScroll: true,
                                                reverse: false,
                                                autoPlay: false,
                                                autoPlayInterval:
                                                    const Duration(seconds: 3),
                                                autoPlayAnimationDuration:
                                                    const Duration(
                                                        milliseconds: 800),
                                                autoPlayCurve:
                                                    Curves.fastOutSlowIn,
                                                enlargeFactor: 0.2,
                                                enlargeCenterPage: true,
                                                onPageChanged: (v, c) {
                                                  // controller.dotIndex.value = v;
                                                },
                                                scrollDirection:
                                                    Axis.horizontal,
                                              )),
                                        ),
                                        Obx(
                                          () => Row(
                                            children: [
                                              ...Iterable.generate(
                                                controller
                                                    .whistList[index]["product"]
                                                        [0]
                                                        ["product_attributes"]
                                                    .length,
                                              ).map((e) => Padding(
                                                    padding: EdgeInsets.only(
                                                        right:
                                                            getHorizontalSize(
                                                                15)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // index1 = e;
                                                        controller
                                                            .frameChangeIndex
                                                            .value = e;
                                                        print(controller
                                                            .frameChangeIndex
                                                            .value);
                                                      },
                                                      child: ColorDots(
                                                        borderColor:
                                                            AppColor.greyColor,
                                                        dotsColor: Color(int.parse(
                                                            "0xff${controller.whistList[index]["product"][0]["product_attributes"][e]["color_code"].replaceFirst(r'#', "")}")),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .whistList[index]["product"][0]
                                          ["product_attributes"]
                                      .length,
                                ),
                              ),
                            )
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        homepageController.updatedWhislist(
                          controller.whistList[index]["product_id"].toString(),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.close),
                      ))
                ],
              ),
              AppText(
                text: controller.whistList[index]["product"][0]["name"],
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              AppText(
                text:
                    "₹ ${controller.whistList[index]["product"]![0]["name"].toString()}",
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              getheight(context, 0.010),
              Divider(
                color: AppColor.greyColor.withOpacity(0.4),
                thickness: 1,
              )
              // CustomElevatedButtons(
              //     isBorder: false,
              //     buttoncolor: AppColor.orangeColor,
              //     height: Get.height * 0.050,
              //     width: Get.width * 0.30,
              //     textcolor: AppColor.whiteColor,
              //     textButton: "Add to cart",
              //     ontap: () {
              //       Get.to(SelectPrescriptionPage(
              //         index: index,
              //       ));
              //       // controller.getWishlistProduct();
              //       // Get.toNamed(Routes.SELECTPRESCRIPTIONPAGE,
              //       //     arguments: {"detailPage": index});
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
