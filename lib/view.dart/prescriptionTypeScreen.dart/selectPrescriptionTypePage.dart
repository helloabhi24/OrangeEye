import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/whishlistController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/cachedNetworkImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/view.dart/cartPage.dart';
import '../../utils/appColor.dart';
import '../../utils/customeAppBar.dart';
import '../../utils/customeElevatedButton.dart';
import '../../widgets/homepageWidget.dart';

class SelectPrescriptionPage extends GetView<HomepageController> {
  int? index;
  SelectPrescriptionPage({this.index, super.key});
  @override
  Widget build(BuildContext context) {
    // pageView("0", context);
    //  int index =  Get.arguments["detailPage"];
    WishlistPageController wishlistPageController = Get.find();
    return Obx(
      () => Scaffold(
        appBar: CustomAppbar.customeAppbar(
            title: "cart", color: AppColor.blackColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: Get.height * 0.08,
                  width: Get.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.isLensType.value = false;
                                // controller.isPrescriptionType.value = false;
                                // controller.isLens.value = "1";
                                // pageView(controller.isLens.value, context);
                              },
                              icon: Icon(Icons.arrow_back)),
                          AppText(
                            text: "Lense",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          // AppText(
                          //   text: controller.isLensType.value == true
                          //       ? controller.isPrescriptionType.value == true
                          //           ? "Prescription Details"
                          //           : "Select a lens type"
                          //       : "Select a prescription type",
                          // ),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.close))
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       height: 3,
                      //       width: Get.width * 0.32,
                      //       color: AppColor.brownColor,
                      //     ),
                      //     Container(
                      //       height: 3,
                      //       width: Get.width * 0.32,
                      //       color: controller.isLensType.value == true
                      //           ? AppColor.brownColor
                      //           : AppColor.whiteColor,
                      //     ),
                      //     Container(
                      //       height: 3,
                      //       width: Get.width * 0.32,
                      //       color: controller.isLensType.value == true
                      //           ? AppColor.brownColor
                      //           : AppColor.whiteColor,
                      //     ),
                      //   ],
                      // ),
                    ],
                  )),

              controller.isLensType.value == false
                  ? Column(
                      children: [
                        ...Iterable.generate(
                                controller.getLensesByCategorey.length)
                            .map((e) => prescriptionWidget(
                                  context,
                                  controller.getLensesByCategorey[e].name!,
                                  "no subtile",
                                  "",
                                  AppColor.whiteColor,
                                  () {
                                    print("arundhg");
                                    controller.isLensType.value = true;
                                    controller.indexOfGetLenses.value = e;
                                    controller.isZeroPower.value = false;
                                  },
                                  controller.getLensesByCategorey[e].image!,
                                ))
                      ],
                    )
                  : controller.isZeroPower.value == false
                      ? controller
                              .getLensesByCategorey[
                                  controller.indexOfGetLenses.value]
                              .lenses!
                              .isEmpty
                          ? SizedBox(
                              height: Get.height * 0.80,
                              width: Get.width,
                              child: Center(
                                child: AppText(
                                  text: "No Lenses",
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                ...Iterable.generate(controller
                                        .getLensesByCategorey[
                                            controller.indexOfGetLenses.value]
                                        .lenses!
                                        .length)
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () async {
                                              controller.isZeroPower.value =
                                                  true;
                                            },
                                            child: Container(
                                              height: Get.height * 0.25,
                                              width: Get.width,
                                              color: AppColor.whiteColor,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  AppText(
                                                    text: controller
                                                        .getLensesByCategorey[
                                                            controller
                                                                .indexOfGetLenses
                                                                .value]
                                                        .lenses![e]
                                                        .name!,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  getWidth(context, 0.030),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      AppText(
                                                        text: controller
                                                            .getLensesByCategorey[
                                                                controller
                                                                    .indexOfGetLenses
                                                                    .value]
                                                            .lenses![e]
                                                            .mrp!,
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        textDecoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                      getWidth(context, 0.020),
                                                      AppText(
                                                        text: controller
                                                            .getLensesByCategorey[
                                                                controller
                                                                    .indexOfGetLenses
                                                                    .value]
                                                            .lenses![e]
                                                            .price!,
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )
                                                    ],
                                                  ),
                                                  getWidth(context, 0.010),
                                                  CachedNetworkImage(
                                                      imageUrl: "https://orangeeyewearindia.com/public/uploads/lenses/" +
                                                          controller
                                                              .getLensesByCategorey[
                                                                  controller
                                                                      .indexOfGetLenses
                                                                      .value]
                                                              .lenses![e]
                                                              .image!),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ))
                              ],
                            )
                      : proceedCartWidget(context)

