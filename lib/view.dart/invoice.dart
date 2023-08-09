import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/orderPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../widgets/homepageWidget.dart';
import '../widgets/productDetailPage.dart';

class InvoicePage extends GetView<OrderpageController> {
  const InvoicePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.orangeColor,
          centerTitle: true,
          title: AppText(
            text: "Invoice",
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.values[1]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppText(
                //   text: "Invoice",
                //   fontSize: 15.sp,
                //   fontWeight: FontWeight.w600,
                // ),
                // getheight(context, 0.030),
                Align(
                  alignment: Alignment.topCenter,
                  child: AppText(
                    text: "Invoice #${controller.orderId.value}",
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: AppText(
                    text: "Date : ${controller.date.value}",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                getheight(context, 0.030),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Billed To:",
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          width: Get.width * 0.4,
                          child: AppText(
                            textAlign: TextAlign.left,
                            text:
                                " ${controller.billedName.value} \n ${controller.billedPhone.value} \n ${controller.billedEmail.value} \n ${controller.billedAddress.value}, \n ${controller.cityByNameInvoice.value}, \n ${controller.stateByNameInvoice.value}, \n ${controller.pinCodeBill.value} ",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.greyColor,
                          ),
                        ),
                        getheight(context, 0.020),
                        AppText(
                          textAlign: TextAlign.left,
                          text: "Payment Method:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        getheight(context, 0.005),
                        AppText(
                          textAlign: TextAlign.left,
                          text: controller.paymentMethod.value,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppText(
                          text: "Shipped To:",
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        AppText(
                          textAlign: TextAlign.right,
                          text:
                              // "Akash Sharma \n 8927487552 \n as453168@gmail.com \n Murgasol Amedkar Road",
                              " ${controller.shipName.value} \n ${controller.shipPhone.value} \n ${controller.shipEmail.value} \n ${controller.shipAddress.value}, \n ${controller.cityByNameInvoiceShip.value}, \n ${controller.stateByNameInvoiceShip.value}, \n ${controller.pinCodeShip.value}",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor,
                        ),
                        getheight(context, 0.020),
                        AppText(
                          text: "Order Date:",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        getheight(context, 0.005),
                        AppText(
                          text: controller.date.value,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    )
                  ],
                ),
                getheight(context, 0.040),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleboxWidget("SR.", AppColor.blackColor,
                        AppColor.whiteColor, 12.sp, FontWeight.w700),
                    titleboxWidget("PRODUCT", AppColor.blackColor,
                        AppColor.whiteColor, 12.sp, FontWeight.w700),
                    titleboxWidget("PRICE", AppColor.blackColor,
                        AppColor.whiteColor, 12.sp, FontWeight.w700),
                    titleboxWidget("QTY", AppColor.blackColor,
                        AppColor.whiteColor, 12.sp, FontWeight.w700),
                    titleboxWidget("TAX", AppColor.blackColor,
                        AppColor.whiteColor, 12.sp, FontWeight.w700),
                    titleboxWidget("TOTAL", AppColor.blackColor,
                        AppColor.whiteColor, 12.sp, FontWeight.w700),
                  ],
                ),
                SizedBox(
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getHorizontalSize(5)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  titleboxWidget(
                                      (index + 1).toString(),
                                      AppColor.whiteColor.withOpacity(0.2),
                                      AppColor.blackColor,
                                      12.sp,
                                      FontWeight.w500),
                                  SizedBox(
                                    width: Get.width * 0.2,
                                    height: Get.height * 0.1,
                                    child: Column(
                                      children: [
                                        titleboxWidget(
                                            controller
                                                .placeOrderItemList![index]
                                                .productName,
                                            AppColor.whiteColor
                                                .withOpacity(0.2),
                                            AppColor.blackColor,
                                            12.sp,
                                            FontWeight.w500),
                                        ColorDots(
                                          borderColor: AppColor.greyColor,
                                          dotsColor: Color(int.parse(
                                              "0xff${controller.placeOrderItemList![index].colorCode.replaceFirst(r'#', "")}")),
                                        ),
                                        // CircleAvatar(
                                        //   backgroundColor: AppColor.brownColor,
                                        //   radius: 8,
                                        // )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      titleboxWidget(
                                          "₹ ${controller.placeOrderItemList![index].price.toString()}",
                                          AppColor.whiteColor.withOpacity(0.2),
                                          AppColor.blackColor,
                                          12.sp,
                                          FontWeight.w500),
                                      controller.placeOrderItemList![index]
                                                  .lensPrice !=
                                              null
                                          ? titleboxWidgetForLens(
                                              "+",
                                              AppColor.whiteColor
                                                  .withOpacity(0.2),
                                              AppColor.blackColor,
                                              12.sp,
                                              FontWeight.w500)
                                          : SizedBox.shrink(),
                                      controller.placeOrderItemList![index]
                                                  .lensPrice !=
                                              null
                                          ? titleboxWidgetForLens(
                                              "₹ ${controller.placeOrderItemList![index].lensPrice.toString()}",
                                              AppColor.whiteColor
                                                  .withOpacity(0.2),
                                              AppColor.blackColor,
                                              12.sp,
                                              FontWeight.w500)
                                          : SizedBox.shrink()
                                    ],
                                  ),
                                  titleboxWidget(
                                      controller.placeOrderItemList![index].qty
                                          .toString(),
                                      AppColor.whiteColor.withOpacity(0.2),
                                      AppColor.blackColor,
                                      12.sp,
                                      FontWeight.w500),
                                  Column(
                                    children: [
                                      titleboxWidget(
                                          // "₹ ${int.parse(controller.placeOrderItemList![index].cgst.split(".00").first) + int.parse(controller.placeOrderItemList![index].sgst.split(".00").first) + int.parse(controller.placeOrderItemList![index].igst.split(".00").first)}",
                                          "₹ ${int.parse(controller.placeOrderItemList![index].productTax.toString())}",
                                          AppColor.whiteColor.withOpacity(0.2),
                                          AppColor.blackColor,
                                          12.sp,
                                          FontWeight.w500),
                                      controller.placeOrderItemList![index]
                                                  .lenseTax !=
                                              null
                                          ? titleboxWidgetForLens(
                                              "+",
                                              AppColor.whiteColor
                                                  .withOpacity(0.2),
                                              AppColor.blackColor,
                                              12.sp,
                                              FontWeight.w500)
                                          : SizedBox.shrink(),
                                      controller.placeOrderItemList![index]
                                                  .lenseTax !=
                                              null
                                          ? titleboxWidgetForLens(
                                              "₹ ${controller.placeOrderItemList![index].lenseTax}",
                                              AppColor.whiteColor
                                                  .withOpacity(0.2),
                                              AppColor.blackColor,
                                              12.sp,
                                              FontWeight.w500)
                                          : SizedBox.shrink()
                                    ],
                                  ),
                                  titleboxWidget(
                                      "₹ ${controller.placeOrderItemList![index].totalPrice}",
                                      AppColor.whiteColor.withOpacity(0.2),
                                      AppColor.blackColor,
                                      12.sp,
                                      FontWeight.w500),
                                ],
                              ),
                              controller.placeOrderItemList![index].productType
                                          .toString() ==
                                      "1"
                                  // ? fileSelectedWidgetForInvoice(context)
                                  ? SizedBox(
                                      height: 2,
                                    )
                                  : SizedBox.shrink(),
                              controller.placeOrderItemList![index].productType
                                          .toString() ==
                                      "1"
                                  // ? fileSelectedWidgetForInvoice(context)
                                  ? Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller
                                                .placeOrderItemList![index]
                                                .orderId;
                                            print(controller.orderId.value);
                                            controller.id.value = controller
                                                .placeOrderItemList![index].id
                                                .toString();
                                            print(controller.id.value);
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    insetPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                getVerticalSize(
                                                                    300)),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                    title: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        AppText(
                                                          text:
                                                              "Upload Prescription",
                                                        ),
                                                        GestureDetector(
                                                            onTap: () =>
                                                                Get.back(),
                                                            child: Icon(
                                                                Icons.cancel))
                                                      ],
                                                    ),
                                                    content: controller
                                                        .fileSelectedWidgetForInvoicee(
                                                            context),
                                                    // actions: [
                                                    //   ElevatedButton(
                                                    //       child:
                                                    //           const Text("Close"),
                                                    //       onPressed: () =>
                                                    //           Get.back()),
                                                    // ],
                                                  );
                                                });
                                          },
                                          child: Card(
                                            color: AppColor.blackColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: AppText(
                                                text: "Upload Prescription",
                                                color: AppColor.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            controller.id.value = controller
                                                .placeOrderItemList![index].id
                                                .toString();

                                            print(controller.id.value);
                                            await controller.getPrescriptions(
                                                controller.id.value);
                                            // Future.delayed(
                                            //     Duration(seconds: 2));
                                            // controller
                                            //     .placeOrderItemList![index]
                                            //     .orderId;
                                            // print(controller.orderId.value);
                                            // print("id of products");
                                            // print(controller
                                            //     .placeOrderItemList![index].id);
                                            // print(controller
                                            //     .prescriptionImageList![index]
                                            //     .id);
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    insetPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                getVerticalSize(
                                                                    300)),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                    title: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        AppText(
                                                          text:
                                                              "Uploaded Prescription",
                                                        ),
                                                        GestureDetector(
                                                            onTap: () =>
                                                                Get.back(),
                                                            child: Icon(
                                                                Icons.cancel))
                                                      ],
                                                    ),
                                                    content: controller
                                                            .prescriptionImageList!
                                                            .isEmpty
                                                        ? AppText(
                                                            text:
                                                                "No Prescription Uploaded",
                                                          )
                                                        : SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ...Iterable.generate(controller
                                                                        .prescriptionImageList!
                                                                        .length)
                                                                    .map((e) =>
                                                                        CachedNetworkImage(
                                                                          imageUrl:
                                                                              "https://orangeeyewearindia.com/public/${controller.prescriptionImageList![e]}",
                                                                          height:
                                                                              Get.height * 0.08,
                                                                          placeholder: (context, url) =>
                                                                              const RepaintBoundary(child: Center(child: CircularProgressIndicator())),
                                                                          imageBuilder:
                                                                              (context, networkimg) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                showAnimatedDialog(
                                                                                  context: context,
                                                                                  barrierDismissible: true,
                                                                                  builder: (BuildContext context) {
                                                                                    return Center(
                                                                                      child: CachedNetworkImage(
                                                                                        // height: Get.height * 0.40,
                                                                                        // width: Get.width * 0.50,
                                                                                        imageUrl: "https://orangeeyewearindia.com/public/${controller.prescriptionImageList![e]}",
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                  animationType: DialogTransitionType.size,
                                                                                  curve: Curves.fastOutSlowIn,
                                                                                  duration: const Duration(seconds: 1),
                                                                                );
                                                                              },
                                                                              child: Container(
                                                                                margin: const EdgeInsets.all(5),
                                                                                height: Get.height * 0.10,
                                                                                width: Get.width * 0.20,
                                                                                decoration: BoxDecoration(image: DecorationImage(image: networkimg, fit: BoxFit.cover)),
                                                                              ),
                                                                            );
                                                                          },
                                                                        )),
                                                              ],
                                                            ),
                                                          ),
                                                  );
                                                });
                                          },
                                          child: Card(
                                            color: AppColor.blackColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: AppText(
                                                text: "View Prescription",
                                                color: AppColor.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink()
                            ],
                          ),
                        );
                      },
                      itemCount: controller.placeOrderItemList!.length,
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Padding(
                //     padding:
                //         EdgeInsets.symmetric(horizontal: getHorizontalSize(13)),
                //     child: AppText(
                //       text: "Sub Total       ₹${controller.subTotal.value}",
                //       fontSize: 14.sp,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
                // getheight(context, 0.010),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Padding(
                //     padding:
                //         EdgeInsets.symmetric(horizontal: getHorizontalSize(13)),
                //     child: AppText(
                //       text: "Tax                    ₹ 48",
                //       fontSize: 14.sp,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
                // getheight(context, 0.010),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getHorizontalSize(13)),
                    child: AppText(
                      text:
                          "Grand Total       ₹ ${controller.grandTotal.value}",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  titleboxWidget(String text, Color colors, Color textColor, double fontSize,
      FontWeight fontweight) {
    return Container(
      alignment: Alignment.center,
      height: Get.height * 0.05,
      // width: Get.width * 0.10,
      decoration: BoxDecoration(
          color: colors,
          // border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      // color: colors,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(8)),
        child: AppText(
          text: text,
          fontSize: fontSize,
          fontWeight: fontweight,
          color: textColor,
        ),
      ),
    );
  }

  titleboxWidgetForLens(String text, Color colors, Color textColor,
      double fontSize, FontWeight fontweight) {
    return Container(
      alignment: Alignment.center,
      height: Get.height * 0.03,
      // width: Get.width * 0.10,
      decoration: BoxDecoration(
          color: colors,
          // border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      // color: colors,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(8)),
        child: AppText(
          text: text,
          fontSize: fontSize,
          fontWeight: fontweight,
          color: textColor,
        ),
      ),
    );
  }
}
