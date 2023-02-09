import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';

import '../utils/appColor.dart';
import '../utils/appText.dart';
import '../utils/customeAssetsImage.dart';
import '../utils/sizeHelper.dart';
import '../view.dart/productDetailPage.dart';
import 'productDetailPage.dart';

class CategoryGridView extends StatelessWidget {
  CategoryGridView({super.key});
  HomepageController homepageController = Get.find<HomepageController>();
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
              itemCount: homepageController.gogleList.length,
              itemBuilder: (BuildContext ctx, index) {
                return GogleWidget(
                  index: index,
                );
              })),
    );
  }
}
