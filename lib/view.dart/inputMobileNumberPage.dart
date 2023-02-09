import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/loginController.dart';
import 'package:orangeeye/utils/appColor.dart';

import '../utils/appText.dart';
import '../utils/customeAssetsImage.dart';
import '../utils/sizeHelper.dart';

class LoginScreen extends GetView<LoginPageController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.blackColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColor.blackColor,
          elevation: 0,
          title: AppText(
            color: AppColor.blackColor,
            text: "Login",
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: getVerticalSize(30)),
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
                      left: 10, top: getVerticalSize(43), right: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(65),
                        width: getHorizontalSize(300),
                        child: AppText(
                          textAlign: TextAlign.center,
                          color: AppColor.blackColor,
                          text: "Please enter your 10 Digit \n mobile number",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(27),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getHorizontalSize(15)),
                        child: SizedBox(
                            height: Get.height * 0.08,
                            child: Form(
                                key: controller.formKey,
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: controller.mobileController,
                                  validator: (v) {
                                    RegExp regExp = RegExp(r'^[a-zA-Z0-9]+$');
                                    if (regExp.hasMatch(v!) && v.length == 10) {
                                      return null;
                                    } else {
                                      if (v.isEmpty) {
                                        return "Please complete the required field";
                                      }
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  cursorColor: AppColor.blackColor,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                  decoration: InputDecoration(
                                    labelText: "Mobile number",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          top: getVerticalSize(12),
                                          left: getHorizontalSize(15)),
                                      child: AppText(
                                        color: AppColor.greyColor,
                                        text: "+91 ",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    labelStyle: TextStyle(
                                        color: AppColor.blackColor,
                                        fontSize: 15),
                                    helperStyle:
                                        TextStyle(color: AppColor.blackColor),
                                    errorStyle:
                                        const TextStyle(color: Colors.red),
                                    hintText: "Mobile number",
                                    hintStyle: TextStyle(
                                        color: AppColor.greyColor,
                                        fontSize: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                          color: AppColor.greyColor, width: .4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                          color: AppColor.greyColor, width: .4),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: .4),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: .4),
                                    ),
                                  ),
                                ))

                            //  CustomFormField(
                            //     isMaxLength: true,
                            //     inputType: TextInputType.number,
                            //     isPrefix: true,
                            //     hint: "Mobile number",
                            //     label: "Mobile number",
                            //     controller: controller.mobileNumberController),
                            ),
                      ),
                      getheight(context, 0.040),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.blackColor,
                              shape: const StadiumBorder(),
                              minimumSize: Size(
                                  getHorizontalSize(375), getVerticalSize(50))),
                          onPressed: () async {
                            // if (controller.formKey.currentState!.validate()) {
                            //   controller.phoneNumberLength.value =
                            //       controller.mobileController.text.substring(6);

                            //   await controller.otpImplement();
                            // }

                            // if (controller.formKey.currentState!.validate()) {
                            //   Get.to(const OTPScreen());
                            // } else {
                            //   return null;
                            // }
                          },
                          child: AppText(
                            text: "Request OTP",
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          )),
                      SizedBox(
                        height: getVerticalSize(77),
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
                            width: getVerticalSize(16),
                          ),
                          Container(
                            height: getVerticalSize(0.6),
                            width: getHorizontalSize(160),
                            color: AppColor.greyColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(42),
                      ),
                      TextButton(
                        onPressed: () async {
                          // await controller.googleSignIn().then((value) {
                          //   if (value == null) {
                          //     Get.to(const Signin());
                          //   } else {
                          //     Get.to(MainPage());
                          //   }
                          // });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomAssetsImage(
                                imagePath: "assets/images/google96.png",
                                height: getVerticalSize(32)),
                            SizedBox(
                              width: getHorizontalSize(4),
                            ),
                            AppText(
                              textAlign: TextAlign.center,
                              color: AppColor.blackColor,
                              text: "Continue with google",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      getheight(context, 0.27),
                      // CustomTextButtons(
                      //   textAlign: TextAlign.center,
                      //   color: blackColor,
                      //   textButton:
                      //       "If you continue, you are accepting\n Terms and conditiona and privacy and policy",
                      // )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
