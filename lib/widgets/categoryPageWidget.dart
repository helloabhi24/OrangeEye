import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';

class CategoryGridView extends GetView<HomepageController> {
  CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          // height: Get.height * 0.60,
          child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: Get.height * 0.28,
                  childAspectRatio: 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 0),
              itemCount: controller.gogleList.length,
              itemBuilder: (BuildContext ctx, index) {
                return GogleWidget(
                  index: index,
                );
              })),
    );
  }
}
