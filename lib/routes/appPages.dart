import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orangeeye/bindins/binding.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/view.dart/homePage.dart';

class AppPage {
  AppPage._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: "/home", page: (() => const HomePage()), binding: GetXbindings())
  ];
}
