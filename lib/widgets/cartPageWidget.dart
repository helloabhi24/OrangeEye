import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/cartPageController.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customeElevatedButton.dart';
import 'package:orangeeye/utils/showDialouge.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/widgets/productDetailPage.dart';
import '../routes/approutes.dart';
import '../utils/appText.dart';

class Productdesc extends GetView<CartpageController> {
  int? index;
  Productdesc({this.index, super.key});
  @override
  Widget build(BuildContext context) {
    // WishlistPageController wishlistPageController = Get.find();
    HomepageController homepageController = Get.find();
    return Obx(
      () => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              await homepageController.getProductDetail(
                  homepageController.getCartList![index!].slug!);
              Get.toNamed(Routes.PRODUCTDESCRIPTIONPAGE);
            },
            child: Container(
              height: Get.height * 0.52,
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
                      homepageController.getCartList![index!].image1 == null
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: getHorizontalSize(20),
                                  top: getVerticalSize(10)),
                              child: Image.network(
                                "https://orangeeyewearindia.com/public/uploads/products/${homepageController.getCartList![index!].pImage}",
                                height: Get.height * 0.09,
                              ),
                            )
                          // SizedBox(
                          //     height: Get.height * 0.10,
                          //     width: Get.width * 0.30,
                          //     child: Center(
                          //         child: Text(
                          //       "No image",
                          //       style: TextStyle(
                          //           fontSize: 15.sp,
                          //           fontWeight: FontWeight.w500),
                          //     )))
                          : Padding(
                              padding: EdgeInsets.only(
                                  left: getHorizontalSize(20),
                                  top: getVerticalSize(10)),
                              child: Image.network(
                                "https://orangeeyewearindia.com/public/${homepageController.getCartList![index!].image1}",
                                height: Get.height * 0.09,
                              ),
                            ),
                      Column(
                        children: [
                          GestureDetector(
                              onTap: () async{
                                print("arunkumar");
                               await controller.removeProductFromCart(
                                    homepageController.getCartList![index!].id);
                                   
                              },
                              child: Icon(Icons.close)),
                          getheight(context, 0.010),
                          Padding(
                            padding:
                                EdgeInsets.only(right: getHorizontalSize(10)),
                            child: AppText(
                              text:
                                  "₹${homepageController.getCartList![index!].price.toString()}",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  homepageController.getCartList![index!].colorCode == null
                      ? AppText(
                          text: "",
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: getHorizontalSize(80)),
                          child: ColorDots(
                            borderColor: AppColor.greyColor,
                            dotsColor: Color(int.parse(
                                "0xff${homepageController.getCartList![index!].colorCode!.replaceFirst(r'#', "")}")),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.only(left: getHorizontalSize(26)),
                    child: AppText(
                      fontSize: 16.sp,
                      text: homepageController.getCartList![index!].name == null
                          ? "No name"
                          : homepageController.getCartList![index!].name!,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  getheight(context, 0.015),
                  Padding(
                    padding: EdgeInsets.only(left: getHorizontalSize(50)),
                    child: Obx(
                      () => Container(
                        height: getVerticalSize(33),
                        width: getHorizontalSize(120),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.greyColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: GestureDetector(
                                  onTap: () async {
                                    // controller.countdecs();
                                    await homepageController
                                        .getProductIncreement(
                                            homepageController
                                                .getCartList![index!]
                                                .productId!,
                                            int.parse(homepageController
                                                    .getCartList![index!]
                                                    .qty!) -
                                                1);

                                    homepageController.getCarts();
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
                              text:
                                  homepageController.getCartList![index!].qty!,
                              color: AppColor.blackColor,
                            ),
                            const VerticalDivider(
                              color: AppColor.blackColor,
                              width: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: GestureDetector(
                                onTap: () async {
                                  // controller.countInc();
                                  await homepageController.getProductIncreement(
                                      homepageController
                                          .getCartList![index!].productId!,
                                      int.parse(homepageController
                                              .getCartList![index!].qty!) +
                                          1);
                                  homepageController.getCarts();
                                  // await homepageController.sum();
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
                    padding:
                        EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
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
                              text: " Zero Power",
                              color: AppColor.blackColor,
                              fontSize: 13.sp,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            AppText(
                              text: "Lens Price :",
                              color: AppColor.greyColor,
                              fontSize: 13.sp,
                            ),
                            AppText(
                              text:
                                  "₹${homepageController.getCartList![index!].lenseSubtotal! - homepageController.getCartList![index!].lenseTax!}",
                              color: AppColor.blackColor,
                              fontSize: 13.sp,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  getheight(context, 0.010),
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
                          text: homepageController
                                      .getCartList![index!].lensName ==
                                  null
                              ? "No lens"
                              : homepageController
                                  .getCartList![index!].lensName!,
                          color: AppColor.blackColor,
                          fontSize: 13.sp,
                        )
                      ],
                    ),
                  ),
                  getheight(context, 0.010),
                  Padding(
                    padding: EdgeInsets.only(left: getHorizontalSize(10)),
                    child: Row(
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
                  ),
                  getheight(context, 0.010),
                  Padding(
                    padding: EdgeInsets.only(left: getHorizontalSize(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Prescription Image:",
                          color: AppColor.greyColor,
                          fontSize: 13.sp,
                        ),
                        homepageController.getCartList![index!].prescription ==
                                null
                            ? Padding(
                                padding: EdgeInsets.only(
                                    right: getHorizontalSize(15)),
                                child: AppText(
                                  text: "No Image",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                    right: getHorizontalSize(10)),
                                child: Image.network(
                                  "https://orangeeyewearindia.com/public/${homepageController.getCartList![index!].prescription}",
                                  height: Get.height * 0.08,
                                ),
                              ),
                      ],
                    ),
                  ),
                 getheight(context, 0.010),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Row(
                              children: [
                                AppText(
                                  text: "Taxes:",
                                  color: AppColor.greyColor,
                                  fontSize: 13.sp,
                                ),
                                width10,
                                GestureDetector(
                                  onTap: () {
                                    allTaxes(
                                      context,
                                      homepageController
                                          .getCartList![index!].lenseTax
                                          .toString(),
                                      homepageController
                                          .getCartList![index!].productTax
                                          .toString(),
                                    );
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        AppColor.blackColor.withOpacity(0.3),
                                    radius: 9.h,
                                    child: Icon(
                                      Icons.report_outlined,
                                      size: 15.h,
                                      color: AppColor.whiteColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        AppText(
                          text:
                              "₹${homepageController.getCartList![index!].productTax! + homepageController.getCartList![index!].lenseTax!}",
                          color: AppColor.blackColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                  height20,
                  //fileSelectedWidget(context),
                  Divider(
                    thickness: 1,
                    color: AppColor.greyColor.withOpacity(0.3),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: getHorizontalSize(15)),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AppText(
                        text:
                            "₹${homepageController.getCartList![index!].subtotal!.toString()}",
                        color: AppColor.blackColor,
                        fontSize: 14.sp,
                      ),
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
  // final CartpageController cartpageController = Get.put(CartpageController());
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

class ProductPaymentDetails extends GetView<HomepageController> {
  ProductPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final CartpageController cartpageController = Get.find();
    // HomepageController homepageController = Get.find();
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // sum();
              },
              child: AppText(
                text: "Order Summary",
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              ),
            ),
            getheight(context, 0.010),
            paymentTiles("Subtotal", "₹${controller.productSubtotal.value}"),
            getheight(context, 0.008),
            // paymentTiles("Discount", "-₹200"),
            // getheight(context, 0.008),
            paymentTiles("Shipping Charges", "₹ 0.0"),
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
                  text: cartpageController.selectCoupouns.value.isEmpty
                      ? "₹ 0.00"
                      : "₹${cartpageController.selectCoupouns.value}",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.greyColor,
                ),
              ],
            ),
            getheight(context, 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "Taxes",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.greyColor,
                ),
                AppText(
                  text: "₹" + controller.taxes.value,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.greyColor,
                ),
              ],
            ),
            height10,
            Divider(
              thickness: 1,
              color: AppColor.greyColor.withOpacity(0.3),
            ),
            getheight(context, 0.008),
            paymentTiles("Total",
                "₹ ${int.parse(controller.grandtotal.value) - (cartpageController.selectCoupouns.value.isEmpty ? 0 : int.parse(cartpageController.selectCoupouns.value))}"),
            getheight(context, 0.012),
          ],
        ),
      ),
    );
  }

  // var result;
  // sum() {
  //   controller.sumResult.value = controller.getCartList!.fold(
  //       0,
  //       (previousValue, element) =>
  //           previousValue + int.parse(element.price!.replaceAll(".00", "")));
  //   print("value");
  //   print(controller.sumResult.value);
  // }

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
