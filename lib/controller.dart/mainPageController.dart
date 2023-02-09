import 'package:get/get.dart';
import 'package:orangeeye/view.dart/cartPage.dart';
import 'package:orangeeye/view.dart/categoryPage.dart';
import 'package:orangeeye/view.dart/homePage.dart';
import 'package:orangeeye/view.dart/profilePage.dart';

class MainpageController extends GetxController {
  RxInt bottomNavbarIndex = 0.obs;

  List pages = [
    const HomePage(),
    CategoryPage(),
    const CartPage(),
    const ProfilePage(),
  ];
}
