import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/view.dart/otherProductModel.dart';
import 'package:orangeeye/widgets/productDetailPage.dart';
import '../routes/approutes.dart';
import '../utils/cachedNetworkImage.dart';

class HomePageSlider extends StatelessWidget {
  const HomePageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.find();
    return Obx((() => Padding(
          padding: EdgeInsets.only(top: getVerticalSize(2)),
          child: SizedBox(
              height: Get.height * 0.35,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      homepageController.homePageSliderList!.isEmpty
                          ? SizedBox(
                              // height: Get.height * 0.20,
                              width: getHorizontalSize(5414),
                              child: const Center(
                                child: AppText(
                                  text: "Fetching Banner......",
                                ),
                              ),
                            )
                          : CarouselSlider(
                              items: homepageController.homePageSliderList!
                                  .map((element) => CachedNetworkImage(
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: getHorizontalSize(4000),
                                          // height: Get.height * 0.20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.fitWidth),
                                          ),
                                        ),
                                        imageUrl:
                                            "https://orangeeyewearindia.com/public/uploads/${element.image.toString()}",
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                height: homepageController
                                        .homePageSliderList!.isEmpty
                                    ? 0
                                    : Get.height * 0.29,
                                aspectRatio: 16 / 9,
                                viewportFraction: 1.6,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
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
                      getheight(context, 0.030),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...Iterable.generate(
                                  homepageController.homePageSliderList!.length)
                              .map((e) => Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Container(
                                    height: 5,
                                    width:
                                        homepageController.sliderIndex.value ==
                                                e
                                            ? 16
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
                ],
              )),
        )));
  }
}

fileSelectedWidget(context) {
  HomepageController homepageController = Get.find();
  return Obx(
    () => Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.08,
              width: Get.width,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: AppColor.greyColor.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.whiteColor),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      homepageController.getImage(ImageSource.gallery);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.08,
                      width: Get.width * 0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.greyColor.withOpacity(0.4)),
                      child: AppText(
                        text: "ChooseFile",
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  getWidth(context, 0.030),
                  SizedBox(
                    width: Get.width * 0.60,
                    child: AppText(
                      overFlow: TextOverflow.ellipsis,
                      text: homepageController.pathName.value.isEmpty
                          ? "No file selected"
                          : homepageController.pathName.value,
                    ),
                  )
                ],
              ),
            ),
            getheight(context, 0.010),
            Container(
              alignment: Alignment.center,
              height: Get.height * 0.20,
              width: Get.width * 0.93,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.greyColor),
                borderRadius: BorderRadius.circular(10),
                // color: AppColor.redColor,
              ),
              child: homepageController.selectedImagePath.value.isEmpty
                  ? AppText(
                      text: "No prescription Image",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    )
                  : Image.file(
                      File(homepageController.selectedImagePath.value),
                      fit: BoxFit.cover,
                      width: Get.width,
                    ),
            ),
            // getheight(context, 0.010),
            // AppText(
            //   text:
            //       "Please Uploaded prescription image with PD (Pupillary Distance)",
            //   color: AppColor.redColor,
            //   fontSize: 13,
            // ),
            // getheight(context, 0.007),
            // AppText(
            //   text: "SPACTALE FRAME WITH PRESCRIPTION",
            //   color: AppColor.blackColor,
            //   fontWeight: FontWeight.w600,
            //   fontSize: 13,
            // ),
            // getheight(context, 0.007),
            // AppText(
            //   text: "LENSES AND ZERO POWER LENSES",
            //   color: AppColor.blackColor,
            //   fontSize: 13,
            //   fontWeight: FontWeight.w600,
            // ),
            // getheight(context, 0.007),
            // AppText(
            //   text: "INSATLLED ARE FINAL SALE",
            //   color: AppColor.blackColor,
            //   fontSize: 13,
            //   fontWeight: FontWeight.w600,
            // ),
            // getheight(context, 0.010),
          ],
        )),
  );
}

