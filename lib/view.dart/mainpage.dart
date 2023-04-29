import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import '../constant/imageConstantValue.dart';
import '../utils/customeAppBar.dart';
import '../utils/sizeHelper.dart';
import '../widgets/alertDialouge.dart';

class MainPage extends GetView<MainpageController> {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(color: AppColor.orangeColor),
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/image/img10.png")),
                        height10,
                        SizedBox(
                          width: Get.width * 0.50,
                          child: AppText(
                            textAlign: TextAlign.center,
                            text: controller.phoneNumber.value.isEmpty
                                ? "No phone number"
                                : controller.phoneNumber.value,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                          ),
                        )
                      ],
                    )),
                customExpansionTile("Eyeglass", "Men", "Women", "Kids"),
                customExpansionTile("Sunglass", "Men", "Women", "Kids"),
                customExpansionTile("Bestseller", "Men", "Women", "Kids"),
                customExpansionTile("New launches", "Men", "Women", "Kids"),
                ...Iterable.generate(controller.drawerList.length).map(
                  (e) => drawerTitles("${controller.drawerList[e]["images"]}",
                      "${controller.drawerList[e]["title"]}", () {
                    e == 6
                        ? showMyDialog(context)
                        : Get.to(controller.drawerList[e]["page"]);
                  }),
                ),
              ],
            ),
          ),
          appBar: CustomAppbar.customeAppbar(
              isImage: true, imagePath: ImageConstant.APPLOGO),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.bottomNavbarIndex.value,
              selectedItemColor: AppColor.orangeColor,
              unselectedItemColor: AppColor.greyColor,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              // selectedLabelStyle: const TextStyle(color: AppColor.orangeColor),
              // unselectedLabelStyle: const TextStyle(color: AppColor.blackColor),
              onTap: (value) {
                controller.bottomNavbarIndex.value = value;
                controller.isshowAppbar.value = true;
              },
              items: [
                BottomNavigationBarItem(
                    label: "Home",
                    icon: const Icon(
                      Icons.home,
                    )),
                BottomNavigationBarItem(
                    label: "Category",
                    icon: const Icon(
                      Icons.category,
                    )),
                BottomNavigationBarItem(
                    label: "Cart", icon: Icon(Icons.shopping_bag)),
                BottomNavigationBarItem(
                    label: "Account", icon: Icon(Icons.person))
              ]),
          body: controller.pages.elementAt(controller.bottomNavbarIndex.value),
        ),
      ),
    );
  }

  customExpansionTile(String title, String man, String women, String kids) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.greyColor.withOpacity(0.0)))),
      child: ExpansionTile(
        // tilePadding: EdgeInsets.symmetric(vertical: getVerticalSize(1)),
        // collapsedBackgroundColor: blackColor,
        // backgroundColor: blackColor,
        textColor: AppColor.blackColor,
        iconColor: AppColor.blackColor,
        childrenPadding: EdgeInsets.only(
          left: getHorizontalSize(17),
        ),
        title: AppText(
          text: title,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: man,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    AppText(
                      text: women,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    AppText(
                      text: kids,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  drawerTitles(String image, String text, Function ontap) {
    return ListTile(
      onTap: () {
        ontap();
      },
      title: AppText(
        text: text,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: AppColor.orangeColor,
      ),
    );
  }
}
