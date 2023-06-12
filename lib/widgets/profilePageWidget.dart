import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orangeeye/controller.dart/accountPageController.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../utils/appColor.dart';
import '../utils/appText.dart';

class ProfileImage extends GetView<ProfilepageController> {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.30,
          width: Get.width,
          color: AppColor.greyColor.withOpacity(0.5),
        ),
        Column(
          children: [
            getheight(context, 0.03),
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                  onTap: (() {
                    controller.getEditImage(ImageSource.gallery);
                  }),
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColor.blackColor, width: 1.2)),
                      child: CircleAvatar(
                          backgroundColor: AppColor.whiteColor,
                          radius: 45,
                          child: controller.selectedImagePath.value.isEmpty
                              ? Icon(
                                  Icons.person,
                                  size: 35,
                                  color: AppColor.orangeColor,
                                )
                              : Image.file(
                                  File(controller.selectedImagePath.value),
                                  fit: BoxFit.cover,
                                )))),
            ),
            getheight(context, 0.010),
            const AppText(
              text: "Amitabh Bacchan",
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColor.whiteColor,
            ),
            getheight(context, 0.010),
            const AppText(
              text: "amitabh bacchan@gmail.com",
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColor.whiteColor,
            )
          ],
        )
      ],
    );
  }
}