// class CircularFavMenu extends StatelessWidget {
//   CircularFavMenu({super.key});
//   GlobalKey<CircularMenuState> key = GlobalKey<CircularMenuState>();
//   @override
//   Widget build(BuildContext context) {
//     return CircularMenu(
//       toggleButtonColor: AppColor.orangeColor,
//       toggleButtonSize: 30,
//       alignment: Alignment.bottomRight,
//       startingAngleInRadian: 1.10 * pi,
//       endingAngleInRadian: 1.50 * pi,
//       key: key,
//       items: [
//         CircularMenuItem(
//           icon: Icons.whatshot,
//           onTap: () {},
//           color: Colors.green,
//           iconColor: Colors.white,
//         ),
//         CircularMenuItem(
//           icon: Icons.call,
//           onTap: () {},
//           color: Colors.orange,
//           iconColor: Colors.white,
//         ),
//         CircularMenuItem(
//           icon: Icons.settings,
//           onTap: () {},
//           color: Colors.deepPurple,
//           iconColor: Colors.white,
//         ),
//       ],
//     );
//   }
// }

class GlassCategory extends StatelessWidget {
  final String title;
  final String image;
  final Function? ontap;
  const GlassCategory(
      {this.ontap, this.image = "", this.title = "", super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ontap!();
          },
          child: Container(
            height: 160.h,
            width: 164.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image)),
              borderRadius: BorderRadius.circular(10),
              color: AppColor.whiteColor,
              border: Border.all(color: AppColor.whiteColor),
            ),
          ),
        ),
        height8,
        AppText(
          color: AppColor.blackColor,
          text: title,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }
}

