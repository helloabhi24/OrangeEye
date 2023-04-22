import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/loginController.dart';
import 'package:orangeeye/utils/customToast.dart';

import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import '../routes/approutes.dart';
import '../utils/appText.dart';
import '../utils/sharedPref.dart';
import 'appColor.dart';
import 'customTextformfiled.dart';

Future<void> showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const AppText(
          color: AppColor.blackColor,
          text: "IsLogout",
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        content: const AppText(
          color: AppColor.blackColor,
          text: "Are you sure you want to logout!",
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        actions: <Widget>[
          TextButton(
            child: AppText(
              color: AppColor.blackColor,
              text: "Cancel",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: AppText(
              color: AppColor.blackColor,
              text: "Ok",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () async {
              Pref().deleteToken();
              Get.offNamed(Routes.LOGIN, preventDuplicates: true);
            },
          ),
        ],
      );
    },
  );
}

Future privacyDialog(context) async {
  LoginPageController loginPageController = Get.find();
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Material(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 80,
              padding: EdgeInsets.all(20),
              color: Colors.grey.withOpacity(0.1),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: AppText(
                          text: "Privacy Policy",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        )),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close)),
                    AppText(
                      text: loginPageController.privacyPolicies.value,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
  // showDialog<void>(
  //   context: context,
  //   barrierDismissible: false, // user must tap button!
  //   builder: (BuildContext context) {
  //     return Container(
  //       height: Get.height,
  //       width: Get.width * 0.95,
  //       child: AppText(
  //         text: loginPageController.privacyPolicies.value,
  //         fontWeight: FontWeight.w600,
  //         fontSize: 14.sp,
  //       ),
  //     );
  //     //  AlertDialog(
  //     //     title: SingleChildScrollView(
  //     //   child: Column(
  //     //     children: [
  //     //       AppText(
  //     //         text: loginPageController.privacyPolicies.value,
  //     //         fontWeight: FontWeight.w600,
  //     //         fontSize: 14.sp,
  //     //       ),
  //     //     ],
  //     //   ),
  //     // ));
  //   },
  // );
}

