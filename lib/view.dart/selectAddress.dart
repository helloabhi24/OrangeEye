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
                GestureDetector(
                  // onTap: () async {
                  //   await controller.getCity("38");
                  // },
                  child: AppText(
                    text: "Billing Address",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.orangeColor,
                  ),
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
                customeStateforbillingDropdown(context),
                getheight(context, 0.020),
                customeCityforbillingDropdown(context),
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
                    onChanged: (p0) {
                      if (p0!.length == 6) {
                        // addNewAddressController.pinCodesCheckForBill(
                        //   addNewAddressController.citynameforbilling.value,
                        // );
                        print(
                            "THis is value of pinCode status in billing address");
                        // print(
                        //     addNewAddressController.pinCodeStatusForBill.value);
                        // print(addNewAddressController.pinCodeStatusForBillList
                        //     .contains(p0));
                        addNewAddressController.pinCodeStatusForBill.value =
                            addNewAddressController.pinCodeStatusForBillList
                                .contains(p0);
                      }
                      print("THis is value of pinCode in billing address");
                      print(addNewAddressController.citynameforbilling.value);
                      print(controller.billingPincodeController.text);
                    },
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
                Visibility(
                  visible: !addNewAddressController.pinCodeStatusForBill.value,
                  child: AppText(
                    text: "* Please enter vaild Pin Code",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.redColor,
                  ),
                ),
                getheight(context, 0.020),
                Row(
                  children: [
                    Checkbox(
                        value: controller.isCheck.value,
                        onChanged: (v) {
                          controller.isCheck.value = !controller.isCheck.value;
                        }),
                    Expanded(
                      child: AppText(
                        text: "Is billing or shipping address different ?",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.orangeColor,
                      ),
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
                          inputType: TextInputType.phone,
                          isMaxLength: true,
                          length: 10,
                        ),
                      ),
                      getheight(context, 0.020),
                      SizedBox(
                        height: Get.height * 0.07,
                        child: CustomFormField(
                          controller: controller.emailController,
                          hint: "Email",
                          // inputFormator: [
                          //   FilteringTextInputFormatter.
                          // ],
                        ),
                      ),
                      getheight(context, 0.020),
                      customeStateforshippingDropdown(context),
                      getheight(context, 0.020),
                      customeCityforshippingDropdown(context),
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
                      //     controller: controller.localityController,
                      //     hint: "Locality",
                      //   ),
                      // ),
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
                          onChanged: (p0) {
                            if (p0!.length == 6) {
                              // addNewAddressController.pinCodesCheckForShip(
                              //     addNewAddressController
                              //         .citynameforshipping.value);
                              // print(addNewAddressController
                              //     .pinCodeStatusForShip.value);
                              // print("this is shippping pin code");
                              // print(addNewAddressController
                              //     .pinCodeStatusForShipList
                              //     .contains(p0));
                              addNewAddressController
                                      .pinCodeStatusForShip.value =
                                  addNewAddressController
                                      .pinCodeStatusForShipList
                                      .contains(p0);
                            }

                            // print("this is in shipping");
                            // print(addNewAddressController
                            //     .citynameforshipping.value);
                            // print(controller.pincodeController.text);
                          },
                          controller: controller.pincodeController,
                          hint: "Pin Code",
                          inputFormator: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          inputType: TextInputType.number,
                          isMaxLength: true,
                          length: 6,
                        ),
                      ),
                      Visibility(
                        visible:
                            !addNewAddressController.pinCodeStatusForShip.value,
                        child: AppText(
                          text: "* Please enter vaild Pin Code",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.redColor,
                        ),
                      ),

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

                      if (controller.billingPhoneController.text.length < 10) {
                        customeToast("Please Enter Correct Phone Number.");
                      } else {
                        if (controller.billingNameController.text.isEmpty ||
                            controller.billingPhoneController.text.isEmpty ||
                            controller.billingEmailController.text.isEmpty ||
                            controller.billingPincodeController.text.isEmpty ||
                            controller.billingLocalityController.text.isEmpty ||
                            controller.stateforbilling.value.isEmpty ||
                            controller.citynameforbilling.value.isEmpty ||
                            addNewAddressController
                                    .pinCodeStatusForBill.value ==
                                false) {
                          customeToast("All fields are required !!");
                        } else if (controller.isCheck.value != true) {
                          print("This is value of cart state and city");
                          // print(controller.statenameforbilling.value);
                          // print(pref.stateName.value);
                          // pref.setStateforBilling(
                          //     controller.statenameforbilling.value);
                          // pref.getStateidforBill();
                          // pref.getcityforBill();
                          // pref.getcityidforBill();
                          print(controller.billingStateidInt.value);
                          print(controller.billingCityidInt.value);
                          Get.toNamed(Routes.PAYMENTPAGE, arguments: {
                            "stateId":
                                controller.billingStateid.value.toString(),
                            "cityId": controller.billingCityid.value.toString()
                          });
                        } else if (controller.phoneController.text.length <
                            10) {
                          customeToast(
                              "Please Enter Currect Phone Number in Shipping details.");
                        } else if (controller.nameController.text.isEmpty ||
                            controller.phoneController.text.isEmpty ||
                            controller.emailController.text.isEmpty ||
                            controller.addressController.text.isEmpty ||
                            controller.localityController.text.isEmpty ||
                            controller.pincodeController.text.isEmpty ||
                            addNewAddressController
                                    .pinCodeStatusForShip.value ==
                                false) {
                          customeToast(
                              "All fields are required in Shipping Address!");
                          // Get.toNamed(Routes.PAYMENTPAGE, arguments: {
                          //   "stateId":
                          //       controller.billingStateid.value.toString(),
                          //   "cityId": controller.billingCityid.value.toString()
                          // });
                        } else {
                          Get.toNamed(Routes.PAYMENTPAGE, arguments: {
                            "stateId":
                                controller.billingStateid.value.toString(),
                            "cityId": controller.billingCityid.value.toString()
                          });
                        }
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
