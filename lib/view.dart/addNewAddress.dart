import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../routes/approutes.dart';
import '../utils/customDrpdown.dart';
import '../utils/customTextformfiled.dart';
import '../utils/customeElevatedButton.dart';

class AddnewAddressPage extends GetView<AddNewAddressController> {
  const AddnewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppbar.customeAppbar(
            title: "Add New Address", color: AppColor.blackColor),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                getheight(context, 0.030),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.nameController,
                    hint: "Name",
                  ),
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.phoneController,
                    hint: "Phone Number",
                  ),
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.emailController,
                    hint: "Email",
                  ),
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.pincodeController,
                    hint: "Pin Code",
                  ),
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.localityController,
                    hint: "Locality",
                  ),
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.addressController,
                    hint: "Address",
                  ),
                ),
                // getheight(context, 0.020),
                // SizedBox(
                //   height: Get.height * 0.07,
                //   child: CustomFormField(
                //     controller: controller.nameController,
                //     hint: "City",
                //   ),
                // ),
                getheight(context, 0.020),
                // StatePickerDropdown(),
                customeStateDropdown(context),
                getheight(context, 0.020),
                customeCityDropdown(context),

                getheight(context, 0.020),
                CustomElevatedButtons(
                    fontWeight: FontWeight.w600,
                    isBorder: false,
                    buttoncolor: AppColor.orangeColor,
                    height: Get.height * 0.060,
                    width: Get.width * 0.93,
                    textcolor: AppColor.whiteColor,
                    textButton: "Add Address",
                    ontap: () async {
                      // pref.setUserAddressDetail();
                      Get.toNamed(Routes.PAYMENTPAGE);
                      // await controller.getCity("3");
                    }),
                getheight(context, 0.020),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
