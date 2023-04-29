import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/cartPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customTextformfiled.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/customeElevatedButton.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../utils/appText.dart';

class Productdesc extends GetView<CartpageController> {
  const Productdesc({super.key});

  @override
  Widget build(BuildContext context) {
    // WishlistPageController wishlistPageController = Get.find();
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: Get.height * 0.40,
        width: Get.width * 0.95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColor.greyColor, width: 0.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: getHorizontalSize(50)),
                  child: CustomAssetsImage(
                    height: Get.height * 0.15,
                    imagePath: "assets/image/bgg2.png",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: getHorizontalSize(10)),
                  child: AppText(
                    text: "₹2000",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: getHorizontalSize(20)),
              child: AppText(
                fontSize: 17.sp,
                text: "Tecla - Black Gold",
                color: AppColor.blackColor,
              ),
            ),
            getheight(context, 0.015),
            Padding(
              padding: EdgeInsets.only(left: getHorizontalSize(50)),
              child: Obx(
                () => Container(
                  height: getVerticalSize(40),
                  width: getHorizontalSize(120),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.greyColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: GestureDetector(
                            onTap: () {
                              controller.countdecs();
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 20,
                              color: AppColor.orangeColor,
                            )),
                      ),
                      const VerticalDivider(
                        color: AppColor.blackColor,
                        width: 1,
                      ),
                      AppText(
                        text: controller.i.toString(),
                        color: AppColor.blackColor,
                      ),
                      const VerticalDivider(
                        color: AppColor.blackColor,
                        width: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: GestureDetector(
                          onTap: () {
                            controller.countInc();
                          },
                          child: const Icon(
                            size: 20,
                            Icons.add,
                            color: AppColor.orangeColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            getheight(context, 0.015),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppText(
                        text: "Prescription Type :",
                        color: AppColor.greyColor,
                        fontSize: 13.sp,
                      ),
                      AppText(
                        text: "  Zero Power",
                        color: AppColor.blackColor,
                        fontSize: 13.sp,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      AppText(
                        text: "Size :",
                        color: AppColor.greyColor,
                        fontSize: 13.sp,
                      ),
                      AppText(
                        text: " Medium",
                        color: AppColor.blackColor,
                        fontSize: 13.sp,
                      )
                    ],
                  ),
                ],
              ),
            ),
            getheight(context, 0.006),
            Padding(
              padding: EdgeInsets.only(left: getHorizontalSize(10)),
              child: Row(
                children: [
                  AppText(
                    text: "Lens Type :",
                    color: AppColor.greyColor,
                    fontSize: 13.sp,
                  ),
                  AppText(
                    text: " Zero Power BLU Anti-Fog Lenses",
                    color: AppColor.blackColor,
                    fontSize: 13.sp,
                  )
                ],
              ),
            ),
            getheight(context, 0.020),
            // fileSelectedWidget(context),
            Divider(
              thickness: 1,
              color: AppColor.greyColor.withOpacity(0.3),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "Totle",
                    color: AppColor.greyColor,
                    fontSize: 15.sp,
                  ),
                  AppText(
                    text: "₹4500",
                    color: AppColor.blackColor,
                    fontSize: 14.sp,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductReturnPolicy extends StatelessWidget {
  const ProductReturnPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.20,
      width: Get.width * 0.95,
      decoration: BoxDecoration(
          color: AppColor.blackColor.withOpacity(0.1),
          border: Border.all(color: AppColor.greyColor, width: 0.4)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
        child: Column(
          children: [
            getheight(context, 0.010),
            AppText(
              text: "7 Days Return",
              color: AppColor.blackColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
            getheight(context, 0.006),
            AppText(
              color: AppColor.blackColor.withOpacity(0.6),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              text:
                  "Spectacle Frame with Prescription lenses and zero power lenses installes are final sale and it cannot be cancelled or returned. sunglasses can be cancelled before shipment and you can returned only the sunglasses",
            ),
            // getheight(context, 0.015),
            // AppText(
            //   text: "365 Day Warranty",
            //   color: AppColor.blackColor,
            //   fontSize: 15.sp,
            //   fontWeight: FontWeight.w600,
            // ),
            // getheight(context, 0.006),
            // AppText(
            //   color: AppColor.blackColor.withOpacity(0.6),
            //   fontSize: 12.sp,
            //   fontWeight: FontWeight.w400,
            //   text:
            //       "In case of ant manufacturing defect during warrenty period. we will send a brand new pair angain",
            // )
          ],
        ),
      ),
    );
  }
}

class Coupouns extends GetView<CartpageController> {
  Coupouns({super.key});
  final CartpageController cartpageController = Get.put(CartpageController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getheight(context, 0.010),
            AppText(
              text: "Enter Promo Code",
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.blackColor,
            ),
            getheight(context, 0.017),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: getVerticalSize(55),
                      child: GestureDetector(
                        onTap: () async {
                          await controller.getCoupouns();
                          controller.isShow.value = !controller.isShow.value;
                          print("value");
                          print(controller.isShow.value);
                        },
                        child: Container(
                          height: Get.height * 0.10,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.greyColor),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AppText(
                              text: controller.selectCoupouns.value.isEmpty
                                  ? "Coupouns"
                                  : controller.selectCoupouns.value,
                            ),
                          ),
                        ),
                      )
                      // CustomFormField(
                      //   controller: controller.coupounController,
                      //   hint: "Apply Coupons",
                      //   readOnly: true,
                      //   ontap: () {
                      //     controller.isShow.value = !controller.isShow.value;
                      //     print("value");
                      //     print(controller.isShow.value);
                      //   },
                      // ),
                      ),
                ),
                width10,
                CustomElevatedButtons(
                    buttoncolor: AppColor.orangeColor,
                    isBorder: true,
                    height: getVerticalSize(54),
                    width: getHorizontalSize(30),
                    textcolor: AppColor.whiteColor,
                    textButton: "Apply",
                    ontap: () {})
              ],
            ),
            controller.isShow.value == true
                ? ListView(primary: true, shrinkWrap: true, children: [
                    getheight(context, 0.020),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.coupounsList
                          .map((element) => GestureDetector(
                              onTap: () async {
                                controller.selectedOption.value = element.type;
                                controller.isShow.value = false;

                                //             latAddressType.value =
                                //     value["data"]
                                //         ["lat"];
                                // longAddressType
                                //         .value =
                                //     value["data"]
                                //         ["lng"];
                              },
                              child: GestureDetector(
                                onTap: () {
                                  controller.selectCoupouns.value =
                                      element.value;
                                  controller.isShow.value = false;
                                },
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  padding: EdgeInsets.all(10),
                                  height: Get.height * 0.16,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.greyColor
                                              .withOpacity(0.4))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: AppColor.blackColor,
                                            textAlign: TextAlign.center,
                                            text: "Coupouns Code",
                                          ),
                                          AppText(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp,
                                            color: AppColor.greyColor,
                                            text: element.code,
                                          ),
                                        ],
                                      ),
                                      getheight(context, 0.005),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp,
                                            color: AppColor.blackColor,
                                            textAlign: TextAlign.center,
                                            text: "Coupouns Name",
                                          ),
                                          AppText(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp,
                                            color: AppColor.greyColor,
                                            text: element.title,
                                          ),
                                        ],
                                      ),
                                      getheight(context, 0.005),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp,
                                            color: AppColor.blackColor,
                                            text: "Discount",
                                          ),
                                          AppText(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp,
                                            color: AppColor.greyColor,
                                            text: "₹${element.value}",
                                          ),
                                        ],
                                      ),
                                      getheight(context, 0.005),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp,
                                            color: AppColor.blackColor,
                                            textAlign: TextAlign.center,
                                            text: "Mini order amount",
                                          ),
                                          AppText(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13.sp,
                                            color: AppColor.greyColor,
                                            text: element.minOrderAmt,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // AppText(
                                  //   text: element.title,
                                  //   fontSize: 16.sp,
                                  //   fontWeight: FontWeight.w600,
                                  //   color: AppColor.blackColor,
                                  // ),
                                ),
                              )))
                          .toList(),
                    ),
                    getheight(context, 0.020),
                  ])
                : const SizedBox(),
            getheight(context, 0.017),
            GestureDetector(
              onTap: () {},
              child: AppText(
                text: "View Available Offers",
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductPaymentDetails extends StatelessWidget {
  const ProductPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "Order Summary",
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.blackColor,
          ),
          getheight(context, 0.010),
          paymentTiles("Subtotal", "₹3200"),
          getheight(context, 0.008),
          paymentTiles("Discount", "-₹200"),
          getheight(context, 0.008),
          paymentTiles("Shipping Charges", "₹20"),
          getheight(context, 0.008),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: "Discount",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
              ),
              AppText(
                text: "-₹200",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppText(
                    text: "Taxes",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.greyColor,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.report_outlined,
                        color: AppColor.greyColor,
                      ))
                ],
              ),
              AppText(
                text: "₹3200",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: AppColor.greyColor.withOpacity(0.3),
          ),
          getheight(context, 0.008),
          paymentTiles("Totle", "₹4000"),
          getheight(context, 0.012),
        ],
      ),
    );
  }

  paymentTiles(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: title,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.greyColor,
        ),
        AppText(
          text: amount,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.greyColor,
        ),
      ],
    );
  }
}
