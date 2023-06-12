import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/profileSettingController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customTextformfiled.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

import '../utils/customeElevatedButton.dart';

class ProfileSettingPage extends GetView<ProfileSettingPageController> {
  const ProfileSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppbar.customeAppbar(
            title: "Setting", color: AppColor.blackColor),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getheight(context, 0.05),
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                    onTap: (() {
                      // controller.getEditImage(ImageSource.gallery);
                    }),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColor.blackColor, width: 1.2)),
                        child: CircleAvatar(
                            backgroundColor: AppColor.whiteColor,
                            radius: 38,
                            child: Icon(
                              Icons.person,
                              size: 35,
                              color: AppColor.orangeColor,
                            )
                            // : Image.file(
                            //     File(controller.selectedImagePath.value),
                            //     fit: BoxFit.cover,
                            //   )
                            ))),
              ),
              getheight(context, 0.020),
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: AppText(
                    text: "Add profile picture",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              getheight(context, 0.020),
              Row(
                children: [
                  Radio(
                      activeColor: AppColor.orangeColor,
                      value: true,
                      groupValue: true,
                      onChanged: (value) {}),
                  AppText(
                    text: "Miss",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                  getWidth(context, 0.10),
                  Radio(
                      activeColor: AppColor.orangeColor,
                      value: true,
                      groupValue: true,
                      onChanged: (value) {}),
                  AppText(
                    text: "Mr",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ],
              ),
              getheight(context, 0.020),
              AppText(
                text: "Name",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
              ),
              AppText(
                text: "Amitab Bachhan",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              ),
              getheight(context, 0.030),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "Phone Number",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.greyColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    text: "Change Number",
                                  ),
                                  getheight(context, 0.010),
                                  CustomFormField(
                                      hint: "Mobile Number...",
                                      controller:
                                          controller.changePhoneController),
                                  getheight(context, 0.012),
                                  CustomElevatedButtons(
                                    fontWeight: FontWeight.w600,
                                    isBorder: false,
                                    buttoncolor: AppColor.orangeColor,
                                    height: Get.height * 0.050,
                                    width: Get.width * 0.53,
                                    textcolor: AppColor.whiteColor,
                                    textButton: "SAVE",
                                    ontap: () {
                                      controller.updatedPhoneNumber();
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: AppText(
                      text: "Change phone number",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.orangeColor,
                    ),
                  ),
                ],
              ),
              AppText(
                text: controller.mainpageController.phoneNumber.value.isEmpty
                    ? "No phone number"
                    : controller.mainpageController.phoneNumber.value,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              ),
              getheight(context, 0.030),
              AppText(
                text: "Email",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
              ),
              AppText(
                text: "amitabbachhan@gmail.com",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              ),
              getheight(context, 0.030),
              AppText(
                text: "DOB",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
              ),
              AppText(
                text: "13 Nov 2023",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              ),
              getheight(context, 0.030),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "Password",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.greyColor,
                  ),
                  AppText(
                    text: "Reset password",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.orangeColor,
                  ),
                ],
              ),
              AppText(
                text: "***********",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.blackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
