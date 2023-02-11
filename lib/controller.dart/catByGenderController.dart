import 'package:get/get.dart';

class CategoryByGenderController extends GetxController {
  RxList<Map<String, String>> genderImgeList = <Map<String, String>>[
    {
      "image": "assets/image/model1.png",
      "title": "Men",
    },
    {
      "image": "assets/image/model2.png",
      "title": "Women",
    },
    {
      "image": "assets/image/model3.png",
      "title": "child",
    },
    {
      "image": "assets/image/model2.png",
      "title": "Unisex",
    },
  ].obs;

  RxList<String> genderList = <String>[
    "Eyeglasses for Men",
    "Eyeglasses for Women",
    "Eyeglasses for child ",
    "Eyeglasses for Unisex",
  ].obs;
}
