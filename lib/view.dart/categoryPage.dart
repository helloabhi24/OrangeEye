import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/categoryPageController.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/view.dart/categoryWiseProductPage.dart';
import 'package:orangeeye/view.dart/newLaunchesProduct.dart';

import '../controller.dart/catByGenderController.dart';
import '../utils/sizeHelper.dart';

class CategoryPage extends GetView<CategorypageController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainpageController mainpageController = Get.find();
    CategoryByGenderController categoryByGenderController = Get.find();
    HomepageController homepageController = Get.find();
    return Obx(
      () => Scaffold(
        body: ListView(
          children: [
            ...Iterable.generate(
              mainpageController.getCategoryName.length,
            ).map((e) => Card(
                  elevation: 1,
                  child: ListTile(
                    onTap: () {
                      categoryByGenderController.getCategoryData(
                          mainpageController.getCategoryName[e].id.toString());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryWiseProductPage(
                                    glassName: mainpageController
                                        .getCategoryName[e].name,
                                  )));
                    },
                    title: AppText(
                      text: mainpageController.getCategoryName[e].name,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                    // trailing: SizedBox(
                    //   width: Get.width * 0.40,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       ...Iterable.generate(3).map((e) => Padding(
                    //             padding: const EdgeInsets.all(2.0),
                    //             child: CircleAvatar(
                    //               backgroundImage: AssetImage(
                    //                   homepageController.categoryList[e]),
                    //             ),
                    //           ))
                    //     ],
                    //   ),
                    // ),
                    // Icon(
                    //   Icons.arrow_forward_ios,
                    //   size: 14,
                    // ),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://orangeeyewearindia.com/public/uploads/categories/" +
                                mainpageController.getCategoryName[e].image)),
                  ),
                )),
            CarouselSlider(
                items: homepageController.homePageSliderList!
                    .map((element) => CachedNetworkImage(
                          imageBuilder: (context, imageProvider) => Container(
                            width: getHorizontalSize(4000),
                            // height: Get.height * 0.20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fitWidth),
                            ),
                          ),
                          imageUrl:
                              "https://orangeeyewearindia.com/public/uploads/${element.image.toString()}",
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: homepageController.homePageSliderList!.isEmpty
                      ? 0
                      : Get.height * 0.25,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.6,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeFactor: 0.2,
                  enlargeCenterPage: true,
                  onPageChanged: (v, c) {
                    homepageController.sliderIndex.value = v;
                  },
                  scrollDirection: Axis.horizontal,
                )),
            Card(
              elevation: 1,
              child: ListTile(
                  onTap: () async {
                    await homepageController.getOurRecommendation("1");
                    Get.to(NewLaunchesProduct(
                      glassName: "BestSeller",
                    ));
                  },
                  title: AppText(text: "BestSeller"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/image/img10.png"))),
            ),
            Card(
              elevation: 1,
              child: ListTile(
                  onTap: () async {
                    await homepageController.getOurRecommendation("");
                    Get.to(NewLaunchesProduct(
                      glassName: "New Arrival",
                    ));
                  },
                  title: AppText(text: "New Arrival"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/image/threegirls.png"))),
            ),
          ],
        ),
      ),
    );
  }
}
