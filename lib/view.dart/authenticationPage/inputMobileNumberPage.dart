import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/loginController.dart';
import 'package:orangeeye/controller.dart/profileSettingController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customDrpdown.dart';
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
import '../mainpage.dart';

class LoginScreen extends GetView<LoginPageController>
    with InputValidationMixin {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Pref pref = Get.find();
    HomepageController homepageController = Get.find();
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: AppColor.whiteColor,
        backgroundColor: AppColor.blueColor.withOpacity(0.2),
        body: Padding(
          padding: EdgeInsets.only(
              top: getVerticalSize(100),
              left: getHorizontalSize(13),
              right: getHorizontalSize(13)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppText(
                  textAlign: TextAlign.center,
                  // color: AppColor.blackColor,
                  color: AppColor.whiteColor,
                  text: "Welcome to Orange Eyewear",
                  // "Please enter your 10 Digit \n mobile number",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
                getheight(context, 0.010),
                CustomAssetsImage(
                  height: Get.height * 0.20,
                  imagePath: "assets/image/appLogo.png",
                ),
                SizedBox(
                  width: Get.width * 0.70,
                  child: AppText(
                    textAlign: TextAlign.center,
                    // color: AppColor.blackColor,
                    color: AppColor.whiteColor,
                    text: "Log In For A Customized Shopping Experience",
                    // "Please enter your 10 Digit \n mobile number",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                getheight(context, 0.050),
                // Form(
                //     key: controller.formKey,
                //     child: CustomFormField(
                //       validator: emptyValidation,
                //       isMaxLength: true,
                //       maxLength: 10,
                //       length: 10,
                //       hint: "Enter Mobile Number...",
                //       inputType: TextInputType.number,
                //       contentPadding: EdgeInsets.symmetric(
                //           horizontal: getHorizontalSize(16),
                //           vertical: getVerticalSize(10)),
                //       isPrefix: true,
                //       controller: controller.mobileController,
                //     )),
                CustomFormFieldForLogin(
                  validator: emptyValidation,
                  isMaxLength: true,
                  maxLength: 10,
                  length: 10,
                  hint: "Enter Mobile Number",
                  inputType: TextInputType.number,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: getHorizontalSize(16),
                      vertical: getVerticalSize(10)),
                  isPrefix: true,
                  controller: controller.mobileController,
                ),
                getheight(context, 0.010),
                Visibility(
                    visible: controller.isLogin.value,
                    child: Column(
                      children: [
                        CustomFormFieldForLogin(
                          validator: emptyValidation,
                          isMaxLength: true,
                          maxLength: 10,
                          length: 10,
                          hint: "Enter OTP",
                          inputType: TextInputType.number,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: getHorizontalSize(16),
                              vertical: getVerticalSize(10)),
                          isPrefix: false,
                          controller: controller.otpController,
                          // onChanged: (v) {
                          //   if (v!.isNotEmpty) {
                          //     controller.verifyOtp();
                          //   } else {
                          //     customeToast("Please Enter OTP");
                          //   }
                          //   print("otp");
                          //   print(v);
                          //   // (v!.isNotEmpty)
                          //   //     ? controller.verifyOtp()
                          //   //     : customeToast("Please Enter OTP");
                          // },
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
                              // controller.otpController.text =
                              //     controller.responseOtp.value;

                              // await controller.verifyOtp();
                            } else {
                              null;
                            }
                          },
                          text: Text(
                            "Resend  OTP",
                            style: TextStyle(
                              // color: AppColor.blackColor
                              color: AppColor.whiteColor,
                            ),
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
                          side: MaterialStateBorderSide.resolveWith(
                            (states) =>
                                BorderSide(width: 2.0, color: Colors.white),
                          ),
                          checkColor: AppColor.whiteColor,
                          value: controller.isCheck.value,
                          onChanged: (v) {
                            controller.isCheck.value = v!;
                          },
                          activeColor: AppColor.blackColor,
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
                            // backgroundColor: AppColor.orangeColor,
                            backgroundColor: AppColor.whiteColor,
                            shape: const StadiumBorder(),
                            minimumSize: Size(
                                getHorizontalSize(375), getVerticalSize(50))),
                        onPressed: () async {
                          await controller.verifyOtp();
                          await pref.getUserId();
                          await homepageController.getCarts();
                          await homepageController.wishlistPageController
                              .getWishlistProduct();

                          Get.to(MainPage());
                          mainpageController.getProfile();
                          // ProfileSettingPageController().getProfileData();
                          addNewAddressController.getProfileAddress();
                          controller.isLogin.value = false;
                          controller.isCheck.value = false;
                        },
                        child: AppText(
                          color: AppColor.blackColor,
                          text: "Verify OTP",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ))
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            // backgroundColor: AppColor.orangeColor,
                            backgroundColor: AppColor.whiteColor,
                            shape: const StadiumBorder(),
                            minimumSize: Size(
                                getHorizontalSize(375), getVerticalSize(50))),
                        onPressed: () async {
                          // controller.formKey.currentState!.validate() &&
                          if (controller.isCheck.value == true) {
                            controller.appSignature.value =
                                await SmsAutoFill().getAppSignature;
                            await pref.setAppSignauture(
                                controller.appSignature.value);

                            await controller
                                .userSignIn(controller.mobileController.text);
                            await Future.delayed(Duration(seconds: 6));
                            if (controller.appSignature.value ==
                                controller.responseappSignature.value) {
                              // controller.otpController.text =
                              //     controller.responseOtp.value;

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
                          color: AppColor.blackColor,
                          fontSize: 14,
                        )),
                getheight(context, 0.015),
                GestureDetector(
                  onTap: () async {
                    // await pref.getUserId();
                    // await homepageController.getCarts();
                    // await homepageController.wishlistPageController
                    //     .getWishlistProduct();
                    Get.toNamed(Routes.MAINPAGE);
                  },
                  child: AppText(
                    text: "Skip",
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColor.whiteColor,
                  ),
                ),
                getheight(context, 0.010),
                AppText(
                  text: "By logging in you agree to our",
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                  color: AppColor.whiteColor,
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
                    // color: AppColor.orangeColor
                    color: AppColor.whiteColor,
                  ),
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
                      // color: AppColor.blackColor,
                      color: AppColor.whiteColor,
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
      ),
    );
  }
}
