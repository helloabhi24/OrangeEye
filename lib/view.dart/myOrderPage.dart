import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/orderPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../routes/approutes.dart';
import '../utils/customeElevatedButton.dart';

class MyOrderPage extends GetView<OrderpageController> {
  const MyOrderPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppbar.customeAppbar(
          title: "Order",
          color: AppColor.blackColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              height20,
              SizedBox(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(7),
                      height: Get.height * 0.17,
                      width: Get.width * 0.90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: AppColor.greyColor.withOpacity(0.5))),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(10),
                                vertical: getVerticalSize(10)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text:
                                      "OrderID: ${controller.placeOrderList![index].orderId}",
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AppText(
                                      fontSize: 12,
                                      text:
                                          "Date: ${controller.placeOrderList![index].date.toString().split("00:00:00.000").first}",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    AppText(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      text:
                                          "Total: ₹ ${controller.placeOrderList![index].subTotal}",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppText(
                                  text:
                                      "Payment method : ${controller.placeOrderList![index].paymentMethod}",
                                ),
                              ],
                            ),
                          ),
                          // CustomAssetsImage(
                          //   height: Get.height * 0.15,
                          //   imagePath: "assets/image/bgg2.png",
                          // ),
                          // AppText(
                          //   fontSize: 12,
                          //   fontWeight: FontWeight.w500,
                          //   text: "Tecla - Black Gold (Medium)",
                          // ),
                          height5,
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomElevatedButtons(
                                      isBorder: true,
                                      buttoncolor: AppColor.orangeColor,
                                      height: Get.height * 0.040,
                                      width: Get.width * 0.50,
                                      textcolor: AppColor.whiteColor,
                                      textButton: "View Details",
                                      ontap: () {
                                        // controller.getPlacedOrder();
                                        Get.toNamed(Routes.INVOICEPAGE);
                                        // Get.to(const Signin(),
                                        //     transition: Transition.zoom);
                                      }),
                                ),
                                getWidth(context, 0.050),
                                Expanded(
                                  child: CustomElevatedButtons(
                                      isBorder: true,
                                      buttoncolor: AppColor.orangeColor,
                                      height: Get.height * 0.040,
                                      width: Get.width * 0.50,
                                      textcolor: AppColor.whiteColor,
                                      textButton: "Invoice",
                                      ontap: () async {
                                        await controller.getInvoice(controller
                                            .placeOrderList![index].orderId);
                                        Get.toNamed(Routes.INVOICEPAGE);
                                        // Get.to(const Signin(),
                                        //     transition: Transition.zoom);
                                      }),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: controller.placeOrderList!.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
