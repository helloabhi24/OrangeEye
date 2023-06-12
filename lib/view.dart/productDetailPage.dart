// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customToast.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';
import 'package:orangeeye/widgets/productDetailPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../routes/approutes.dart';
import '../utils/customeElevatedButton.dart';
import '../utils/showDialouge.dart';
import 'dart:convert';
import 'dart:io';

class ProductDetailScreen extends GetView<HomepageController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomepageController homepagehomepageController = Get.find();
    print("homepage list lenght ");
    print(homepagehomepageController.imageList.length);
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                height20,
                Stack(
                  children: [
                    Obx(
                      () => SizedBox(
                        height: Get.height * 0.40,
                        width: Get.width,
                        child: controller.productDetailList![0]
                                .productAttributes!.isEmpty
                            ? Center(
                                child: AppText(
                                  text: "No images!",
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : ListView.builder(
                                // scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return controller
                                          .productDetailList![0]
                                          .productAttributes![
                                              controller.colorDotsIndex.value]
                                          .images!
                                          .isEmpty
                                      ? AppText(
                                          text: "No image",
                                        )
                                      : Obx(
                                          () => CarouselSlider(
                                              items: controller
                                                  .productDetailList![0]
                                                  .productAttributes![controller
                                                      .colorDotsIndex.value]
                                                  .images!
                                                  .map((element) =>
                                                      CachedNetworkImage(
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          height:
                                                              Get.height * 0.40,
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
                                                height: Get.height * 0.40,
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
                                                  controller.dotIndex.value = v;
                                                },
                                                scrollDirection:
                                                    Axis.horizontal,
                                              )),
                                        );
                                },
                                itemCount: controller.productDetailList![0]
                                    .productAttributes!.length,
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getHorizontalSize(16),
                          vertical: getVerticalSize(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (() => Navigator.pop(context)),
                            child: CircleAvatar(
                                backgroundColor: Colors.white60,
                                radius: Get.height * 0.022,
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                  color: AppColor.orangeColor,
                                )),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  // print("arun");
                                  // final temp = await getTemporaryDirectory();
                                  // final path = "${temp.path}/image.jpg";
                                  // print(path);
                                  // File(path).writeAsBytesSync(
                                  //     detailProduct![index!]["images"]);
                                  await controller.createDynamicLink(
                                      false, "1");
                                  Share.share('check out my website');
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.white60,
                                    radius: Get.height * 0.022,
                                    child: const Icon(
                                      Icons.share_outlined,
                                      size: 20,
                                      color: AppColor.blackColor,
                                    )
                                    // customIconButtom(
                                    //     () {},
                                    //     Icons.share_outlined,
                                    //     22,
                                    //     homeCategoryColor),
                                    ),
                              ),
                              SizedBox(
                                width: getHorizontalSize(14),
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.white60,
                                  radius: Get.height * 0.022,
                                  child: PopupMenuButton(
                                    position: PopupMenuPosition.under,
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18),
                                          height: 10,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Row(
                                              children: const [
                                                AppText(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColor.blackColor,
                                                  text: "Report",
                                                ),
                                                width5,
                                                Icon(
                                                  Icons.report_outlined,
                                                  color: AppColor.blackColor,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ];
                                    },
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: AppColor.greyColor,
                                      size: 20,
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: Get.height * 0.65,
                        child: Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: Get.height * 0.042,
                                  width: Get.width * 0.18,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.whiteColor),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      AppText(
                                        text: "4.8",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 25,
                                        color: AppColor.greyColor,
                                      ),
                                      // customIconButtom(() {}, Icons.favorite, 10, redColor),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: Get.height * 0.042,
                                  width: Get.width * 0.20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.whiteColor),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Icon(
                                        Icons.favorite_outline,
                                        size: 25,
                                        color: AppColor.greyColor,
                                      ),
                                      Icon(
                                        Icons.share_outlined,
                                        size: 25,
                                        color: AppColor.greyColor,
                                      ),
                                      // customIconButtom(() {}, Icons.favorite, 10, redColor),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),

                height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...Iterable.generate(controller.productDetailList![0]
                                .productAttributes!.isEmpty
                            ? 0
                            : controller.productDetailList![0]
                                .productAttributes![0].images!.length)
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                  radius: getHorizontalSize(4.5),
                                  backgroundColor:
                                      controller.dotIndex.value == e
                                          ? AppColor.orangeColor
                                          : AppColor.greyColor),
                            )),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalSize(15),
                        vertical: getVerticalSize(22)),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.blackColor,
                              text: controller.productDetailList![0].name!),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: getHorizontalSize(10)),
                              child: Icon(
                                Icons.bookmark_add_outlined,
                                size: 30.sp,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              AppText(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackColor,
                                text:
                                    "₹ ${controller.productDetailList![0].mrp.toString()}",
                                textDecoration: TextDecoration.lineThrough,
                              ),
                              width10,
                              AppText(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.blackColor,
                                  text: controller.productDetailList![0].price
                                      .toString()),
                            ],
                          ),
                          AppText(
                            textDecoration: TextDecoration.underline,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColor.greyColor,
                            text: "Bookmark",
                          ),
                        ],
                      ),
                      getheight(context, 0.010),
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: Get.width * 0.28,
                          height: Get.height * 0.04,
                          child: AppText(
                              textAlign: TextAlign.right,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.blackColor,
                              text: "Including Premium Anti Glare Lens"),
                        ),
                      ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         AppText(
                      //           fontSize: 15.sp,
                      //           fontWeight: FontWeight.w600,
                      //           color: AppColor.blackColor,
                      //           text: "Frame shape :",
                      //         ),
                      //         width10,
                      //         AppText(
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w500,
                      //             color: AppColor.blackColor,
                      //             text: controller
                      //                 .productDetailList![0].frameshape!.name!),
                      //       ],
                      //     ),

                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     AppText(
                      //       fontSize: 15.sp,
                      //       fontWeight: FontWeight.w600,
                      //       color: AppColor.blackColor,
                      //       text: "Frame size :",
                      //     ),
                      //     width10,
                      //     AppText(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w500,
                      //         color: AppColor.blackColor,
                      //         text: controller
                      //             .productDetailList![0].frameSize![0].name
                      //             .toString()),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     ...Iterable.generate(
                      //             controller.productDetailList[0].)
                      //         .map(
                      //       (e) => Padding(
                      //         padding: const EdgeInsets.all(4.0),
                      //         child: AppText(
                      //           fontSize: 13.sp,
                      //           fontWeight: FontWeight.w600,
                      //           color: AppColor.blackColor,
                      //           text: "",
                      //           // controller
                      //           //     .productColorList[e].colorName,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      getheight(context, 0.010),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Row(
                              children: [
                                ...Iterable.generate(controller
                                        .productDetailList![0]
                                        .productAttributes!
                                        .length)
                                    .map(
                                  (e) => Padding(
                                    padding: EdgeInsets.only(
                                        right: getHorizontalSize(20)),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.colorDotsIndex.value = e;
                                        print("index");
                                        print(controller.colorDotsIndex.value);

                                        controller.selectColorCode.value =
                                            controller.productDetailList![0]
                                                .productAttributes![e].id
                                                .toString();
                                      },
                                      child: ColorDots(
                                        borderColor:
                                            e == controller.colorDotsIndex.value
                                                ? AppColor.greyColor
                                                : AppColor.whiteColor,
                                        dotsColor: Color(int.parse(
                                            "0xff${controller.productDetailList![0].productAttributes![e].colorCode!.replaceFirst(r'#', "")}")),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              sizeGuideDialouge(context);
                            },
                            child: Row(
                              children: [
                                const AppText(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  text: "Size Guide",
                                ),
                                width5,
                                Icon(Icons.report_outlined)
                              ],
                            ),
                          )
                        ],
                      )
                    ])),
                Container(
                  width: Get.width,
                  color: AppColor.greyColor.withOpacity(0.7),
                  height: Get.height * 0.06,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: Get.height * 0.06,
                        width: Get.width * 0.40,
                        color: AppColor.brownColor,
                        child: AppText(
                          fontWeight: FontWeight.w700,
                          color: AppColor.whiteColor,
                          text: "SPECIAL PRICES",
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height * 0.06,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: getHorizontalSize(15)),
                            child: AppText(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.whiteColor,
                              text:
                                  "EYEWEAR AT FLAT ₹2000 + COMPLIMEMTARY ANTI GLARE LENSES.",
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  color: AppColor.greyColor,
                  height: 0.3,
                ),

                productDescriptionDeatil(),
                details(),
                productDetail("Dimensions", context, () {}),
                exchangeAndReturn("Exchange & Return Policy", context, () {}),
                SizedBox(
                  height: getVerticalSize(18),
                ),
                // productDetail("Exchange & Return", context, () {}),
                getheight(context, 0.030),

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomAssetsImage(
                            height: Get.height * 0.07,
                            imagePath: "assets/image/truck.png",
                          ),
                          AppText(
                            text: "Free shipping",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomAssetsImage(
                            height: Get.height * 0.07,
                            imagePath: "assets/image/delivery.png",
                          ),
                          AppText(
                            text: "10 Day Delivery",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                getheight(context, 0.030),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomAssetsImage(
                            height: Get.height * 0.07,
                            imagePath: "assets/image/return.png",
                          ),
                          AppText(
                            text: "7 day return",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomAssetsImage(
                            height: Get.height * 0.07,
                            imagePath: "assets/image/warrenty.png",
                          ),
                          AppText(
                            text: "1 year warrenty",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                getheight(context, 0.030),
                AppText(
                  text: "Similar Styles",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                getheight(context, 0.030),
                GogleSlider(),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: Get.height * 0.07,
          child: BottomAppBar(
            child: Padding(
              padding: EdgeInsets.only(
                  left: getHorizontalSize(10),
                  right: getHorizontalSize(10),
                  top: getVerticalSize(8)),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CustomElevatedButtons(
                          fontWeight: FontWeight.w600,
                          isBorder: false,
                          buttoncolor: AppColor.orangeColor,
                          height: Get.height * 0.050,
                          width: Get.width * 0.93,
                          textcolor: AppColor.whiteColor,
                          textButton: "Lets Chat",
                          ontap: () async {
                            var whatsappAndroid = Uri.parse(
                                "whatsapp://send?phone=6296157088&text=Hi, I need some help");
                            if (await canLaunchUrl(whatsappAndroid)) {
                              await launchUrl(whatsappAndroid);
                            } else {
                              customeToast(
                                  "WhatsApp is not installed on the device");
                            }
                          }),
                    ),
                  ),
                  width8,
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CustomElevatedButtons(
                          fontWeight: FontWeight.w600,
                          isBorder: false,
                          buttoncolor: AppColor.orangeColor,
                          height: Get.height * 0.050,
                          width: Get.width * 0.93,
                          textcolor: AppColor.whiteColor,
                          textButton: "Select Lenses",
                          ontap: () {
                            if (homepagehomepageController
                                .sharedPref.userToken.value.isEmpty) {
                              Get.toNamed(
                                Routes.OTPPHONENUMBERPAGE,
                              );
                              // Get.to(LoginScreen());
                              // loginDialouge(context);
                            } else {
                              if (controller.selectColorCode.value.isEmpty) {
                                customeToast("Choose color of frames");
                              } else {
                                Get.toNamed(Routes.SELECTPRESCRIPTIONPAGE,
                                    arguments: {
                                      "colorCode":
                                          controller.selectColorCode.value,
                                      "image": controller
                                          .productDetailList![0]
                                          .productAttributes![
                                              controller.colorDotsIndex.value]
                                          .images![0]
                                          .toString()
                                    });
                              }
                            }
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  address() {
    // homepageController.getRatingReview(homepageController.uploadedList[index!]["docsId"]);

    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.greyColor.withOpacity(0.2)))),
      child: ExpansionTile(
        // tilePadding: EdgeInsets.symmetric(vertical: getVerticalSize(1)),
        // collapsedBackgroundColor: blackColor,
        // backgroundColor: blackColor,
        textColor: AppColor.blackColor,
        iconColor: AppColor.blackColor,
        childrenPadding: EdgeInsets.only(
          left: getHorizontalSize(17),
        ),
        title: AppText(
          text: "About Our Lenses",
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: "Address Line 1",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    AppText(
                      text: "No Address",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    const AppText(
                      text: "Address Line 2 (Location)",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    AppText(
                      text: "No location address",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  description() {
    // homepageController.getRatingReview(homepageController.uploadedList[index!]["docsId"]);
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: AppColor.greyColor.withOpacity(0.2),
      ))),
      child: ExpansionTile(
        // tilePadding: EdgeInsets.symmetric(vertical: getVerticalSize(1)),
        // collapsedBackgroundColor: blackColor,
        // backgroundColor: blackColor,
        textColor: AppColor.blackColor,
        iconColor: AppColor.blackColor,
        childrenPadding: EdgeInsets.only(
          left: getHorizontalSize(17),
        ),
        title: AppText(
          text: "Suitable For Presciption",
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          Container(
            width: Get.width,
            child: AppText(
              text: "No description",
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  productDescriptionDeatil() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: AppColor.greyColor.withOpacity(0.2),
        )),
      ),
      child: ExpansionTile(
        textColor: AppColor.blackColor,
        iconColor: AppColor.blackColor,
        childrenPadding: EdgeInsets.only(
          left: getHorizontalSize(17),
        ),
        title: AppText(
          text: "Description",
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          Html(
            data: controller.productDetailList![0].description,
            style: {
              "table": Style(
                backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
              ),
              "tr": Style(
                border: const Border(bottom: BorderSide(color: Colors.grey)),
              ),
              "th": Style(
                padding: const EdgeInsets.all(6),
                backgroundColor: Colors.grey,
              ),
              "td": Style(
                padding: const EdgeInsets.all(6),
                alignment: Alignment.topLeft,
              ),
              'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
            },
          )
        ],
      ),
    );
  }

  details() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: AppColor.greyColor.withOpacity(0.2),
        )),
      ),
      child: ExpansionTile(
        textColor: AppColor.blackColor,
        iconColor: AppColor.blackColor,
        childrenPadding: EdgeInsets.only(
          left: getHorizontalSize(17),
        ),
        title: AppText(
          text: "Details",
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Model Number",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Brand",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Frame Color",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Frame size",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Frame Type",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Frame Material",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Frame shape",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: controller.productDetailList![0].modelNumber!,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: controller.productDetailList![0].brand ??
                            "No brand",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: controller.productDetailList![0].frameColor ??
                            "No Color",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: controller
                                .productDetailList![0].frameSize![0].name ??
                            "No size",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text:
                            controller.productDetailList![0].frametype!.name ??
                                "No type",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: controller
                                .productDetailList![0].framematerial!.name ??
                            "No material",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text:
                            controller.productDetailList![0].frameshape!.name ??
                                "No material",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          height18,
        ],
      ),
    );
  }

  productDetail(String title, context, Function ontap) {
    // homepageController.getRatingReview(homepageController.uploadedList[index!]["docsId"]);
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: AppColor.greyColor.withOpacity(0.2),
      ))),
      child: ExpansionTile(
        // tilePadding: EdgeInsets.symmetric(vertical: getVerticalSize(1)),
        // collapsedBackgroundColor: blackColor,
        // backgroundColor: blackColor,
        textColor: AppColor.blackColor,
        iconColor: AppColor.blackColor,
        childrenPadding: EdgeInsets.only(
          left: getHorizontalSize(17),
        ),
        title: AppText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Temple",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          height2,
                          AppText(
                            text: "Bridge",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: controller.productDetailList![0].temple! +
                                " cm",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          height2,
                          AppText(
                            text: controller.productDetailList![0].bridge! +
                                " cm",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  exchangeAndReturn(String title, context, Function ontap) {
    // homepageController.getRatingReview(homepageController.uploadedList[index!]["docsId"]);
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: AppColor.greyColor.withOpacity(0.2),
      ))),
      child: ExpansionTile(
        // tilePadding: EdgeInsets.symmetric(vertical: getVerticalSize(1)),
        // collapsedBackgroundColor: blackColor,
        // backgroundColor: blackColor,
        textColor: AppColor.blackColor,
        iconColor: AppColor.blackColor,
        childrenPadding: EdgeInsets.only(
          left: getHorizontalSize(17),
        ),
        title: AppText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          Column(
            children: [
              AppText(
                text:
                    "* Easy no question ask 14- days return & exchnage policy ",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
              AppText(
                text: "* Shop worry free with one year warrenty on all frames ",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
              AppText(
                text:
                    "* click here for show all terms and conditions policies ",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          height13,
        ],
      ),
    );
  }

  ratingBarWidget(String text) {
    return SizedBox(
      width: Get.width * 0.67,
      child: Padding(
        padding: EdgeInsets.only(bottom: getVerticalSize(5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.021,
              width: Get.width * 0.17,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: text,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            width2,
            SizedBox(
              height: Get.height * 0.020,
              width: Get.width * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: getVerticalSize(8)),
                    child: Container(
                      height: 4,
                      width: Get.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            width5,
            Padding(
              padding: const EdgeInsets.only(top: 2, left: 7),
              child: SizedBox(
                height: Get.height * 0.019,
                width: Get.width * 0.061,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    AppText(
                      text: "100%",
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  profileWidget() {
    return Container(
      alignment: Alignment.bottomCenter,
      height: Get.height * 0.14,
      width: Get.width * 0.94,
      decoration: BoxDecoration(
        boxShadow: const [],
        border: Border.all(color: AppColor.greyColor, width: 0.6),
        borderRadius: BorderRadius.circular(26),
        color: AppColor.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getVerticalSize(5),
                              horizontal: getHorizontalSize(8)),
                          child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1.5,
                                  color: AppColor.brownColor,
                                ),
                              ),
                              child: Container(
                                height: Get.height * 0.07,
                                width: Get.width * 0.18,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: AppColor.whiteColor,
                                  ),
                                  image: DecorationImage(
                                      fit: BoxFit.cover, image: AssetImage("")),
                                  shape: BoxShape.circle,
                                  color: AppColor.blackColor,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: getVerticalSize(3),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColor.brownColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: getHorizontalSize(3),
                            ),
                            AppText(
                              color: AppColor.brownColor,
                              text: "No Rating",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getVerticalSize(25),
                          right: getHorizontalSize(130),
                          left: getHorizontalSize(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "wholeSellerName",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          const AppText(
                            text: "Wholesaler",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  reviewWidget(
      String reviewtext, String reviewCount, String userName, String dateTime) {
    return Padding(
      padding: EdgeInsets.only(left: getHorizontalSize(10)),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColor.greyColor, width: 0.6))),
        height: Get.height * 0.11,
        width: Get.width * 0.97,
        child: Column(
          children: [
            height8,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColor.greyColor,
                    ),
                    AppText(
                      text: "no rating",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.74,
                  child: AppText(
                    text: "no review",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getHorizontalSize(10),
                  right: getHorizontalSize(18),
                  top: getVerticalSize(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: userName.isNotEmpty ? userName : "No Username",
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: AppColor.blackColor,
                  ),
                  SizedBox(
                    width: Get.width * 0.69,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: dateTime.isNotEmpty
                              ? dateTime.toString()
                              : "no date time",
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.thumb_up_outlined,
                              size: 17,
                            ),
                            width5,
                            AppText(
                              color: AppColor.greyColor,
                              text: "11",
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
