import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // List<String> onboardingList = <String>[
  //   "assets/image/model6.png",
  //   "assets/image/model2.png",
  //   "assets/image/model3.png"
  // ];

  List<Map<String, dynamic>> onboardingList = [
    {
      "title": "Eyewear for everyone & every need",
      "images": "assets/image/model6.png",
    },
    {
      "title": "Cool Specs and gogle",
      "images": "assets/image/model2.png",
    },
    {
      "title": "Eyewear for everyone & every need",
      "images": "assets/image/model3.png",
    },
  ];

  RxInt dots = 0.obs;
}
