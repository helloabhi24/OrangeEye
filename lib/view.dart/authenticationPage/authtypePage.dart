import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/loginController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/customeElevatedButton.dart';
import '../../utils/appColor.dart';
import '../../utils/sizeHelper.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Stack(
        children: [
          CustomAssetsImage(
            boxFit: BoxFit.cover,
            height: Get.height,
            imagePath: "assets/image/model3.jpg",
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: "Welcome To",
                fontWeight: FontWeight.w700,
                fontSize: 35.sp,
                color: AppColor.whiteColor,
              ),
              CustomAssetsImage(
                height: Get.height * 0.22,
                imagePath: "assets/image/appLogo.png",
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  left: getHorizontalSize(10),
                  right: getHorizontalSize(10),
                  bottom: getVerticalSize(20)),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CustomElevatedButtons(
                          fontWeight: FontWeight.w600,
                          isBorder: false,
                          buttoncolor: AppColor.orangeColor,
                          height: Get.height * 0.050,
                          width: Get.width * 0.93,
                          textcolor: AppColor.whiteColor,
                          textButton: "Login/OTP",
                          ontap: () => Get.toNamed(Routes.OTPPHONENUMBERPAGE)),
                    ),
                  ),
                  width8,
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CustomElevatedButtons(
                          fontWeight: FontWeight.w600,
                          isBorder: false,
                          buttoncolor: AppColor.orangeColor,
                          height: Get.height * 0.050,
                          width: Get.width * 0.93,
                          textcolor: AppColor.whiteColor,
                          textButton: "SignUp",
                          ontap: () => Get.toNamed(Routes.SIGNUPPAGE)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
