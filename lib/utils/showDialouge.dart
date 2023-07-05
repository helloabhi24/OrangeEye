import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/loginController.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../routes/approutes.dart';
import '../utils/appText.dart';
import '../utils/sharedPref.dart';
import 'appColor.dart';

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
              Get.offNamed(
                Routes.LOGIN,
              );
            },
          ),
        ],
      );
    },
  );
}

Future<void> showSocialMediaDialog(context) async {
  MainpageController mainpageController = Get.find();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close))),
            const AppText(
              color: AppColor.blackColor,
              text: "Social Medial Links",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(mainpageController.insta.value));
              },
              child: CustomAssetsImage(
                imagePath: "assets/image/instagram.png",
                height: Get.height * 0.06,
              ),
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(mainpageController.facebook.value));
              },
              child: CustomAssetsImage(
                imagePath: "assets/image/facebook.png",
                height: Get.height * 0.06,
              ),
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(mainpageController.twitter.value));
              },
              child: CustomAssetsImage(
                imagePath: "assets/image/twitter.png",
                height: Get.height * 0.06,
              ),
            ),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse(mainpageController.youtube.value));
              },
              child: CustomAssetsImage(
                imagePath: "assets/image/youtube.png",
                height: Get.height * 0.06,
              ),
            ),
          ],
        ),
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
}

sizeGuideDialouge(context , List image) {
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
                Align(alignment: Alignment.topRight,
                  child: GestureDetector(onTap: (){
                    Get.back();
                  },
                    child: Icon(Icons.close))),
                  height5,
                AppText(
                  text: "ORANGE EYEWEAR SIZE GUIDE",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text:
                      "SIZE : ${homepageController.productDetailList![0].frameSize![0].name} ",
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
                CachedNetworkImage(errorWidget: (context,
                url, error) =>
                const Icon( Icons.error),
                  memCacheHeight: 300,
                  imageUrl: "https://orangeeye.skardtech.com/public/uploads/products/${image[0]}",placeholder: (context,
                    url) =>
                  const Center(child:RepaintBoundary(child: CircularProgressIndicator())),),
         
            
                dotlineWidget(18),
                getheight(context, 0.010),
                AppText(
                  text: "Frame Width 36mm",
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.greyColor,
                ),
                
                Image.network("https://orangeeye.skardtech.com/public/uploads/products/${image[2]}",height: Get.height*0.15,),
                // Image.asset("assets/image/temple.png"),
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

allTaxes(
  context,
  String lensTax,
  String productTax,
) {
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
                  text: "Taxes 12%",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
                getheight(context, 0.010),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Lens Tax",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      text: "₹ " + lensTax,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                getheight(context, 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "product Tax",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      text: "₹ " + productTax,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

// loginDialouge(context) {
//   LoginPageController loginPageController = Get.find();
//   return showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//       barrierColor: Colors.black45,
//       transitionDuration: const Duration(milliseconds: 200),
//       pageBuilder: (BuildContext buildContext, Animation animation,
//           Animation secondaryAnimation) {
//         return Material(
//           child: Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width - 10,
//               height: MediaQuery.of(context).size.height - 80,
//               padding: EdgeInsets.all(20),
//               color: Colors.grey.withOpacity(0.1),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Align(
//                         alignment: Alignment.topRight,
//                         child: GestureDetector(
//                             onTap: () {
//                               Get.back();
//                             },
//                             child: Icon(Icons.close))),
//                     AppText(
//                       text: "Welcome to Orangeeye",
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20.sp,
//                     ),
//                     getheight(context, 0.020),
//                     SizedBox(
//                       height: Get.height * 0.20,
//                       child: Image.asset("assets/image/appLogo.png"),
//                     ),
//                     getheight(context, 0.020),
//                     AppText(
//                       textAlign: TextAlign.center,
//                       text: "Log In For A Customised Shopping Experience",
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                     ),
//                     getheight(context, 0.030),
//                     CustomFormField(
//                         hint: "Enter mobile number...",
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: getVerticalSize(10),
//                             horizontal: getHorizontalSize(10)),
//                         controller: loginPageController.checkloginController),
//                     getheight(context, 0.020),
//                     Obx(
//                       () => Visibility(
//                           visible: loginPageController.isOtpSend.value,
//                           child: Column(
//                             children: [
//                               CustomFormField(
//                                   hint: "Enter OTP...",
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: getVerticalSize(10),
//                                       horizontal: getHorizontalSize(10)),
//                                   controller:
//                                       loginPageController.otpController),
//                               getheight(context, 0.020),
//                               OtpTimerButton(
//                                 buttonType: ButtonType.text_button,
//                                 controller: loginPageController.controller,
//                                 onPressed: () {
//                                   //  loginPageController.resendOtp(
//                                   //   loginPageController
//                                   //       .checkloginController.text),
//                                 },
//                                 text: Text(
//                                   "Resend  OTP",
//                                   style: TextStyle(color: AppColor.blackColor),
//                                 ),
//                                 duration: 30,
//                               ),
//                               // GestureDetector(
//                               //   onTap: () async {
//                               //    await loginPageController.resendOtp(
//                               //         loginPageController
//                               //             .checkloginController.text);
//                               //   },
//                               //   child: AppText(
//                               //     text: "Resend Otp",
//                               //     fontWeight: FontWeight.w600,
//                               //     fontSize: 14.sp,
//                               //   ),
//                               // ),
//                             ],
//                           )),
//                     ),
//                     getheight(context, 0.030),
//                     Obx(
//                       () => ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColor.orangeColor,
//                               shape: const StadiumBorder(),
//                               minimumSize: Size(
//                                   getHorizontalSize(375), getVerticalSize(50))),
//                           onPressed: () async {
//                             if (loginPageController
//                                 .checkloginController.text.isNotEmpty) {
//                               loginPageController.isOtpSend.value == true
//                                   ? loginPageController.checkverifyOtp(
//                                       loginPageController.otpController.text)
//                                   : await loginPageController.userSignIn(
//                                       loginPageController
//                                           .checkloginController.text);
//                             } else {
//                               customeToast("Please Enter Mobile no.");
//                               // customSnackBar("please check the box");
//                             }
//                           },
//                           child: loginPageController.isLoading.value == true
//                               ? CircularProgressIndicator()
//                               : AppText(
//                                   text: loginPageController.isOtpSend.value ==
//                                           true
//                                       ? "VerifyOtp"
//                                       : "Send OTP",
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 14,
//                                 )),
//                     ),
//                     getheight(context, 0.010),
//                     GestureDetector(
//                       onTap: () {},
//                       child: AppText(
//                         text: "Skip",
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14.sp,
//                       ),
//                     ),
//                     getheight(context, 0.010),
//                     AppText(
//                       text: "By logging in you agree to our",
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12.sp,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       });
// }
