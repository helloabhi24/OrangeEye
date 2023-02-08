// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeElevatedButton.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';
import 'package:path_provider/path_provider.dart';

class ProductDetailScreen extends GetView<HomepageController> {
  ProductDetailScreen({super.key});
  HomepageController homepagehomepageController = Get.put(HomepageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: Get.height * 0.72,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int) {
                            return Container(
                              height: Get.height * 0.72,
                              width: Get.width,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/image/model1.png"))),
                            );
                          },
                          itemCount: 3,
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
                                  onTap: () async {},
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
                        left: getHorizontalSize(335),
                        child: Container(
                          height: Get.height * 0.042,
                          width: Get.width * 0.18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.whiteColor),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.favorite,
                                  size: 25,
                                  color: AppColor.redColor,
                                ),
                                width2,
                                // customIconButtom(() {}, Icons.favorite, 10, redColor),
                                AppText(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.blackColor,
                                  text: "5.0k",
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: Get.height * 0.68,
                        left: getHorizontalSize(12),
                        child: const AppText(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.greyColor,
                            text: ""),
                      )
                    ],
                  ),
                  height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...Iterable.generate(3).map((e) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                                radius: getHorizontalSize(4.5),
                                backgroundColor: AppColor.greyColor),
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
                            const AppText(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blackColor,
                                text: "Tecla"),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: getHorizontalSize(10)),
                                child: const Icon(
                                  Icons.bookmark_add_outlined,
                                  size: 30,
                                  color: AppColor.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            AppText(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackColor,
                                text: "₹4000"),
                            AppText(
                              textDecoration: TextDecoration.underline,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColor.greyColor,
                              text: "Bookmark",
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: getVerticalSize(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.blackColor,
                                  text: "Brown&black"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: const [
                                      AppText(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.blackColor,
                                        text: "5.0",
                                      ),
                                      width5,
                                      Icon(
                                        Icons.star,
                                        color: AppColor.brownColor,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        getheight(context, 0.010),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: AppColor.blackColor,
                                ),
                                width10,
                                CircleAvatar(
                                  backgroundColor: AppColor.redColor,
                                  radius: 10,
                                ),
                                width10,
                                CircleAvatar(
                                  backgroundColor: AppColor.brownColor,
                                  radius: 10,
                                ),
                                width10,
                                CircleAvatar(
                                  backgroundColor: AppColor.orangeColor,
                                  radius: 10,
                                ),
                              ],
                            ),
                            AppText(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              text: "Size Guide",
                            )
                          ],
                        )
                      ])),

                  Container(
                    width: Get.width,
                    color: AppColor.brownColor,
                    height: 0.3,
                  ),
                  SizedBox(
                    height: getVerticalSize(10),
                  ),

                  productDescriptionDeatil(),
                  SizedBox(
                    height: getVerticalSize(28),
                  ),
                  description(),
                  SizedBox(
                    height: getVerticalSize(28),
                  ),
                  address(),

                  SizedBox(
                    height: getVerticalSize(28),
                  ),
                  productDetail("Dimensions", context, () {}),
                  SizedBox(
                    height: getVerticalSize(18),
                  ),

                  productDetail("Exchange & Return", context, () {}),

                  getheight(context, 0.030),
                  // const Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: AppText(
                  //     text: "Customer Reviews(10)",
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  //  reviewDetail("Customer Reviews(10)"),

                  const AppText(
                    text: "Similar Styles",
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                  getheight(context, 0.030),
                  GogleSlider(),

                  // getheight(context, 0.20)

                  // SizedBox(
                  //   height: getVerticalSize(24),
                  // ),
                  // getNewTrendsProduct(context, true, Get.height * 0.80, false),
                ],
              ),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       width: Get.width,
            //       height: getVerticalSize(60),
            //       color: whiteColor,
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 10),
            //         child: Row(
            //           children: [
            //             Expanded(
            //               child: ClipRRect(
            //                 borderRadius: BorderRadius.circular(10),
            //                 child: CustomElevatedButtons(
            //                     fontWeight: FontWeight.w600,
            //                     isBorder: true,
            //                     buttoncolor: blackColor,
            //                     height: Get.height * 0.070,
            //                     width: Get.width * 0.93,
            //                     textcolor: whiteColor,
            //                     textButton: "Edit ",
            //                     ontap: () {
            //                       Get.to(const EditPage());
            //                     }),
            //               ),
            //             ),
            //             width10,
            //             Expanded(
            //               child: ClipRRect(
            //                 borderRadius: BorderRadius.circular(10),
            //                 child: CustomElevatedButtons(
            //                     fontWeight: FontWeight.w600,
            //                     isBorder: true,
            //                     buttoncolor: blackColor,
            //                     height: Get.height * 0.070,
            //                     width: Get.width * 0.93,
            //                     textcolor: whiteColor,
            //                     textButton: "Delete",
            //                     ontap: () {
            //                       showDilouge(context);
            //                     }),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
        // : Center(
        //     child: CircularProgressIndicator(
        //     color: brownColor,
        //   )),
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
                          buttoncolor: AppColor.blackColor,
                          height: Get.height * 0.050,
                          width: Get.width * 0.93,
                          textcolor: AppColor.whiteColor,
                          textButton: "Lets Chat",
                          ontap: () {}),
                    ),
                  ),
                  width8,
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CustomElevatedButtons(
                          fontWeight: FontWeight.w600,
                          isBorder: false,
                          buttoncolor: AppColor.blackColor,
                          height: Get.height * 0.050,
                          width: Get.width * 0.93,
                          textcolor: AppColor.whiteColor,
                          textButton: "Select Lenses",
                          ontap: () {}),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  address() {
    // homepageController.getRatingReview(homepageController.uploadedList[index!]["docsId"]);

    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.greyColor))),
      child: ExpansionTile(
        // tilePadding: EdgeInsets.symmetric(vertical: getVerticalSize(1)),
        // collapsedBackgroundColor: blackColor,
        // backgroundColor: blackColor,
        textColor: AppColor.blackColor,
        iconColor: AppColor.blackColor,
        childrenPadding: EdgeInsets.only(
          left: getHorizontalSize(17),
        ),
        title: const AppText(
          text: "About Our Lenses",
          fontSize: 16,
          fontWeight: FontWeight.w700,
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
        color: AppColor.greyColor,
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
        title: const AppText(
          text: "Suitable For Presciption",
          fontSize: 16,
          fontWeight: FontWeight.w700,
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
    //  homepageController.getRatingReview(homepageController.uploadedList[index!]["docsId"]);
    // homepageController.getProfileDetails();
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: AppColor.greyColor,
        )),
      ),
      child: ExpansionTile(
        // tilePadding: EdgeInsets.symmetric(vertical: getVerticalSize(1)),
        // collapsedBackgroundColor: blackColor,
        // backgroundColor: blackColor,
        textColor: AppColor.blackColor,
        iconColor: AppColor.blackColor,
        childrenPadding: EdgeInsets.only(
          left: getHorizontalSize(17),
        ),
        title: const AppText(
          text: "Details",
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      AppText(
                        text: "Product type",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Brand",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Material",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Color",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Size",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Min Qty",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Seller name",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Seller type",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Shopname",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Posted on",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      height2,
                      AppText(
                        text: "Product Id",
                        fontSize: 16,
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
                        text: "No category name",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      height2,
                      AppText(
                        text: "No Brand name",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      height2,
                      AppText(
                        text: "No Material name",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      height2,
                      AppText(
                        text: "No Material name",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      height2,
                      AppText(
                        text: "No Size ",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      height2,
                      AppText(
                        text: "No Quantity",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      height2,
                      AppText(
                        text: "No Username",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      height2,
                      AppText(
                        text: "No SellerType",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      height2,
                      AppText(
                        text: "ShopName",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      height2,
                      AppText(
                        text: "no dates",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      height2,
                      AppText(
                        text: "No docsId",
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
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
        color: AppColor.greyColor,
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
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        children: [
          Column(
            children: [
              height10,
              Row(
                children: [
                  const AppText(
                    text: "5.0",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  width10,
                  Icon(
                    Icons.star,
                    color: AppColor.brownColor,
                    size: 22,
                  ),
                  width2,
                  Icon(
                    Icons.star,
                    color: AppColor.brownColor,
                    size: 22,
                  ),
                  width2,
                  Icon(
                    Icons.star,
                    color: AppColor.brownColor,
                  ),
                  width2,
                  Icon(
                    Icons.star,
                    color: AppColor.brownColor,
                    size: 22,
                  ),
                  width2,
                  Icon(
                    Icons.star,
                    color: AppColor.brownColor,
                    size: 22,
                  ),
                  width2,
                  const AppText(
                    text: "(23)",
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Divider(
                color: AppColor.greyColor,
                thickness: 0.6,
                endIndent: 200,
              ),
              SizedBox(
                height: getVerticalSize(20),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: AppText(
                  text: "Customer Reviews",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: getVerticalSize(20),
              ),
              SizedBox(
                  height: Get.height * 0.34,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: Get.height * 0.10,
                          width: Get.width * 0.10,
                        );
                      },
                      itemCount: 5)),
              // ...Iterable.generate(homepageController.productDetailList.length).map(
              //   (e) => Padding(
              //     padding: EdgeInsets.only(bottom: getVerticalSize(8)),
              //     child: Row(
              //       children: [
              //         AppText(
              //           text:
              //               homepageController.productDetailList[e]["title"].toString(),
              //           fontSize: 13,
              //           fontWeight: FontWeight.w700,
              //         ),
              //         SizedBox(
              //           width: getHorizontalSize(100),
              //         ),
              //         AppText(
              //           textAlign: TextAlign.start,
              //           text: homepageController.productDetailList[e]["subtitle"]
              //               .toString(),
              //           fontSize: 13,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: (() {
                  // showMaterialModalBottomSheet(
                  //   backgroundColor: Colors.transparent,
                  //   context: context,
                  //   builder: (context) => Container(
                  //     decoration: BoxDecoration(
                  //         color: whiteColor,
                  //         border: Border.all(color: divColor, width: 0.5),
                  //         borderRadius: const BorderRadius.only(
                  //             topLeft: Radius.circular(30),
                  //             topRight: Radius.circular(30))),
                  //     height: Get.height * 0.92,
                  //     child: Stack(
                  //       children: [
                  //         Column(
                  //           children: [
                  //             Padding(
                  //               padding:
                  //                   EdgeInsets.only(top: getVerticalSize(5)),
                  //               child: Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Padding(
                  //                     padding: EdgeInsets.only(
                  //                         left: getHorizontalSize(30)),
                  //                     child: const AppText(
                  //                       text: "Product Rating & Review",
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsets.only(
                  //                         right: getHorizontalSize(10)),
                  //                     child: IconButton(
                  //                         onPressed: () {
                  //                           Navigator.pop(context);
                  //                         },
                  //                         icon: const Icon(
                  //                             Icons.keyboard_arrow_down)),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //             const Divider(
                  //               thickness: 1,
                  //             ),

                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: getHorizontalSize(20),
                  //                     top: getVerticalSize(10)),
                  //                 child: RatingSummary(
                  //                   color: brownColor,
                  //                   counter: homepageController.sellerRatingList.length,
                  //                   average: homepageController.sum,
                  //                   showAverage: true,
                  //                   counterFiveStars: 5,
                  //                   counterFourStars: 4,
                  //                   counterThreeStars: 2,
                  //                   counterTwoStars: 1,
                  //                   counterOneStars: 1,
                  //                 )
                  //                 // child: Row(
                  //                 //   mainAxisAlignment:
                  //                 //       MainAxisAlignment.spaceBetween,
                  //                 //   children: [
                  //                 //     Column(
                  //                 //       children: [
                  //                 //         Row(
                  //                 //           children: [
                  //                 //             const AppText(
                  //                 //               text: "5.0",
                  //                 //               fontSize: 32,
                  //                 //               fontWeight: FontWeight.w700,
                  //                 //             ),
                  //                 //             Icon(
                  //                 //               Icons.star,
                  //                 //               color: brownColor,
                  //                 //             )
                  //                 //           ],
                  //                 //         ),
                  //                 //         Padding(
                  //                 //           padding: EdgeInsets.only(
                  //                 //               right: getHorizontalSize(10),
                  //                 //               top: getVerticalSize(8)),
                  //                 //           child: Column(
                  //                 //             mainAxisAlignment:
                  //                 //                 MainAxisAlignment.center,
                  //                 //             children: const [
                  //                 //               AppText(
                  //                 //                 textDecoration:
                  //                 //                     TextDecoration.underline,
                  //                 //                 text: "23 Ratings",
                  //                 //                 fontSize: 12,
                  //                 //                 fontWeight: FontWeight.w400,
                  //                 //               ),
                  //                 //               AppText(
                  //                 //                 textDecoration:
                  //                 //                     TextDecoration.underline,
                  //                 //                 text: "25 Review",
                  //                 //                 fontSize: 12,
                  //                 //                 fontWeight: FontWeight.w400,
                  //                 //               ),
                  //                 //             ],
                  //                 //           ),
                  //                 //         )
                  //                 //       ],
                  //                 //     ),
                  //                 //     SizedBox(
                  //                 //       width: getHorizontalSize(20),
                  //                 //     ),
                  //                 //     Padding(
                  //                 //       padding: EdgeInsets.only(
                  //                 //           top: getVerticalSize(10)),
                  //                 //       child: Container(
                  //                 //         height: Get.height * 0.15,
                  //                 //         width: getHorizontalSize(0.5),
                  //                 //         color: divColor,
                  //                 //       ),
                  //                 //     ),
                  //                 //     SizedBox(
                  //                 //       width: getHorizontalSize(20),
                  //                 //     ),
                  //                 //     Padding(
                  //                 //       padding: EdgeInsets.only(
                  //                 //           top: getVerticalSize(20)),
                  //                 //       child: Column(
                  //                 //         crossAxisAlignment:
                  //                 //             CrossAxisAlignment.end,
                  //                 //         children: [
                  //                 //           ratingBarWidget("Excellent"),
                  //                 //           ratingBarWidget("Very Good"),
                  //                 //           ratingBarWidget("Good"),
                  //                 //           ratingBarWidget("Average"),
                  //                 //           ratingBarWidget("Poor"),
                  //                 //         ],
                  //                 //       ),
                  //                 //     )
                  //                 //   ],
                  //                 // ),
                  //                 ),
                  //             SizedBox(
                  //               height: getVerticalSize(30),
                  //             ),
                  //             Divider(
                  //               thickness: 0.3,
                  //               color: divColor,
                  //               endIndent: getHorizontalSize(10),
                  //               indent: getHorizontalSize(10),
                  //             ),

                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: getHorizontalSize(10)),
                  //                 child: Align(
                  //                   alignment: Alignment.centerLeft,
                  //                   child: SizedBox(
                  //                     height: Get.height * 0.59,
                  //                     child: homepageController.getReviewList.isNotEmpty
                  //                         ? ListView.builder(
                  //                             shrinkWrap: true,
                  //                             itemBuilder: (context, index) {
                  //                               return reviewWidget(
                  //                                   homepageController.getReviewList[
                  //                                       index]["ReviewText"],
                  //                                   homepageController.getReviewList[
                  //                                       index]["reviewCount"],
                  //                                   homepageController.getReviewList[
                  //                                       index]["userName"],
                  //                                   homepageController.getReviewList[
                  //                                       index]["dateandtime"]);
                  //                             },
                  //                             itemCount: homepageController
                  //                                 .getReviewList.length,
                  //                           )
                  //                         : const Center(
                  //                             child: AppText(
                  //                               text: "No rating",
                  //                               fontSize: 16,
                  //                               fontWeight: FontWeight.w400,
                  //                             ),
                  //                           ),
                  //                   ),
                  //                 ))

                  //             // BottomAppBar(
                  //             //     child: Column(
                  //             //   children: [],
                  //             // )
                  //             // Padding(
                  //             //   padding: EdgeInsets.only(
                  //             //       left: getHorizontalSize(10),
                  //             //       right: getHorizontalSize(10),
                  //             //       top: getVerticalSize(8)),
                  //             //   child: Row(
                  //             //     children: [
                  //             //       Expanded(
                  //             //         child: ClipRRect(
                  //             //           borderRadius: BorderRadius.circular(10),
                  //             //           child: CustomElevatedButtons(
                  //             //               fontWeight: FontWeight.w600,
                  //             //               isBorder: true,
                  //             //               buttoncolor: blackColor,
                  //             //               height: Get.height * 0.050,
                  //             //               width: Get.width * 0.93,
                  //             //               textcolor: whiteColor,
                  //             //               textButton: "Edit",
                  //             //               ontap: () {}),
                  //             //         ),
                  //             //       ),
                  //             //       width8,
                  //             //       Expanded(
                  //             //         child: ClipRRect(
                  //             //           borderRadius: BorderRadius.circular(10),
                  //             //           child: CustomElevatedButtons(
                  //             //               fontWeight: FontWeight.w600,
                  //             //               isBorder: true,
                  //             //               buttoncolor: blackColor,
                  //             //               height: Get.height * 0.050,
                  //             //               width: Get.width * 0.93,
                  //             //               textcolor: whiteColor,
                  //             //               textButton: "Delete",
                  //             //               ontap: () {}),
                  //             //         ),
                  //             //       ),
                  //             //     ],
                  //             //   ),
                  //             // ),
                  //             // )
                  //           ],
                  //         ),
                  //         Align(
                  //           alignment: Alignment.bottomCenter,
                  //           child: Container(
                  //             height: 80,
                  //             width: Get.width,
                  //             color: Colors.white,
                  //             child: Padding(
                  //               padding: EdgeInsets.symmetric(
                  //                   horizontal: getVerticalSize(10),
                  //                   vertical: getHorizontalSize(16)),
                  //               child: CustomElevatedButtons(
                  //                   fontWeight: FontWeight.w600,
                  //                   isBorder: true,
                  //                   buttoncolor: blackColor,
                  //                   height: 0,
                  //                   width: Get.width * 0.93,
                  //                   textcolor: whiteColor,
                  //                   textButton: "Rate This Product",
                  //                   ontap: () {
                  //                     Get.to(RatingAndReviewPage(
                  //                       index: index!,
                  //                       reviewList: detailProduct,
                  //                     ));
                  //                   }),
                  //             ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // );
                }),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: getVerticalSize(10),
                      left: getHorizontalSize(15),
                      right: getHorizontalSize(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AppText(
                        text: "See all review",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  // reviewDetail(
  //   String title,
  // ) {
  //   return Card(
  //     elevation: 1,
  //     child: ExpansionTile(
  //       childrenPadding: EdgeInsets.only(
  //         left: getHorizontalSize(17),
  //       ),
  //       title: AppText(
  //         text: title,
  //         fontSize: 15,
  //         fontWeight: FontWeight.w700,
  //       ),
  //       children: [
  //         SizedBox(
  //           height: Get.height * 0.60,
  //           child: ListView.builder(
  //             itemBuilder: (context, index) {
  //               return reviewWidget();
  //             },
  //             itemCount: 10,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
        boxShadow: const [
          // BoxShadow(
          //   color: Color.fromARGB(255, 199, 197, 197),
          //   blurRadius: 7.0,
          //   spreadRadius: 1,
          //   offset: Offset(
          //     5,
          //     5,
          //   ),
          // )
        ],
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
                    // const CircleAvatar(
                    //   radius: 24,
                    //   backgroundImage: AssetImage("assets/images/Carousel.png"),
                    // ),
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
                                      fit: BoxFit.cover, image: AssetImage("")
                                      // FileImage(File(homepageController
                                      //     .userDetailList[index!]["Image"]))
                                      ),
                                  shape: BoxShape.circle,
                                  color: AppColor.blackColor,
                                ),
                                // child: Container(
                                //   height: Get.height * 0.22,
                                //   width: Get.width * 0.22,
                                // ),
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

                    // width13,
                    // Row(
                    //   children: [

                    //   ],
                    // )
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

//   void modalBottomSheetMenu(context) {
//    return showMaterialModalBottomSheet(
//   context: context,
//   builder: (context) => Container(),
// )
//   }
}
