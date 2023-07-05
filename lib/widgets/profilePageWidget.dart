

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/profileSettingController.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../utils/appColor.dart';
import '../utils/appText.dart';

class ProfileImage extends GetView<ProfileSettingPageController> {
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
              child:  Container(
                        height: 70,
                        width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColor.blackColor, width: 1.2) ,
                                      ),
                         child: CircleAvatar(radius: 100,
                          backgroundImage: NetworkImage( "https://orangeeyewearindia.com/public/uploads/profile/"+controller.image.value),)
                        
                          // CircleAvatar(
                          //     backgroundColor: AppColor.whiteColor,
                          //     radius: 38,
                          //     child: 
                          //     // Icon(
                          //     //   Icons.person,
                          //     //   size: 35,
                          //     //   color: AppColor.orangeColor,
                          //     // )
                          //     // : 
                          //     Image.file(
                          //         File(homepageController.selectedImagePath.value),
                          //         fit: BoxFit.cover,
                          //       )
                          //     )
                              )
                            ),           
            getheight(context, 0.010),
             AppText(
              text: controller.nameController.text.isEmpty?"":controller.nameController.text,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColor.whiteColor,
            ),
            getheight(context, 0.010),
             AppText(
              text: controller.emailController.text.isEmpty?"":controller.emailController.text,
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
