import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../utils/customTextformfiled.dart';
import '../utils/customeElevatedButton.dart';

class AddnewAddressPage extends GetView<AddNewAddressController> {
  const AddnewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.customeAppbar(
          title: "Add New Address", color: AppColor.blackColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
        child: Column(
          children: [
            getheight(context, 0.020),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormField(
                controller: controller.nameController,
                hint: "Name",
              ),
            ),
            getheight(context, 0.010),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormField(
                controller: controller.nameController,
                hint: "Phone Number",
              ),
            ),
            getheight(context, 0.010),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormField(
                controller: controller.nameController,
                hint: "Email",
              ),
            ),
            getheight(context, 0.010),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormField(
                controller: controller.nameController,
                hint: "Pin Code",
              ),
            ),
            getheight(context, 0.010),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormField(
                controller: controller.nameController,
                hint: "Locality",
              ),
            ),
            getheight(context, 0.010),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormField(
                controller: controller.nameController,
                hint: "Address",
              ),
            ),
            getheight(context, 0.010),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormField(
                controller: controller.nameController,
                hint: "City",
              ),
            ),
            getheight(context, 0.010),
            Obx(
              () => DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          "Distric",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.blackColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: controller.items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: controller.selectedValue.value,
                  onChanged: (value) {
                    controller.selectedValue.value = value as String;

                    // setState(() {
                    //
                    //   sellPageController.isGenderType.value = selectedValue!;
                    //   sellPageController.getTokenId();
                    // });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: AppColor.blackColor,
                  iconDisabledColor: Colors.grey,
                  buttonHeight: Get.height * 0.07,
                  buttonWidth: Get.width * 0.95,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white),
                  buttonElevation: 0,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: Get.width * 0.90,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 1,
                  scrollbarAlwaysShow: false,
                  offset: const Offset(0, 0),
                ),
              ),
            ),
            Spacer(),
            CustomElevatedButtons(
                fontWeight: FontWeight.w600,
                isBorder: false,
                buttoncolor: AppColor.orangeColor,
                height: Get.height * 0.050,
                width: Get.width * 0.93,
                textcolor: AppColor.whiteColor,
                textButton: "Add Address",
                ontap: () {
                  Get.toNamed(Routes.PAYMENTPAGE);
                }),
            getheight(context, 0.020)
          ],
        ),
      ),
    );
  }
}
