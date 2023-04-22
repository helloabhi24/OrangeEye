import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/loginController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customTextformfiled.dart';
import 'package:orangeeye/utils/customToast.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:orangeeye/utils/showDialouge.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../utils/appText.dart';
import '../../utils/customeAssetsImage.dart';
import '../../utils/sizeHelper.dart';
import '../../utils/validator.dart';

class LoginScreen extends GetView<LoginPageController>
    with InputValidationMixin {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Pref pref = Get.find();
    return Obx(
      () => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.orangeColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColor.orangeColor,
            elevation: 0,
            title: AppText(
              color: AppColor.whiteColor,
              text: "Login",
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: getVerticalSize(0)),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  height: Get.height,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: getHorizontalSize(20),
                        right: getHorizontalSize(20),
                        top: getVerticalSize(20)),
                    child: Column(
                      children: [
                        AppText(
                          textAlign: TextAlign.center,
                          color: AppColor.blackColor,
                          text: "Welcome to",
                          // "Please enter your 10 Digit \n mobile number",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomAssetsImage(
                          height: Get.height * 0.15,
                          imagePath: "assets/image/appLogo.png",
                        ),
                        // getheight(context, 0.010),
                        // AppText(
                        //   textAlign: TextAlign.center,
                        //   color: AppColor.blackColor,
                        //   text: "LogIn For A Customised Shopping Experience",
                        //   // "Please enter your 10 Digit \n mobile number",
                        //   fontSize: 15.sp,
                        //   fontWeight: FontWeight.w500,
                        // ),
                        getheight(context, 0.030),
                        Form(
                            key: controller.formKey,
                            child: CustomFormField(
                              validator: emptyValidation,
                              isMaxLength: true,
                              maxLength: 10,
                              length: 10,
                              hint: "Enter Mobile Number...",
                              inputType: TextInputType.number,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: getHorizontalSize(16),
                                  vertical: getVerticalSize(10)),
                              isPrefix: true,
                              controller: controller.mobileController,
                            )),
                        getheight(context, 0.010),
                        Visibility(
                            visible: controller.isLogin.value,
                            child: Column(
                              children: [
                                CustomFormField(
                                  validator: emptyValidation,
                                  isMaxLength: true,
                                  maxLength: 10,
                                  length: 10,
                                  hint: "Enter Otp...",
                                  inputType: TextInputType.number,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: getHorizontalSize(16),
                                      vertical: getVerticalSize(10)),
                                  isPrefix: false,
                                  controller: controller.otpController,
                                ),
                                OtpTimerButton(
                                  buttonType: ButtonType.text_button,
                                  controller: controller.OtpController,
                                  onPressed: () async {
                                    await pref.getAppSignature();

                                    await controller.resendOtp(
                                        controller.mobileController.text,
                                        pref.appssignature.value);

                                    await Future.delayed(Duration(seconds: 6));
                                    if (pref.appssignature.value ==
                                        controller.responseappSignature.value) {
                                      controller.otpController.text =
                                          controller.responseOtp.value;

                                      // await controller.verifyOtp();
                                    } else {
                                      null;
                                    }
                                  },
                                  text: Text(
                                    "Resend  OTP",
                                    style:
                                        TextStyle(color: AppColor.blackColor),
                                  ),
                                  duration: 30,
                                ),
                              ],
                            )),
                        getheight(context, 0.010),
                        Row(
                          children: [
                            Transform.scale(
                                scale: 0.7,
                                child: Checkbox(
                                  value: controller.isCheck.value,
                                  onChanged: (v) {
                                    controller.isCheck.value = v!;
                                  },
                                  activeColor: AppColor.orangeColor,
                                )),
                            Flexible(
                              child: AppText(
                                text:
                                    "If you continue, you are accepting Terms and condition and privacy and policy",
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.greyColor,
                              ),
                            )
                          ],
                        ),
                        getheight(context, 0.010),
                        controller.isLogin.value == true
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.orangeColor,
                                    shape: const StadiumBorder(),
                                    minimumSize: Size(getHorizontalSize(375),
                                        getVerticalSize(50))),
                                onPressed: () async {
                                  await controller.verifyOtp();
                                },
                                child: AppText(
                                  text: "Verify Otp",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ))
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.orangeColor,
                                    shape: const StadiumBorder(),
                                    minimumSize: Size(getHorizontalSize(375),
                                        getVerticalSize(50))),
                                onPressed: () async {
                                  if (controller.formKey.currentState!
                                          .validate() &&
                                      controller.isCheck.value == true) {
                                    controller.appSignature.value =
                                        await SmsAutoFill().getAppSignature;
                                    await pref.setAppSignauture(
                                        controller.appSignature.value);

                                    await controller.userSignIn(
                                        controller.mobileController.text);
                                    await Future.delayed(Duration(seconds: 6));
                                    if (controller.appSignature.value ==
                                        controller.responseappSignature.value) {
                                      controller.otpController.text =
                                          controller.responseOtp.value;

                                      // await controller.verifyOtp();
                                    } else {
                                      null;
                                    }

                                    // controller.appSignature.value ==
                                    //         controller.responseappSignature.value
                                    //     ? controller.otpController.text =
                                    //         controller.responseOtp.value
                                    //     : null;

                                    print("app signature");
                                    print(controller.appSignature.value);

                                    // controller.isLogin.value == true
                                    //     ? controller.verifyOtp()
                                    //     : null;

                                    // await Get.toNamed(Routes.OTP);
                                  } else {
                                    customeToast("please check the box");
                                    // customSnackBar("please check the box");
                                  }
                                },
                                child: AppText(
                                  text: "Send OTP",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                )),
                        getheight(context, 0.015),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed(Routes.MAINPAGE);
                          },
                          child: AppText(
                            text: "Skip",
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                        getheight(context, 0.010),
                        AppText(
                          text: "By logging in you agree to our",
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp,
                        ),
                        getheight(context, 0.010),
                        GestureDetector(
                          onTap: () async {
                            // Get.offNamed(Routes.MAINPAGE);
                            await controller.getPrivacy();
                            privacyDialog(context);
                          },
                          child: AppText(
                              text: "terms of services & privacy policy",
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: AppColor.orangeColor),
                        ),
                        SizedBox(
                          height: getVerticalSize(25),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getVerticalSize(0.6),
                              width: getHorizontalSize(160),
                              color: AppColor.greyColor,
                            ),
                            SizedBox(
                              width: getVerticalSize(16),
                            ),
                            AppText(
                              color: AppColor.blackColor,
                              text: "Or",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              width: getVerticalSize(10),
                            ),
                            Container(
                              height: getVerticalSize(0.6),
                              width: getHorizontalSize(160),
                              color: AppColor.greyColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
