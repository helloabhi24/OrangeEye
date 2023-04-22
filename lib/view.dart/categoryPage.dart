import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/categoryPageController.dart';
import 'package:orangeeye/routes/approutes.dart';

import 'package:orangeeye/widgets/categoryPageWidget.dart';

import '../controller.dart/catByGenderController.dart';

class CategoryPage extends GetView<CategorypageController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryByGenderController categoryByGenderController = Get.find();
    return Scaffold(
      body: ListView(
        children: [
          CardWidget(
            ontap: () async {
              await categoryByGenderController.getCategory("1", "1");
              Get.toNamed(Routes.CATEGORYWISEPRODUCT,
                  arguments: {"type": "Shop Eyeglasses", "id": "1"});
              // Get.toNamed(Routes.CATEGORYBYGENDERPAGE);
            },
            text: "Men",
          ),
          CardWidget(
            ontap: () async {
              await categoryByGenderController.getCategory("1", "2");
              Get.toNamed(Routes.CATEGORYWISEPRODUCT,
                  arguments: {"type": "Shop Eyeglasses", "id": "1"});
            },
            text: "Women",
          ),
          CardWidget(
            ontap: () async {
              await categoryByGenderController.getCategory("1", "4");
              Get.toNamed(Routes.CATEGORYWISEPRODUCT,
                  arguments: {"type": "Shop Eyeglasses", "id": "1"});
            },
            text: "Kids",
          ),
          CardWidget(
            ontap: () async {
              await categoryByGenderController.getCategory("1", "4");
              Get.toNamed(Routes.CATEGORYWISEPRODUCT,
                  arguments: {"type": "Shop Eyeglasses", "id": "1"});
            },
            text: "BestSeller",
          ),
          CardWidget(
            ontap: () async {
              await categoryByGenderController.getCategory("1", "4");
              Get.toNamed(Routes.CATEGORYWISEPRODUCT,
                  arguments: {"type": "Shop Eyeglasses", "id": "2"});
            },
            text: "New launches",
          ),
          // CategoryGridView()
        ],
      ),
    );
  }
}
