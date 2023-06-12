import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/onboardingController.dart';
import '../utils/appColor.dart';
import '../utils/customeElevatedButton.dart';
import '../utils/sizeHelper.dart';
import '../widgets/onboardingPageWidget.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  OnboardingScreen({super.key});

  // OnboardingController onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            SizedBox(
                height: Get.height,
                child: PageView.builder(
                  onPageChanged: (index) {
                    controller.dots.value = index;
                  },
                  itemBuilder: (context, int) {
                    return OnboardingPageViewWidget(
                      index: int,
                    );
                  },
                  itemCount: controller.onboardingList.length,
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: controller.dots.value == 2
                    ? Padding(
                        padding: EdgeInsets.only(bottom: getVerticalSize(10)),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed("/login");
                          },
                          child: CustomElevatedButtons(
                              isBorder: false,
                              buttoncolor: AppColor.orangeColor,
                              height: Get.height * 0.060,
                              width: Get.width * 0.90,
                              textcolor: AppColor.whiteColor,
                              textButton: "Let’s get Started",
                              ontap: () {
                                Get.toNamed("/login");
                                // Get.to(const Signin(),
                                //     transition: Transition.zoom);
                              }),
                        ),
                      )
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding:
                                EdgeInsets.only(bottom: Get.height * 0.040),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...Iterable.generate(3).map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          left: 4, bottom: getVerticalSize(30)),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            controller.dots.value == e
                                                ? AppColor.orangeColor
                                                : AppColor.whiteColor,
                                        radius: 6,
                                      ),
                                    ))
                              ],
                            )),
                      )),
          ],
        ),
      ),
    );
  }
}