class BannerAd extends StatelessWidget {
  const BannerAd({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.find();
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

class GogleSlider extends StatelessWidget {
  GogleSlider({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.find();
    print("all profduct length");
    print(homepageController.allProduct.length);
    return Obx(
      () => SizedBox(
          height: 199.h,
          width: Get.width,
          child: homepageController.isLoading.value == true
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GogleWidget(
                      index: index,
                    );
                  },
                  itemCount:
                      homepageController.finalHomepageProductList!.length,
                )),
    );
  }
}

class GogleWidget extends StatelessWidget {
  final int? index;
  GogleWidget({this.index, super.key});

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
                  border: Border.all(color: AppColor.greyColor, width: 0.3)),
              // height: 172.h,
              width: 150.w,
              child: Stack(
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.17,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (cnt, index1) {
                            return Container(
                              margin: EdgeInsets.only(top: getVerticalSize(40)),
                              height: Get.height * 0.18,
                              color: AppColor.whiteColor,
                              child: cacheNetworkImage(
                                  imageUrl:
                                      "https://orangeeyewearindia.com/public/uploads/products/${homepageController.finalHomepageProductList![index!].images![index1]}",
                                  height: Get.height * 0.20,
                                  boxfit: BoxFit.cover,
                                  width: Get.width * 0.37,
                                  memCacheHeight: 220,
                                  ontap: () async {
                                    // Get.toNamed("/mainpage");
                                  }),
                            );
                          },
                          itemCount: homepageController
                              .finalHomepageProductList![index!].images!.length,
                          shrinkWrap: true,
                        ),
                      ),

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
                                        .finalHomepageProductList![index!]
                                        .name!),
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            homepageController.finalHomepageProductList![index!]
                                        .colorCode ==
                                    null
                                ? SizedBox()
                                : ColorDots(
                                    borderColor: AppColor.greyColor,
                                    dotsColor: Color(int.parse(
                                        "0xff${homepageController.finalHomepageProductList![index!].colorCode!.replaceFirst(r'#', "")}")),
                                  ),
                            SizedBox(
                              height: Get.height * 0.05,
                              // width: Get.width * 0.20,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index2) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(10)),
                                    child: ColorDots(
                                      borderColor: AppColor.greyColor,
                                      dotsColor: Color(int.parse(
                                          "0xff${homepageController.finalHomepageProductList![index!].productAttributes![index2].colorCode!.replaceFirst(r'#', "")}")),
                                    ),
                                  );
                                },
                                itemCount: homepageController
                                    .finalHomepageProductList![index!]
                                    .productAttributes!
                                    .length,
                                shrinkWrap: true,
                              ),
                            ),
                          ],
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
                              Get.toNamed(
                                Routes.OTPPHONENUMBERPAGE,
                              );
                              // Get.to(LoginScreen());
                              // loginDialouge(context);
                            } else {
                              if (homepageController.likeUpdatedList.contains(
                                  homepageController
                                      .finalHomepageProductList![index!].id)) {
                                homepageController.likeUpdatedList.remove(
                                    homepageController
                                        .finalHomepageProductList![index!].id);
                                await homepageController.updatedWhislist(
                                  homepageController
                                      .finalHomepageProductList![index!].id
                                      .toString(),
                                );
                              } else {
                                homepageController.likeUpdatedList.add(
                                    homepageController
                                        .finalHomepageProductList![index!].id);
                                await homepageController.updatedWhislist(
                                  homepageController
                                      .finalHomepageProductList![index!].id
                                      .toString(),
                                );
                              }

                              // homepageController.isSelected.value =
                              //     homepageController
                              //         .finalHomepageProductList![index!].id
                              //         .toString();
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
                              // homepageController
                              //                 .finalHomepageProductList![index!]
                              //                 .wishlist ==
                              //             true ||
                              //         homepageController.isSelected.value ==
                              //             homepageController
                              //                 .finalHomepageProductList![index!]
                              //                 .id
                              //                 .toString()
                              homepageController.likeUpdatedList.contains(
                                          homepageController
                                              .finalHomepageProductList![index!]
                                              .id) ||
                                      homepageController
                                              .finalHomepageProductList![index!]
                                              .wishlist ==
                                          true
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

// class GogleWidgetGenderWise extends StatelessWidget {
//   final int? index;
//   GogleWidgetGenderWise({this.index, super.key});

//   @override
//   Widget build(BuildContext context) {
//     CategoryByGenderController categoryByGenderController =
//         Get.find<CategoryByGenderController>();
//     return Obx(
//       () => Padding(
//         padding: const EdgeInsets.all(4.0),
//         child: GestureDetector(
//             onTap: () => Get.to(ProductDetailScreen()), child: GogleWidget()

//             //  Container(
//             //     decoration: BoxDecoration(
//             //         borderRadius: BorderRadius.circular(10),
//             //         border: Border.all(color: AppColor.greyColor, width: 0.4)),
//             //     height: 170.h,
//             //     width: 150.w,
//             //     child: Stack(
//             //       children: [
//             //         Column(
//             //           crossAxisAlignment: CrossAxisAlignment.start,
//             //           children: [
//             //             cacheNetworkImage(
//             //                 imageUrl:
//             //                     "https://orangeeye.skardtech.com/public/uploads/products/${categoryByGenderController.allProductByGenderList[index!]["image1"]}",
//             //                 height: Get.height * 0.13,
//             //                 boxfit: BoxFit.cover,
//             //                 width: Get.width * 0.43,
//             //                 ontap: () async {
//             //                   // Get.toNamed("/mainpage");
//             //                 }),
//             //             // Container(
//             //             //   height: Get.height * 0.10,
//             //             //   width: Get.width * 0.30,
//             //             //   child: Image.network(
//             //             //     "https://orangeeye.atally.com/public/uploads/products/${homepageController.allProduct[index!]["image1"]}",
//             //             //     fit: BoxFit.cover,
//             //             //   ),
//             //             // ),
//             //             // CustomAssetsImage(
//             //             //   height: 130.h,
//             //             //   width: 135.w,
//             //             //   imagePath: homepageController.gogleList[index!],
//             //             // ),
//             //             Row(
//             //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //               children: [
//             //                 Column(
//             //                   crossAxisAlignment: CrossAxisAlignment.start,
//             //                   children: [
//             //                     Padding(
//             //                       padding: EdgeInsets.only(
//             //                           left: getHorizontalSize(10)),
//             //                       child: AppText(
//             //                           fontSize: 13.sp,
//             //                           fontWeight: FontWeight.w600,
//             //                           text: categoryByGenderController
//             //                                   .allProductByGenderList[index!]
//             //                               ["name"]),
//             //                     ),
//             //                     Padding(
//             //                         padding: EdgeInsets.only(
//             //                             left: getHorizontalSize(10)),
//             //                         child: Row(
//             //                           children: [
//             //                             AppText(
//             //                                 textDecoration:
//             //                                     TextDecoration.lineThrough,
//             //                                 fontSize: 12.sp,
//             //                                 text:
//             //                                     "₹ ${categoryByGenderController.allProductByGenderList[index!]["mrp"].toString()}"),
//             //                             getWidth(context, 0.020),
//             //                             AppText(
//             //                                 fontSize: 12.sp,
//             //                                 text:
//             //                                     "₹ ${categoryByGenderController.allProductByGenderList[index!]["price"].toString()}"),
//             //                           ],
//             //                         )),
//             //                   ],
//             //                 ),
//             //                 // Row(
//             //                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                 //   children: [
//             //                 //     Row(
//             //                 //       children: const [
//             //                 //         ColorDots(
//             //                 //           dotsColor: AppColor.blackColor,
//             //                 //         ),
//             //                 //         width3,
//             //                 //         ColorDots(
//             //                 //           dotsColor: AppColor.redColor,
//             //                 //         ),
//             //                 //         width3,
//             //                 //         ColorDots(
//             //                 //           dotsColor: AppColor.brownColor,
//             //                 //         ),
//             //                 //         width3,
//             //                 //         ColorDots(
//             //                 //           dotsColor: AppColor.orangeColor,
//             //                 //         ),
//             //                 //         width3,
//             //                 //       ],
//             //                 //     ),
//             //                 //   ],
//             //                 // )
//             //               ],
//             //             ),
//             //             getheight(context, 0.010),
//             //             Row(
//             //               mainAxisAlignment: MainAxisAlignment.center,
//             //               children: [
//             //                 Row(
//             //                   children: [
//             //                     ColorDots(
//             //                       dotsColor: AppColor.blackColor,
//             //                     ),
//             //                     getWidth(context, 0.020),
//             //                     ColorDots(
//             //                       dotsColor: AppColor.redColor,
//             //                     ),
//             //                     getWidth(context, 0.020),
//             //                     ColorDots(
//             //                       dotsColor: AppColor.brownColor,
//             //                     ),
//             //                     getWidth(context, 0.020),
//             //                     ColorDots(
//             //                       dotsColor: AppColor.orangeColor,
//             //                     ),
//             //                     getWidth(context, 0.020),
//             //                   ],
//             //                 ),
//             //               ],
//             //             )
//             //           ],
//             //         ),
//             //         const Padding(
//             //           padding: EdgeInsets.all(8.0),
//             //           child: Align(
//             //               alignment: Alignment.topRight,
//             //               child: Icon(
//             //                 Icons.favorite_border,
//             //                 color: AppColor.orangeColor,
//             //               )),
//             //         ),
//             //       ],
//             //     )),
//             ),
//       ),
//     );
//   }
// }

class GogleVariousCategory extends StatelessWidget {
  const GogleVariousCategory({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.find();
    return Obx(
      () => SizedBox(
        height: 177.h,
        width: Get.width,
        child: homepageController.getDifferentTypeProduct.isEmpty
            ? RepaintBoundary(child: Center(child: CircularProgressIndicator()))
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: Get.height * 0.13,
                    width: Get.width * 0.44,
                    child: Column(
                      children: [
                        cacheNetworkImage(
                            imageUrl:
                                "https://orangeeyewearindia.com/public/uploads/frameshapes/${homepageController.getDifferentTypeProduct[index].image}",
                            height: Get.height * 0.13,
                            boxfit: BoxFit.cover,
                            width: Get.width * 0.43,
                            ontap: () async {
                              await homepageController.getAllData("1");
                              Get.to(OtherProductShapePage(), arguments: {
                                "title": homepageController
                                    .getDifferentTypeProduct[index].name
                              });
                            },
                            memCacheHeight: 350),
                        AppText(
                          text: homepageController
                              .getDifferentTypeProduct[index].name,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  );
                },
                itemCount: homepageController.getDifferentTypeProduct.length),
      ),
    );
  }
}

class ShopOurCollectionWidget extends StatelessWidget {
  const ShopOurCollectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.find();
    return Obx(
      () => SizedBox(
        height: 200.h,
        width: Get.width,
        child: homepageController.shopOurCollectionList.isEmpty
            ? Container(
                height: Get.height * 0.20,
                child: Center(
                  child: AppText(
                    text: "Coming Soon Our Top Collection !",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ))
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColor.greyColor.withOpacity(0.2))),
                      height: Get.height * 0.20,
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
                              child: cacheNetworkImage(
                                  imageUrl:
                                      "https://orangeeyewearindia.com/public/uploads/products/${homepageController.shopOurCollectionList[index].frameProduct!.image1}",
                                  height: Get.height * 0.13,
                                  boxfit: BoxFit.cover,
                                  width: Get.width * 0.43,
                                  memCacheHeight: 150,
                                  ontap: () async {
                                    // Get.toNamed("/mainpage");
                                  }),
                              // sCustomAssetsImage(
                              //   boxFit: BoxFit.cover,
                              //   imagePath: homepageController.gogleList[index],
                              // ),
                            ),
                          ),
                          getheight(context, 0.013),
                          AppText(
                            textAlign: TextAlign.center,
                            text: homepageController
                                .shopOurCollectionList[index].name!,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: homepageController.shopOurCollectionList.length,
              ),
      ),
    );
  }
}
