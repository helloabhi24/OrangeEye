import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import '../constant/imageConstantValue.dart';
import '../utils/customeAppBar.dart';
import '../utils/sizeHelper.dart';
import '../widgets/alertDialouge.dart';

class MainPage extends GetView<MainpageController> {
  MainPage({super.key});
  MainpageController mainpageController = Get.put(MainpageController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(color: AppColor.orangeColor),
                  child: Column(
                    children: [
                      CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/image/model1.png")),
                      height10,
                      AppText(
                        text: "arunkumarrao36987@gmail.com",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor,
                      )
                    ],
                  )),
              ...Iterable.generate(controller.drawerList.length).map(
                (e) => drawerTitles("${controller.drawerList[e]["images"]}",
                    "${controller.drawerList[e]["title"]}", () {
                  e == 5
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
            showUnselectedLabels: false,
            // selectedLabelStyle: const TextStyle(color: AppColor.orangeColor),
            // unselectedLabelStyle: const TextStyle(color: AppColor.blackColor),
            onTap: (value) => controller.bottomNavbarIndex.value = value,
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
                  label: "Profile", icon: Icon(Icons.person))
            ]),
        body: controller.pages.elementAt(controller.bottomNavbarIndex.value),
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
