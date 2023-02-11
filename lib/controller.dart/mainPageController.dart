import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orangeeye/view.dart/addNewAddress.dart';
import 'package:orangeeye/view.dart/cartPage.dart';
import 'package:orangeeye/view.dart/catByGender.dart';
import 'package:orangeeye/view.dart/categoryPage.dart';
import 'package:orangeeye/view.dart/homePage.dart';
import 'package:orangeeye/view.dart/profilePage.dart';
import 'package:orangeeye/view.dart/sizeGuidePage.dart';

class MainpageController extends GetxController {
  RxInt bottomNavbarIndex = 0.obs;
  var selectedImagePath = "".obs;

  List pages = [
    HomePage(),
    CategoryPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  List<Map<String, dynamic>> drawerList = [
    {
      "title": "Order",
      "images": "assets/images/Home.png",
      "page": const CartPage(),
    },
    {
      "title": "Address",
      "images": "assets/images/Category.png",
      "page": const AddnewAddressPage(),
    },
    {
      "title": "Eyeglasses",
      "images": "assets/images/analytics.png",
      "page": CategoryByGenderPage(),
    },
    {
      "title": "Sunglasses",
      "images": "assets/images/psonavigation.png",
      "page": CategoryByGenderPage(),
    },
    {
      "title": "Sizeguide",
      "images": "assets/images/psoreward.png",
      "page": SizeGuidePage(),
    },
    {"title": "Logout", "images": "assets/images/onlinefuel.png"},
  ];
}
