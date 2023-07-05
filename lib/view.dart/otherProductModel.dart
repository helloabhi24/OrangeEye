import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';

import '../routes/approutes.dart';
import '../utils/appColor.dart';
import '../utils/appText.dart';
import '../utils/cachedNetworkImage.dart';

import '../utils/sizeHelper.dart';
import '../widgets/productDetailPage.dart';
import 'authenticationPage/inputMobileNumberPage.dart';

class OtherProductShapePage extends GetView<HomepageController> {
  const OtherProductShapePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.orangeColor,
            centerTitle: true,
            title: AppText(
              text: Get.arguments["title"],
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: SizedBox(
              height: Get.height * 0.80,
              child: controller.productShapeList!.isEmpty
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: Get.height * 0.28,
                          childAspectRatio: 1,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 0),
                      itemCount: controller.productShapeList!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return OtherProductWidget(
                          index: index,
                        );
                      }))),
    );
  }
}

class OtherProductWidget extends StatelessWidget {
  final int? index;
  OtherProductWidget({this.index, super.key});

  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.find<HomepageController>();

    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () async {
            await homepageController.getProductDetail(
                homepageController.finalHomepageProductList![index!].slug!);
            Get.toNamed(Routes.PRODUCTDESCRIPTIONPAGE);
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.greyColor, width: 0.4)),
              // height: 172.h,
              width: 150.w,
              child: Stack(
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (cnt, index1) {
                            return Container(
                              margin: EdgeInsets.only(top: getVerticalSize(40)),
                              height: Get.height * 0.10,
                              color: AppColor.whiteColor,
                              child: cacheNetworkImage(
                                  imageUrl:
                                      "https://orangeeyewearindia.com/public/uploads/products/${homepageController.productShapeList![index!].images![index1]}",
                                  height: Get.height * 0.13,
                                  boxfit: BoxFit.cover,
                                  width: Get.width * 0.43,
                                  memCacheHeight: 200,
                                  ontap: () async {
                                    // Get.toNamed("/mainpage");
                                  }),
                            );
                          },
                          itemCount: homepageController
                              .productShapeList![index!].images!.length,
                          shrinkWrap: true,
                        ),
                      ),

                      // Container(
                      //   height: Get.height * 0.10,
                      //   width: Get.width * 0.30,
                      //   child: Image.network(
                      //     "https://orangeeye.atally.com/public/uploads/products/${homepageController.allProduct[index!]["image1"]}",
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      // CustomAssetsImage(
                      //   height: 130.h,
                      //   width: 135.w,
                      //   imagePath: homepageController.gogleList[index!],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: getHorizontalSize(10)),
                                child: AppText(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    text: homepageController
                                        .productShapeList![index!].name!),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: getHorizontalSize(10)),
                                  child: Row(
                                    children: [
                                      AppText(
                                          textDecoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 12.sp,
                                          text:
                                              "₹ ${homepageController.finalHomepageProductList![index!].mrp}"),
                                      getWidth(context, 0.020),
                                      AppText(
                                          fontSize: 12.sp,
                                          text:
                                              "₹ ${homepageController.finalHomepageProductList![index!].price}"),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),

                      // height18,
                      SizedBox(
                        height: Get.height * 0.06,
                        // width: Get.width * 0.20,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index2) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getHorizontalSize(10)),
                              child: ColorDots(
                                dotsColor: Color(int.parse(
                                    "0xff${homepageController.productShapeList![index!].productAttributes![index2].colorCode!.replaceFirst(r'#', "")}")),
                              ),
                            );
                          },
                          itemCount: homepageController
                              .productShapeList![index!]
                              .productAttributes!
                              .length,
                          shrinkWrap: true,
                        ),
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         ...Iterable.generate(homepageController
                      //                 .pageproductColorList.length)
                      //             .map(
                      //           (e) => ColorDots(
                      //             dotsColor: Color(int.parse(
                      //                 "0xff${homepageController.pageproductColorList[e][]["color_code"].replaceFirst(r'#', "")}")),
                      //           ),
                      //         ),
                      //       ],
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () async {
                            if (homepageController
                                .sharedPref.userToken.value.isEmpty) {
                              Get.to(LoginScreen());
                            } else {
                              await homepageController.updatedWhislist(
                                homepageController.productShapeList![index!].id
                                    .toString(),
                              );

                              homepageController.isSelected.value =
                                  homepageController
                                      .productShapeList![index!].id
                                      .toString();
                            }

                            // if (homepageController
                            //         .finalHomepageProductList![index!]
                            //         .wishlist ==
                            //     true) {
                            //   homepageController.isAddWishlist.value = false;
                            // } else {
                            //   homepageController.isAddWishlist.value = true;
                            // }

                            // homepageController.isAddWishlist.value =
                            //     homepageController
                            //         .finalHomepageProductList![index!]
                            //         .wishlist!;
                            // print("bool");
                            // print(homepageController.isAddWishlist.value);

                            // homepageController.isAddWishlist.value =
                            //     !homepageController.isAddWishlist.value;
                          },
                          child: Icon(
                              homepageController.productShapeList![index!]
                                              .wishlist ==
                                          true ||
                                      homepageController.isSelected.value ==
                                          homepageController
                                              .productShapeList![index!].id
                                              .toString()
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: AppColor.orangeColor),
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
