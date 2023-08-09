import 'package:flutter/material.dart';

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
      "title": "Pick Your Favourite Frames",
      "images": "assets/image/image4.jpg",
    },
    {
      "title": "Cool Specs and Sunglasses ",
      "images": "assets/image/model2.jpg",
    },
    {
      "title": "Eyewear for everyone & every need",
      "images": "assets/image/model4.png",
      // "images": "assets/image/model4.jpg",
    },
  ];

  RxInt dots = 0.obs;
}
