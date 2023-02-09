import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/utils/appColor.dart';

import '../utils/sizeHelper.dart';

class HomepageController extends GetxController {
  RxInt sliderIndex = 0.obs;

  RxList<String> backgroudSliderList = [
    "assets/image/model1.png",
    "assets/image/model2.png",
    "assets/image/model3.png",
    "assets/image/model4.png",
    "assets/image/model5.png",
  ].obs;
  RxList<Widget> sliderList = [
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model1.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model2.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model3.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model4.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model5.png",
    ),
  ].obs;

  RxList<Widget> sliderList2 = [
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model1.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model2.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model3.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model4.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model5.png",
    ),
  ].obs;

  RxList<String> gogleList = [
    "assets/image/g1.png",
    "assets/image/g2.png",
    "assets/image/g3.png",
    "assets/image/g4.png",
    "assets/image/g5.png",
    "assets/image/g3.png",
    "assets/image/g4.png",
    "assets/image/g5.png",
  ].obs;
}

class SliderWidget extends StatelessWidget {
  final String image;
  final bool isPadding;
  final bool isCircularRadius;
  const SliderWidget(
      {this.isCircularRadius = false,
      this.isPadding = false,
      this.image = "",
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (isPadding == true)
          ? EdgeInsets.only(top: Get.height * 0.050)
          : const EdgeInsets.only(top: 0),
      child: Container(
        height: Get.height * 0.30,
        width: getHorizontalSize(5414),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(5, 5),
              color: AppColor.whiteColor,
              blurRadius: 10.0,
            ),
          ],
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
          borderRadius:
              BorderRadius.circular(isCircularRadius == true ? 10 : 0),
        ),
      ),
    );
  }
}
