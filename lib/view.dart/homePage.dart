import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/catByGenderController.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/customeDrawer.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/view.dart/paymentSuccessfulPage.dart';
import 'package:orangeeye/widgets/homepageWidget.dart';

class HomePage extends GetView<HomepageController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MainpageController mainpageController = Get.find();
    CategoryByGenderController categoryByGenderController = Get.find();

    return Obx(
      () => Scaffold(
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageSlider(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(onTap: (){
                      Get.to(PaymentPage());
                    },
                      child: AppText(
                        text: "Discover All",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    height10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...Iterable.generate(mainpageController
                                .getglassesHomePageList.length)
                            .map((e) => GlassCategory(
                                  title: mainpageController
                                      .getglassesHomePageList[e]["name"],
                                  image:
                                      "https://orangeeyewearindia.com/public/" +
                                          mainpageController
                                                  .getglassesHomePageList[e]
                                              ["glass"],
                                  ontap: () async {
                                    await categoryByGenderController.getallCategory(
                                        mainpageController
                                                        .getglassesHomePageList[
                                                    e]["name"] ==
                                                "Sunglasses"
                                            ? "2"
                                            : "1",
                                        mainpageController
                                            .getglassesHomePageList[e]["id"]
                                            .toString());

                                    categoryByGenderController
                                            .nameOfGlass.value =
                                        mainpageController
                                            .getglassesHomePageList[e]["name"];
                                     
                                    Get.toNamed(Routes.CATEGORYBYGENDERPAGE,
                                        arguments: {
                                          "id": mainpageController
                                              .getglassesHomePageList[e]["id"],
                                        });
                                  },
                                ))
                      ],
                    ),
                    getheight(context, 0.030),
                    GestureDetector(onTap: (){
                      print("arun");
                      mainpageController.getBlogs();
                    },
                      child: AppText(
                        text: "Our Recommendation",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: AppColor.orangeColor,
                                value: "New Launches",
                                groupValue: controller.selected.value,
                                onChanged: (v) async {
                                  controller.selected.value = v!;
                                  controller.selected.value == true;
                                  controller.getOurRecommendation("");
                                }),
                            AppText(
                              color: AppColor.blackColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              text: "New Launches",
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: AppColor.orangeColor,
                                value: "Best Seller",
                                groupValue: controller.selected.value,
                                onChanged: (v) async {
                                  controller.selected.value = v!;
                                  await controller.getOurRecommendation("1");
                                }),
                            AppText(
                              color: AppColor.blackColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              text: "Best Seller",
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              getheight(context, 0.015),
              GogleSlider(),
              getheight(context, 0.015),
              GogleVariousCategory(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () async {
                    await controller.getDifferntTypeProduct();
                  },
                  child: AppText(
                    text: "Shop Our Collections",
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ShopOurCollectionWidget(),
              CustomAssetsImage(
                imagePath: "assets/image/contactimg.png",
              ),
              // Container(
              //   alignment: Alignment.topCenter,
              //   width: Get.width,
              //   child: Wrap(
              //     runAlignment: WrapAlignment.center,
              //     spacing: 10,
              //     children: [
              //       ...Iterable.generate(controller.homepageImageList.length)
              //           .map((e) => Container(
              //                 margin: EdgeInsets.all(5),
              //                 height: Get.height * 0.20,
              //                 width: Get.width * 0.42,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(0),
              //                     border: Border.all(
              //                         color:
              //                             AppColor.greyColor.withOpacity(0.4)),
              //                     image: DecorationImage(
              //                         image: AssetImage(
              //                             controller.homepageImageList[e]))),
              //               ))
              //     ],
              //   ),
              // ),
              Container(
                height: Get.height * 0.04,
                width: Get.width,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColor.greyColor.withOpacity(0.4))),
                child: Row(
                  children: [
                    width10,
                    Expanded(
                      child: AppText(
                            text: "orangeeyewearindia@gmail.com",
                            fontSize: 11.sp,
                          ),
                    ),
                    VerticalDivider(
                      thickness: 1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            size: 14,
                          ),
                          AppText(
                            text: "+911234567895",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  filterCategory(
    String title,
    Function ontap,
  ) {
    return Row(
      children: [
        Radio(
            activeColor: AppColor.orangeColor,
            value: buttonValue.BestSeller,
            groupValue: buttonValue,
            onChanged: (v) {
              ontap(v);
            }),
        AppText(
          color: AppColor.blackColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          text: title,
        )
      ],
    );
  }
}
