import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/orderPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAppBar.dart';

class PrescriptionPage extends GetView<OrderpageController> {
  const PrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: CustomAppbar.customeAppbar(
              title: "Prescription", color: AppColor.blackColor),
          body: controller.prescriptionList!.isEmpty
              ? Container(
                  height: Get.height * 0.80,
                  width: Get.width,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.getPrescription();
                      },
                      child: AppText(
                        text: "No Prescription",
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10.0),
                      height: Get.height * 0.20,
                      width: Get.width,
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "https://orangeeyewearindia.com/public/" +
                              controller.prescriptionList![index].prescription),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.greyColor),
                      ),
                    );
                  },
                  itemCount: controller.prescriptionList!.length,
                )),
    );
  }
}
