

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customToast.dart';
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
                              
                              },
                              icon: Icon(Icons.arrow_back)),
                          AppText(
                            text: "Lense",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.close))
                        ],
                      ),
                   
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
                                              controller.lensesid.value =
                                                  controller
                                                      .getLensesByCategorey[
                                                          controller
                                                              .indexOfGetLenses
                                                              .value]
                                                      .lenses![e]
                                                      .id;
                                              print("lensesId");
                                              print(controller.lensesid.value);
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
                                                    fontSize: 16.sp,
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
                                                        fontSize: 16.sp,
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
                                                        fontSize: 16.sp,
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
                                                  .image! ,height: Get.height*0.08,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ))
                              ],
                            )
                      : proceedCartWidget(context)

       
            ],
          ),
        ),
      ),
    );
  }

  proceedCartWidget(context) {
   
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
        getheight(context, 0.020),
        CustomElevatedButtons(
            isBorder: false,
            buttoncolor: AppColor.orangeColor,
            height: Get.height * 0.060,
            width: Get.width * 0.90,
            textcolor: AppColor.whiteColor,
            textButton: "Proceed to cart",
            ontap: () async {
              if (controller.selectedImagePath.value.isNotEmpty) {
                // controller.productDetailList![0].name!
                await controller.getAddToCart(
                  controller.productDetailList![0].frameSize![0].id.toString(),
                  Get.arguments["colorCode"],
                  controller.productDetailList![0].id.toString(),
                  "1",
                  controller.base64string.value,
                );
               
              } else {
                return customeToast("Please select image");
              }

    
            }),
        getheight(context, 0.020),
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
