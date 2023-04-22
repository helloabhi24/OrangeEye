import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/catByGenderController.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';

class CategoryGridView extends GetView<HomepageController> {
  CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

        // height: Get.height * 0.60,
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
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
            }));
  }
}

class CardWidget extends GetView<HomepageController> {
  final String text;
  final Function ontap;
  const CardWidget({required this.ontap, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Container(
          height: Get.height * 0.11,
          width: Get.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.orangeColor.withOpacity(0.05)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
                child: AppText(
                  text: text,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor,
                ),
              ),
              Row(
                children: [
                  ...Iterable.generate(controller.categoryList.length)
                      .map((e) => circleWidget(controller.categoryList[e]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  circleWidget(String image) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: CircleAvatar(
        backgroundImage: AssetImage(
          image,
        ),
        radius: 30,
      ),
    );
  }
}
