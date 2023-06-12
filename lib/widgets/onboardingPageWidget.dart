import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/onboardingController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart'; 

import '../utils/customeAssetsImage.dart';

class OnboardingPageViewWidget extends GetView<OnboardingController> {
  int? index;
 OnboardingPageViewWidget({this.index, super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        RepaintBoundary(child: Center(child: CircularProgressIndicator())),
        Container(
          child: FadeInImage(
              fit: BoxFit.fitHeight,
              placeholder: AssetImage("assets/image/whitePage.png"),
              image: AssetImage(
                  controller.onboardingList[index!]["images"].toString())),
          height: Get.height,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
              width: Get.width * 0.80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAssetsImage(
                    height: Get.height * 0.20,
                    imagePath: "assets/image/appLogo.png",
                  ),
                  getheight(context, 0.050),
                  AppText(
                    textAlign: TextAlign.center,
                    color: AppColor.whiteColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    text: controller.onboardingList[index!]["title"].toString(),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
