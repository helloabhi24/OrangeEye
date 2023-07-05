import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/controller.dart/orderPageController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/showDialouge.dart';
import 'package:orangeeye/view.dart/categoryWiseProductPage.dart';
import '../constant/imageConstantValue.dart';
import '../controller.dart/catByGenderController.dart';
import '../utils/customeAppBar.dart';
import '../utils/sizeHelper.dart';

class MainPage extends GetView<MainpageController> {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    CategoryByGenderController categoryByGenderController = Get.find();
    HomepageController homepageController = Get.find();
    OrderpageController orderpageController = Get.find();
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          homepageController.sharedPref.userToken.value.isEmpty
              ? Get.back()
              : SystemNavigator.pop();
          return false;
        },
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                        color: AppColor.greyColor.withOpacity(0.5)),
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
                SizedBox(
                  height: Get.height * 0.75,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        customGlassesExpansionTile("Category", context),
                        customExpansionTile(
                            "Bestseller", "Men", "Women", "Kids", () async {
                          await categoryByGenderController.getBestseller(
                              "0", "1");
                          Get.toNamed(Routes.GENDERWISEPRODUCTPAGE,
                              arguments: {"type": "Bestseller", "id": "1"});
                              
                        }, () async {
                          await categoryByGenderController.getBestseller(
                              "2", "1");
                          Get.toNamed(Routes.GENDERWISEPRODUCTPAGE,
                              arguments: {"type": "Bestseller", "id": "2"});
                        }, () async {
                          await categoryByGenderController.getBestseller(
                              "3", "1");
                          Get.toNamed(Routes.GENDERWISEPRODUCTPAGE,
                              arguments: {"type": "Bestseller", "id": "3"});
                        }),
                        customExpansionTile(
                            "New launches", "Men", "Women", "Kids", () async {
                          await categoryByGenderController.getNewLaunches(
                              "1", "1");
                          Get.toNamed(Routes.GENDERWISEPRODUCTPAGE,
                              arguments: {"type": "New Launches", "id": "1"});
                        }, () async {
                          await categoryByGenderController.getNewLaunches(
                              "2", "1");
                          Get.toNamed(Routes.GENDERWISEPRODUCTPAGE,
                              arguments: {"type": "New Launches", "id": "2"});
                        }, () async {
                          await categoryByGenderController.getNewLaunches(
                              "3", "1");
                          Get.toNamed(Routes.GENDERWISEPRODUCTPAGE,
                              arguments: {"type": "New Launches", "id": "3"});
                        }),
                        ...Iterable.generate(controller.drawerList.length).map(
                          (e) => drawerTitles(
                              "${controller.drawerList[e]["images"]}",
                              "${controller.drawerList[e]["title"]}", () async{
                             await  orderpageController.getPlacedOrder();
                            e == 5
                                ? showSocialMediaDialog(context)
                                : Get.to(controller.drawerList[e]["page"]);
                          await orderpageController.getPrescription();
                                
                              
                          }),
                        )
                      ],
                    ),
                  ),
                )
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
                print("index");
                print(controller.bottomNavbarIndex.value);
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
          body: controller.pages[controller.bottomNavbarIndex.value]
        ),
      ),
    );
  }

  customExpansionTile(String title, String man, String women, String kids,
      Function manOntap, Function WomenOntap, Function kidsOntap) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.greyColor.withOpacity(0.0)))),
      child: ExpansionTile(
        textColor: AppColor.blackColor,
        iconColor: AppColor.blackColor,
        childrenPadding: EdgeInsets.only(
          left: getHorizontalSize(17),
        ),
        title: AppText(
          text: title,
          fontSize: 15.sp,
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
                    GestureDetector(
                      onTap: () {
                        manOntap();
                      },
                      child: AppText(
                        text: man,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    GestureDetector(
                      onTap: () {
                        WomenOntap();
                      },
                      child: AppText(
                        text: women,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(10),
                    ),
                    GestureDetector(
                      onTap: () {
                        kidsOntap();
                      },
                      child: AppText(
                        text: kids,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  customGlassesExpansionTile(String title, context) {
    CategoryByGenderController categoryByGenderController = Get.find();
    return Obx(
      () => Container(
        width: Get.width,
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: AppColor.greyColor.withOpacity(0.0)))),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
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
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
          children: [
            ...Iterable.generate(controller.getGlassesList.length)
                .map((e1) => Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(10)),
                            title: AppText(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              text: controller.getGlassesList[e1].name,
                            ),
                            children: [
                              ...Iterable.generate(
                                      controller.getCategoryName.length)
                                  .map((e) => Align(
                                        alignment: Alignment.centerLeft,
                                        child: GestureDetector(
                                          onTap: () {
                                            categoryByGenderController
                                                .getallCategory(
                                                    controller
                                                        .getGlassesList[e1].id
                                                        .toString(),
                                                    controller
                                                        .getCategoryName[e].id
                                                        .toString());
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      CategoryWiseProductPage(
                                                    glassName: controller
                                                        .getGlassesList[e1]
                                                        .name,
                                                  ),
                                                ));
                                            // Get.toNamed(
                                            //   Routes.CATEGORYWISEPRODUCT,
                                            // );

                                            //   // arguments: {
                                            //   //   "type": controller
                                            //   //       .getGlassesList[e1].name
                                            //   //       .toString(),
                                            //   //   // "id": "1"
                                            //   // }
                                            // );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: AppText(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              text: controller
                                                  .getCategoryName[e].name,
                                            ),
                                          ),
                                        ),
                                      ))
                            ],
                          )),
                    )),
          ],
        ),
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