              // pageView(
              //     controller.isLens.value.isEmpty
              //         ? "0"
              //         : controller.isLens.value,
              //     context)
            ],
          ),
        ),
      ),
    );
  }

  proceedCartWidget(context) {
    WishlistPageController wishlistPageController = Get.find();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: getVerticalSize(10)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Icon(
                  Icons.book,
                  size: 40,
                ),
              ),
              Expanded(
                child: AppText(
                  text: "You can submit prescription after placing your order",
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: getVerticalSize(10)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Icon(
                  Icons.book,
                  size: 40,
                ),
              ),
              Expanded(
                child: AppText(
                  text:
                      "Please submit your prescription within 10 days of placing your order.",
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: getVerticalSize(10)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Icon(
                  Icons.book,
                  size: 40,
                ),
              ),
              Expanded(
                child: AppText(
                  text:
                      "Our optical experts will be in touches with you to help you iwth your prescription.",
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: getVerticalSize(10)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Icon(
                  Icons.book,
                  size: 40,
                ),
              ),
              Expanded(
                child: AppText(
                  text:
                      "if, for some reason , you are not able to submit your prescription we will refunded your entire payment amount",
                ),
              )
            ],
          ),
        ),
        getheight(context, 0.020),
        fileSelectedWidget(context),
        // getheight(context, 0.010),
        // Container(
        //   height: Get.height * 0.20,
        //   width: Get.width * 0.93,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: AppColor.redColor,
        //   ),
        // ),
        getheight(context, 0.020),
        CustomElevatedButtons(
            isBorder: false,
            buttoncolor: AppColor.orangeColor,
            height: Get.height * 0.060,
            width: Get.width * 0.90,
            textcolor: AppColor.whiteColor,
            textButton: "Proceed to cart",
            ontap: () async {
              // Get.to(CartPage());
              //     arguments: {"productDetail": Get.arguments["detailPage"]});

              await controller.getAddToCart(
                wishlistPageController
                    .whislistProductList![index!].product![0].frameSize![0].id
                    .toString(),
                "#00FF00",
                wishlistPageController.whislistProductList![index!].productId
                    .toString(),
                "4",
                controller.base64string.value,
              );

              Get.to(CartPage());

              // Get.toNamed(Routes.CARTPAGE);
              // Get.to(const Signin(),
              //     transition: Transition.zoom);
            }),
        getheight(context, 0.020),
      ],
    );
  }

  pageView(String value, context) {
    switch (value) {
      case "1":
        {
          print("1");
          return prescriptionType(context);
        }
        break;

      case "2":
        {
          print("2");
          return zeroPower(context);
        }
        break;

      case "3":
        {
          print("3");
          return ProgressiveOrBifocal(context);
        }
        break;

      case "4":
        {
          print("4");
          return lensType(context);
        }
        break;

      case "5":
        {
          print("5");
          return proceedCartWidget(context);
        }
        break;
      case "0":
        {
          print("5");
          return lensType(context);
        }
        break;

      default:
        {
          return lensType(context);
        }
        break;
    }
  }

  prescriptionType(context) {
    return Column(
      children: [
        prescriptionWidget(
            context,
            "Single Vision",
            "Correct one field of vision ( near , intermediate , or distance)",
            "",
            AppColor.blackColor, () {
          controller.isLensType.value = true;
          controller.isLens.value = "0";
          pageView(controller.isLens.value, context);
        }, ""),
        prescriptionWidget(
            context,
            "Zero Power",
            "Offer style and protection from harmful digital rays with Blu coating but no vision correction",
            "Get flat Rs.1000 off on cart!",
            AppColor.greenColor, () {
          controller.isZeroPower.value = true;
          controller.isLensType.value = true;
          controller.isLens.value = "2";
          pageView(controller.isLens.value, context);
        }, ""),
        prescriptionWidget(
            context,
            "Progressive or Bifocal",
            "Correct near, intermediate , or distance field of vision in one lens so you dont have to switch between multiple pairs",
            "",
            AppColor.blackColor, () {
          controller.isProgessive.value = true;
          controller.isLensType.value = true;
          controller.isLens.value = "3";
          pageView(controller.isLens.value, context);
        }, ""),
      ],
    );
  }

  zeroPower(context) {
    return Column(
      children: [
        prescriptionWidget(
            context,
            "Zero Power Blu Anti - Fog Lenses",
            "Scratch - resistent , anti - reflective lenses with anti - glare coating on both sides of the lens",
            "₹500",
            AppColor.blackColor, () {
          controller.isPrescriptionType.value = true;
          controller.isLens.value = "5";
          pageView(controller.isLens.value, context);
        }, ""),
        prescriptionWidget(
            context,
            "Zero Power Blu Anti - Fog Lenses",
            "Blu filtering lenses with UV resistence to protect your eyes from harmful rays harmful rays of digital devices",
            "₹1000",
            AppColor.greenColor, () {
          controller.isPrescriptionType.value = true;
          controller.isLens.value = "5";
          pageView(controller.isLens.value, context);
        }, ""),
      ],
    );
  }

  ProgressiveOrBifocal(context) {
    return Column(
      children: [
        prescriptionWidget(
            context,
            "Bifocal Lenses",
            "Scratch - resistent , anti - reflective lenses with anti - glare coating on both sides of the lens",
            "₹3000",
            AppColor.blackColor, () {
          controller.isPrescriptionType.value = true;
          controller.isLens.value = "5";
          pageView(controller.isLens.value, context);
        }, ""),
        prescriptionWidget(
            context,
            "Normal Corridor Progressive",
            "Blu filtering lenses with UV resistence to protect your eyes from harmful rays harmful rays of digital devices",
            "₹4000",
            AppColor.greenColor, () {
          controller.isPrescriptionType.value = true;
          controller.isLens.value = "5";
          pageView(controller.isLens.value, context);
        }, ""),
        prescriptionWidget(
            context,
            "Wide Corridor Progressive",
            "Correct near, intermediate , or distance field of vision in one lens so you dont have to switch between multiple pairs",
            "₹8000",
            AppColor.greenColor, () {
          controller.isPrescriptionType.value = true;
          controller.isLens.value = "5";
          pageView(controller.isLens.value, context);
        }, ""),
      ],
    );
  }

  lensType(context) {
    return Column(
      children: [
        prescriptionWidget(
            context,
            "Premium Anti - Glare Lenses",
            "Scratch - resistent , anti - reflective lenses with anti - glare coating on both sides of the lens",
            "Included",
            AppColor.blackColor, () {
          controller.isPrescriptionType.value = true;
          controller.isLens.value = "5";
          pageView(controller.isLens.value, context);
          // Get.to(ProceedCartPage);
        }, ""),
        prescriptionWidget(
            context,
            "BLU Essential Lenses",
            "Blu filtering lenses with UV resistence to protect your eyes from harmful rays harmful rays of digital devices",
            "₹1000",
            AppColor.greenColor, () {
          controller.isPrescriptionType.value = true;
          controller.isLens.value = "5";
          pageView(controller.isLens.value, context);
        }, ""),
        prescriptionWidget(
            context,
            "BLU Thin Lenses ",
            "Correct near, intermediate , or distance field of vision in one lens so you dont have to switch between multiple pairs",
            "₹2000",
            AppColor.greenColor, () {
          controller.isPrescriptionType.value = true;
          controller.isLens.value = "5";
          pageView(controller.isLens.value, context);
        }, ""),
      ],
    );
  }

  prescriptionWidget(context, String title, String subtitle, String price,
      Color color, Function ontap, String image) {
    return Card(
      elevation: 1,
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Container(
          height: Get.height * 0.24,
          width: Get.width,
          color: AppColor.whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                text: title,
              ),
              getheight(context, 0.015),
              CachedNetworkImage(
                  imageUrl:
                      "https://orangeeyewearindia.com/public/uploads/lenses/" +
                          image),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
                child: AppText(
                  textAlign: TextAlign.center,
                  text: subtitle,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              getheight(context, 0.015),
              AppText(
                color: color,
                text: price,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }

  secondPrescriptionWidget(context, String title, String subtitle, String price,
      Color color, Function ontap, String image) {
    return Card(
      elevation: 1,
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Container(
          height: Get.height * 0.24,
          width: Get.width,
          color: AppColor.whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                text: title,
              ),
              getheight(context, 0.015),
              CachedNetworkImage(
                  imageUrl:
                      "https://orangeeyewearindia.com/public/uploads/lenses/" +
                          image),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
                child: AppText(
                  textAlign: TextAlign.center,
                  text: subtitle,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              getheight(context, 0.015),
              AppText(
                color: color,
                text: price,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
