import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/appColor.dart';

import '../constant/imageConstantValue.dart';
import '../utils/customeAppBar.dart';
import '../utils/sizeHelper.dart';

class MainPage extends GetView<MainpageController> {
  MainPage({super.key});
  MainpageController mainpageController = Get.put(MainpageController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppbar.customeAppbar(
            isImage: true, imagePath: ImageConstant.APPLOGO),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColor.blackColor,
            unselectedItemColor: AppColor.orangeColor,
            selectedLabelStyle: const TextStyle(color: AppColor.orangeColor),
            unselectedLabelStyle: const TextStyle(color: AppColor.blackColor),
            showSelectedLabels: true,
            // unselectedIconTheme:
            //     const IconThemeData(color: AppColor.blackColor),
            // selectedIconTheme: const IconThemeData(color: AppColor.orangeColor),
            onTap: (value) => controller.bottomNavbarIndex.value = value,
            items: [
              BottomNavigationBarItem(
                  label: "Home",
                  icon: (controller.bottomNavbarIndex.value == 0)
                      ? const Icon(
                          Icons.home,
                          color: AppColor.orangeColor,
                        )
                      : const Icon(
                          Icons.home_outlined,
                          color: AppColor.blackColor,
                        )),
              BottomNavigationBarItem(
                  label: "Category",
                  icon: (controller.bottomNavbarIndex.value == 1)
                      ? const Icon(
                          Icons.category,
                          color: AppColor.orangeColor,
                        )
                      : const Icon(
                          Icons.category_outlined,
                          color: AppColor.blackColor,
                        )),
              BottomNavigationBarItem(
                  label: "Cart",
                  icon: (controller.bottomNavbarIndex.value == 2)
                      ? const Icon(
                          Icons.shopping_bag,
                          color: AppColor.orangeColor,
                        )
                      : const Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColor.blackColor,
                        )),
              BottomNavigationBarItem(
                label: "Profile",
                icon: (controller.bottomNavbarIndex.value == 3)
                    ? ImageIcon(
                        const AssetImage("assets/image/profilefilled.png"),
                        size: getVerticalSize(22),
                        color: AppColor.orangeColor,
                      )
                    : ImageIcon(
                        const AssetImage("assets/image/profile.png"),
                        size: getVerticalSize(22),
                        color: AppColor.blackColor,
                      ),
              )
            ]),
        body: controller.pages.elementAt(controller.bottomNavbarIndex.value),
      ),
    );
  }
}