sizeGuideDialouge(context) {
  HomepageController homepageController = Get.find();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: "ORANGE EYEWEAR SIZE GUIDE",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text:
                      "SIZE : ${homepageController.imageList[0]["frame_size"][0]["name"].toString()} ",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                getheight(context, 0.020),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        AppText(
                          text: "Lens Width 46mm",
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor,
                        ),
                        dotlineWidget(7)
                      ],
                    ),
                    Column(
                      children: [
                        AppText(
                          text: "Bridge 23mm",
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor,
                        ),
                        dotlineWidget(5)
                      ],
                    ),
                    Column(
                      children: [
                        AppText(
                          text: "Frame Height 36mm",
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyColor,
                        ),
                        dotlineWidget(7)
                      ],
                    )
                  ],
                ),
                getheight(context, 0.010),
                Image.asset(
                  "assets/image/frame.png",
                  width: Get.width,
                ),
                getheight(context, 0.020),
                dotlineWidget(18),
                getheight(context, 0.010),
                AppText(
                  text: "Frame Width 36mm",
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.greyColor,
                ),
                getheight(context, 0.010),
                Image.asset("assets/image/temple.png"),
                dotlineWidget(18),
                getheight(context, 0.010),
                AppText(
                  text: "Temple 36mm",
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.greyColor,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        Center(
                          child: AppText(
                            text: "Frame Width",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.greyColor,
                          ),
                        ),
                        Center(
                          child: AppText(
                            text: "Size",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.greyColor,
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          child: Column(
                            children: [
                              Center(
                                child: AppText(
                                  text: "126 - 129 mm",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                              Center(
                                child: AppText(
                                  text: "126 - 129 mm",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                              Center(
                                child: AppText(
                                  text: "126 - 129 mm",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                              Center(
                                child: AppText(
                                  text: "126 - 129 mm",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                              Center(
                                child: AppText(
                                  text: ">=142 mm",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Center(
                                child: AppText(
                                  text: "Extra - Narrow",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                              Center(
                                child: AppText(
                                  text: "Narrow",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                              Center(
                                child: AppText(
                                  text: "Medium",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                              Center(
                                child: AppText(
                                  text: "Wide",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                              Center(
                                child: AppText(
                                  text: "Extra Wide",
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.greyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

dotlineWidget(int value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ...Iterable.generate(value).map(
        (e) => Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(1)),
          child: Container(
            height: 1.5,
            width: 8,
            color: AppColor.blackColor.withOpacity(0.2),
          ),
        ),
      ),
    ],
  );
}

loginDialouge(context) {
  LoginPageController loginPageController = Get.find();
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Material(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 80,
              padding: EdgeInsets.all(20),
              color: Colors.grey.withOpacity(0.1),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.close))),
                    AppText(
                      text: "Welcome to Orangeeye",
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                    getheight(context, 0.020),
                    SizedBox(
                      height: Get.height * 0.20,
                      child: Image.asset("assets/image/appLogo.png"),
                    ),
                    getheight(context, 0.020),
                    AppText(
                      textAlign: TextAlign.center,
                      text: "Log In For A Customised Shopping Experience",
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                    getheight(context, 0.030),
                    CustomFormField(
                        hint: "Enter mobile number...",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: getVerticalSize(10),
                            horizontal: getHorizontalSize(10)),
                        controller: loginPageController.checkloginController),
                    getheight(context, 0.020),
                    Obx(
                      () => Visibility(
                          visible: loginPageController.isOtpSend.value,
                          child: Column(
                            children: [
                              CustomFormField(
                                  hint: "Enter OTP...",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: getVerticalSize(10),
                                      horizontal: getHorizontalSize(10)),
                                  controller:
                                      loginPageController.otpController),
                              getheight(context, 0.020),
                              OtpTimerButton(
                                buttonType: ButtonType.text_button,
                                controller: loginPageController.controller,
                                onPressed: () {
                                  //  loginPageController.resendOtp(
                                  //   loginPageController
                                  //       .checkloginController.text),
                                },
                                text: Text(
                                  "Resend  OTP",
                                  style: TextStyle(color: AppColor.blackColor),
                                ),
                                duration: 30,
                              ),
                              // GestureDetector(
                              //   onTap: () async {
                              //    await loginPageController.resendOtp(
                              //         loginPageController
                              //             .checkloginController.text);
                              //   },
                              //   child: AppText(
                              //     text: "Resend Otp",
                              //     fontWeight: FontWeight.w600,
                              //     fontSize: 14.sp,
                              //   ),
                              // ),
                            ],
                          )),
                    ),
                    getheight(context, 0.030),
                    Obx(
                      () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.orangeColor,
                              shape: const StadiumBorder(),
                              minimumSize: Size(
                                  getHorizontalSize(375), getVerticalSize(50))),
                          onPressed: () async {
                            if (loginPageController
                                .checkloginController.text.isNotEmpty) {
                              loginPageController.isOtpSend.value == true
                                  ? loginPageController.checkverifyOtp(
                                      loginPageController.otpController.text)
                                  : await loginPageController.userSignIn(
                                      loginPageController
                                          .checkloginController.text);
                            } else {
                              customeToast("Please Enter Mobile no.");
                              // customSnackBar("please check the box");
                            }
                          },
                          child: loginPageController.isLoading.value == true
                              ? CircularProgressIndicator()
                              : AppText(
                                  text: loginPageController.isOtpSend.value ==
                                          true
                                      ? "VerifyOtp"
                                      : "Send OTP",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                )),
                    ),
                    getheight(context, 0.010),
                    GestureDetector(
                      onTap: () {},
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
                      fontSize: 12.sp,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
