import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

import '../utils/customeElevatedButton.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomAssetsImage(
            height: Get.height,
            width: Get.width,
            boxFit: BoxFit.cover,
            imagePath: "assets/image/back.png",
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                textAlign: TextAlign.center,
                text: "Enter 6-digit CODE to your +91 ******7890",
                color: AppColor.whiteColor,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
              getheight(context, 0.010),
              AppText(
                text: "Verfication code sent your phone number",
                color: AppColor.whiteColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              getheight(context, 0.050),
              OtpTextField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsetsDirectional.only(end: 5)),
                borderWidth: 1,
                focusedBorderColor: AppColor.whiteColor,
                autoFocus: true,
                cursorColor: AppColor.whiteColor,
                enabledBorderColor: AppColor.whiteColor,
                disabledBorderColor: AppColor.whiteColor,

                numberOfFields: 4,
                borderColor: AppColor.blackColor,
                //set to true to show as box or false to show as dash
                showFieldAsBox: false,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  // loginController.smsCode.value = verificationCode;
                },
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: getHorizontalSize(100), top: getVerticalSize(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        fontSize: 12,
                        text: "code Expries In",
                        color: AppColor.whiteColor,
                      ),
                      AppText(
                        fontSize: 12,
                        text: "30 sec",
                        color: AppColor.whiteColor,
                      ),
                    ],
                  )),
              getheight(context, 0.020),
              CustomElevatedButtons(
                  isBorder: false,
                  buttoncolor: AppColor.orangeColor,
                  height: Get.height * 0.060,
                  width: Get.width * 0.90,
                  textcolor: AppColor.whiteColor,
                  textButton: "Continue",
                  ontap: () {
                    Get.toNamed(Routes.MAINPAGE);
                    // Get.to(const Signin(),
                    //     transition: Transition.zoom);
                  }),
              getheight(context, 0.045),
              AppText(
                text: "Did Get the code? ",
                color: AppColor.orangeColor,
              ),
              getheight(context, 0.008),
              AppText(
                text: "Resend again",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.whiteColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
