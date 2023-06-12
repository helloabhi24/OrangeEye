import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customToast.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../routes/approutes.dart';
import '../utils/customDrpdown.dart';
import '../utils/customTextformfiled.dart';
import '../utils/customeElevatedButton.dart';

class SelectAddress extends GetView<AddNewAddressController> {
  const SelectAddress({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppbar.customeAppbar(
            title: "Cart", color: AppColor.blackColor),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getheight(context, 0.020),
                AppText(
                  text: "Billiing Address",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.orangeColor,
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.billingNameController,
                    hint: "Name",
                    contentPadding: EdgeInsets.symmetric(
                        vertical: getVerticalSize(8),
                        horizontal: getHorizontalSize(10)),
                    inputType: TextInputType.name,
                  ),
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.billingPhoneController,
                    hint: "Phone Number",
                    contentPadding: EdgeInsets.symmetric(
                        vertical: getVerticalSize(8),
                        horizontal: getHorizontalSize(10)),
                    inputFormator: [FilteringTextInputFormatter.digitsOnly],
                    inputType: TextInputType.phone,
                    isMaxLength: true,
                    length: 10,
                  ),
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.billingEmailController,
                    hint: "Email",
                    contentPadding: EdgeInsets.symmetric(
                        vertical: getVerticalSize(8),
                        horizontal: getHorizontalSize(10)),
                    inputType: TextInputType.emailAddress,
                  ),
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.billingPincodeController,
                    hint: "Pin Code",
                    contentPadding: EdgeInsets.symmetric(
                        vertical: getVerticalSize(8),
                        horizontal: getHorizontalSize(10)),
                    inputFormator: [FilteringTextInputFormatter.digitsOnly],
                    inputType: TextInputType.number,
                    isMaxLength: true,
                    length: 6,
                  ),
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.billingLocalityController,
                    hint: "Locality",
                    contentPadding: EdgeInsets.symmetric(
                        vertical: getVerticalSize(8),
                        horizontal: getHorizontalSize(10)),
                  ),
                ),
                getheight(context, 0.020),
                SizedBox(
                  height: Get.height * 0.07,
                  child: CustomFormField(
                    controller: controller.billingAddressController,
                    hint: "Address",
                    contentPadding: EdgeInsets.symmetric(
                        vertical: getVerticalSize(8),
                        horizontal: getHorizontalSize(10)),
                  ),
                ),
                getheight(context, 0.020),
                // StatePickerDropdown(),
                customeStateDropdown(context),
                getheight(context, 0.020),
                customeCityDropdown(context),
                // CustomElevatedButtons(
                //     isBorder: true,
                //     buttoncolor: AppColor.orangeColor,
                //     height: Get.height * 0.060,
                //     width: Get.width * 0.90,
                //     textcolor: AppColor.whiteColor,
                //     textButton: "+ Add New Address",
                //     ontap: () {
                //       Get.toNamed(Routes.ADDNEWADDRESSPAGE);
                //     }),
                Row(
                  children: [
                    Checkbox(
                        value: controller.isCheck.value,
                        onChanged: (v) {
                          controller.isCheck.value = !controller.isCheck.value;
                        }),
                    AppText(
                      text: "Is billing or shipping address different ?",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.orangeColor,
                    ),
                  ],
                ),
                getheight(context, 0.020),

                Visibility(
                  visible: controller.isCheck.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Shipping Address",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.orangeColor,
                      ),
                      getheight(context, 0.020),
                      SizedBox(
                        height: Get.height * 0.07,
                        child: CustomFormField(
                          controller: controller.nameController,
                          hint: "Name",
                          // inputFormator: [
                          //   FilteringTextInputFormatter.allow("a-zA-Z")
                          // ],
                        ),
                      ),
                      getheight(context, 0.020),
                      SizedBox(
                        height: Get.height * 0.07,
                        child: CustomFormField(
                          controller: controller.phoneController,
                          hint: "Phone Number",
                          inputFormator: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                          inputFormator: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                    ],
                  ),
                ),

                CustomElevatedButtons(
                    fontWeight: FontWeight.w600,
                    isBorder: false,
                    buttoncolor: AppColor.orangeColor,
                    height: Get.height * 0.060,
                    width: Get.width * 0.93,
                    textcolor: AppColor.whiteColor,
                    textButton: "Countinue",
                    ontap: () async {
                      // pref.setUserAddressDetail();
                      if (controller.billingNameController.text.isEmpty ||
                          controller.billingPhoneController.text.isEmpty ||
                          controller.billingEmailController.text.isEmpty ||
                          controller.billingPincodeController.text.isEmpty ||
                          controller.billingLocalityController.text.isEmpty ||
                          controller.billingCity.isEmpty ||
                          controller.billingState.isEmpty) {
                        customeToast("All fields are required !");
                      } else {
                        Get.toNamed(Routes.PAYMENTPAGE);
                      }

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
