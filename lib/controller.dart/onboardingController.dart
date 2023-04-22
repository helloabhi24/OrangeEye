import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController(initialPage: 0);

  // List<String> onboardingList = <String>[
  //   "assets/image/model6.png",
  //   "assets/image/model2.png",
  //   "assets/image/model3.png"
  // ];

  List<Map<String, dynamic>> onboardingList = [
    {
      "title": "Picks Your Favourite Frames",
      "images": "assets/image/img11.png",
    },
    {
      "title": "Cool Specs and gogle",
      "images": "assets/image/threegirls.png",
    },
    {
      "title": "Eyewear for everyone & every need",
      "images": "assets/image/img10.png",
    },
  ];

  RxInt dots = 0.obs;

  imageCompress(int index) {
    return FlutterImageCompress.compressAssetImage(
      onboardingList[index]["images"].toString(),
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 180,
    );
  }
}
