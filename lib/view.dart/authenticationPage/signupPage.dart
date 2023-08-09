import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customTextformfiled.dart';
import 'package:orangeeye/utils/customToast.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

import '../../controller.dart/signupController.dart';
import '../../utils/customeElevatedButton.dart';

class SignUpPage extends GetView<SignUppageController> {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blueColor.withOpacity(0.2),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            top: getVerticalSize(130),
            right: getHorizontalSize(10),
            left: getHorizontalSize(10)),
        child: Column(
          children: [
            CustomAssetsImage(
              height: Get.height * 0.15,
              imagePath: "assets/image/appLogo.png",
            ),
            Align(
              alignment: Alignment.center,
              child: AppText(
                fontSize: 25,
                text: "Create Account",
                fontWeight: FontWeight.w700,
                color: AppColor.whiteColor,
              ),
            ),
            getheight(context, 0.019),
            Align(
              alignment: Alignment.topLeft,
              child: AppText(
                fontSize: 15,
                text: "Name",
                fontWeight: FontWeight.w300,
                color: AppColor.whiteColor,
              ),
            ),
            getheight(context, 0.008),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormFieldForLogin(
                controller: controller.nameController,
                hint: "Your name",
              ),
            ),
            getheight(context, 0.010),
            Align(
              alignment: Alignment.topLeft,
              child: AppText(
                fontSize: 15,
                text: "Email",
                fontWeight: FontWeight.w300,
                color: AppColor.whiteColor,
              ),
            ),
            getheight(context, 0.008),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormFieldForLogin(
                controller: controller.emailController,
                hint: "Your email",
              ),
            ),
            getheight(context, 0.010),
            Align(
              alignment: Alignment.topLeft,
              child: AppText(
                fontSize: 15,
                text: "Password",
                fontWeight: FontWeight.w300,
                color: AppColor.whiteColor,
              ),
            ),
            getheight(context, 0.008),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormFieldForLogin(
                isSuffix: true,
                controller: controller.passwordController,
                hint: "Your password",
              ),
            ),
            getheight(context, 0.010),
            Align(
              alignment: Alignment.topLeft,
              child: AppText(
                fontSize: 15,
                text: "Confirm Password",
                fontWeight: FontWeight.w300,
                color: AppColor.whiteColor,
              ),
            ),
            getheight(context, 0.008),
            SizedBox(
              height: Get.height * 0.07,
              child: CustomFormFieldForLogin(
                isSuffix: true,
                controller: controller.confirmPasswordController,
                hint: "Your confirm password",
              ),
            ),
            getheight(context, 0.07),
            CustomElevatedButtons(
                isBorder: false,
                buttoncolor: AppColor.whiteColor,
                height: Get.height * 0.060,
                width: Get.width * 0.90,
                textcolor: AppColor.blackColor,
                textButton: "SignUp",
                fontWeight: FontWeight.w600,
                ontap: () {
                  // Get.toNamed(Routes.MAINPAGE);
                  customeToast("Please Login with OTP");
                  // Get.to(const Signin(),
                  //     transition: Transition.zoom);
                }),
          ],
        ),
      ),
    );
  }
}
