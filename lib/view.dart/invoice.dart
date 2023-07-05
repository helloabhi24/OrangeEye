import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/orderPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Invoice",
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              getheight(context, 0.030),
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
                      AppText(
                        textAlign: TextAlign.left,
                        text:
                            "${controller.billedName.value} \n ${controller.billedPhone.value} \n ${controller.billedEmail.value} \n ${controller.billedAddress.value}",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.greyColor,
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
                            "Akash Sharma \n 8927487552 \n as453168@gmail.com \n Murgasol Amedkar Road",
                        fontSize: 12.sp,
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
                child: 
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: getHorizontalSize(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          titleboxWidget(
                              (index + 1).toString(),
                              AppColor.whiteColor.withOpacity(0.2),
                              AppColor.blackColor,
                              12.sp,
                              FontWeight.w500),
                          Column(
                            children: [
                              titleboxWidget(
                                  controller
                                      .placeOrderItemList![index].productName,
                                  AppColor.whiteColor.withOpacity(0.2),
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
                          titleboxWidget(
                              "₹ ${controller.placeOrderItemList![index].price}",
                              AppColor.whiteColor.withOpacity(0.2),
                              AppColor.blackColor,
                              12.sp,
                              FontWeight.w500),
                          titleboxWidget(
                              controller.placeOrderItemList![index].qty,
                              AppColor.whiteColor.withOpacity(0.2),
                              AppColor.blackColor,
                              12.sp,
                              FontWeight.w500),
                          titleboxWidget(
                              "₹${int.parse(controller.placeOrderItemList![index].cgst.split(".00").first) + int.parse(controller.placeOrderItemList![index].sgst.split(".00").first) + int.parse(controller.placeOrderItemList![index].igst.split(".00").first)}",
                              AppColor.whiteColor.withOpacity(0.2),
                              AppColor.blackColor,
                              12.sp,
                              FontWeight.w500),
                          titleboxWidget(
                              "₹${controller.placeOrderItemList![index].totalPrice}",
                              AppColor.whiteColor.withOpacity(0.2),
                              AppColor.blackColor,
                              12.sp,
                              FontWeight.w500),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.placeOrderItemList!.length,
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(13)),
                  child: AppText(
                    text: "Sub Total       ₹${controller.subTotal.value}",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              getheight(context, 0.010),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(13)),
                  child: AppText(
                    text: "Tax                    ₹ 48",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              getheight(context, 0.010),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(13)),
                  child: AppText(
                    text: "Grand Total       ₹${controller.grandTotal.value}",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
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
      color: colors,
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
