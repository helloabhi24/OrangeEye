import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/model/genderWiseProductModel.dart';

import '../model/productbyGenderModel.dart';
import '../networking.dart/apiRepo.dart';
import '../routes/approutes.dart';
import '../utils/appColor.dart';
import '../utils/appText.dart';
import '../utils/cachedNetworkImage.dart';
import '../utils/showLoadingIndicator.dart';
import '../utils/sizeHelper.dart';
import '../widgets/productDetailPage.dart';
import 'homeController.dart';

class CategoryByGenderController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool oninit = false.obs;
  RxInt whichGlassesDataShow = 0.obs;
  RxString nameOfGlass = "".obs;

  RxList<ProductByGenderModel>? allProductByGenderList =
      <ProductByGenderModel>[].obs;

  RxList<ProductByGenderModel> allCategoryByProduct =
      <ProductByGenderModel>[].obs;

  RxList<GenderWiseProductModel>? genderWiseProductList =
      <GenderWiseProductModel>[].obs;

  RxList bestSellerList = [].obs;
  RxList<dynamic> getallCategoryList = [].obs;

  getCategoryAndProduct(String type, String category) async {
    try {
      isLoading.value = true;
      oninit.value == true ? null : showloadingIndicators();
      await ApiRepo().categoryWiseProduct(type, category).then((value) {
        allProductByGenderList!.clear();
        allProductByGenderList!.value = (value["data"] as List)
            .map((e) => ProductByGenderModel.fromJson(e))
            .toList();
        print("allProductByGenderList");
        print(allProductByGenderList);
        // allProductByGenderList.addAll(value["data"]);
      });
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    oninit.value == true ? null : hideLoading();
  }

  getCategory(String type, String category) async {
    try {
      showloadingIndicators();
      await ApiRepo().categoryWiseProduct(type, category).then((value) {
        allProductByGenderList!.clear();
        allProductByGenderList!.value = (value["data"] as List)
            .map((e) => ProductByGenderModel.fromJson(e))
            .toList();

        print("allProductByGenderList");
        print(allProductByGenderList);
        // allProductByGenderList.addAll(value["data"]);
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getallCategory(String type, String category) async {
    try {
      showloadingIndicators();
      await ApiRepo().categoryWiseProduct(type, category).then((value) {
        getallCategoryList.clear();
        // allProductByGenderList!.value = (value["data"] as List)
        //     .map((e) => ProductByGenderModel.fromJson(e))
        //     .toList();
        getallCategoryList.addAll(value["data"]);

        print("getallCategoryList");
        print(getallCategoryList);
        // allProductByGenderList.addAll(value["data"]);
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getCategoryData(String category) async {
    try {
      showloadingIndicators();
      await ApiRepo().categoryFilterData(category).then((value) {
        getallCategoryList.clear();
        // allProductByGenderList!.value = (value["data"] as List)
        //     .map((e) => ProductByGenderModel.fromJson(e))
        //     .toList();
        getallCategoryList.addAll(value["data"]);

        print("getallCategoryList");
        print(getallCategoryList);
        // allProductByGenderList.addAll(value["data"]);
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getBestseller(String category, String bestseller) async {
    try {
      showloadingIndicators();
      await ApiRepo().bestseller(category, bestseller).then((value) {
        bestSellerList.clear();
        bestSellerList.value = value["data"];
        print("bestseller");
        print(bestSellerList);
        genderWiseProductList!.clear();
        genderWiseProductList!.value = (value["data"] as List)
            .map((e) => GenderWiseProductModel.fromJson(e))
            .toList();
        print("genderWiseProductList");
        print(genderWiseProductList);
        // allProductByGenderList.addAll(value["data"]);
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getNewLaunches(String category, String bestseller) async {
    try {
      showloadingIndicators();
      await ApiRepo().newLaunches(category, bestseller).then((value) {
        bestSellerList.clear();
        bestSellerList.value = value["data"];
        print("bestseller");
        print(bestSellerList);
        genderWiseProductList!.clear();
        genderWiseProductList!.value = (value["data"] as List)
            .map((e) => GenderWiseProductModel.fromJson(e))
            .toList();
        print("genderWiseProductList");
        print(genderWiseProductList);
        // allProductByGenderList.addAll(value["data"]);
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  //   getOurRecommendation(String value) async {
  //   Map<String, dynamic> data = {};
  //   data["best_seller"] = value;
  //   try {
  //     isLoading.value = true;
  //     showloadingIndicators();

  //     await ApiRepo().getOurRecommendation(data).then((value) {
  //       print("dbkjasfk");
  //       finalHomepageProductList!.value = (value["data"] as List)
  //           .map((e) => ProductCategoryModel.fromJson(e))
  //           .toList();
  //       print("foinalhomepagelist");
  //       print(finalHomepageProductList![0].productAttributes![0].colorCode);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  //   isLoading.value = false;
  //   hideLoading();
  // }

  RxList<Map<String, String>> genderImgeList = <Map<String, String>>[
    {
      "image": "assets/image/men.png",
      "title": "Men",
      "id": "1",
    },
    {
      "image": "assets/image/img11.png",
      "title": "Women",
      "id": "2",
    },
    {
      "image": "assets/image/kids.png",
      "title": "child",
      "id": "3",
    },
    {
      "image": "assets/image/img11.png",
      "title": "Unisex",
      "id": "4",
    },
  ].obs;

  RxList<String> genderList = <String>[
    "Eyeglasses for Men",
    "Eyeglasses for Women",
    "Eyeglasses for child ",
    "Eyeglasses for Unisex",
  ].obs;

  @override
  void onInit() async {
    oninit.value = true;
    await getCategoryAndProduct("1", "1");
    // await getallCategory(
    //     whichGlassesDataShow.value == "Eyeglasses" ? "2" : "1", "1");
    super.onInit();
  }
}

class GogleCategoryWiseWidget extends StatelessWidget {
  final int? index;
  GogleCategoryWiseWidget({this.index, super.key});

  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.find();
    CategoryByGenderController categoryByGenderController = Get.find();

    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () async {
            await homepageController.getProductDetail(
                categoryByGenderController.getallCategoryList[index!]["slug"]);
            print("slug");
            print(
                categoryByGenderController.getallCategoryList[index!]["slug"]);
            Get.toNamed(Routes.PRODUCTDESCRIPTIONPAGE);
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.greyColor, width: 0.3)),
              // height: 172.h,
              width: 150.w,
              child: Stack(
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (cnt, index1) {
                            return Container(
                              margin: EdgeInsets.only(top: getVerticalSize(40)),
                              height: Get.height * 0.18,
                              color: AppColor.whiteColor,
                              child: cacheNetworkImage(
                                  imageUrl:
                                      "https://orangeeyewearindia.com/public/uploads/products/${categoryByGenderController.getallCategoryList[index!]["images"][index1]}",
                                  height: Get.height * 0.20,
                                  boxfit: BoxFit.cover,
                                  width: Get.width * 0.37,
                                  memCacheHeight: 220,
                                  ontap: () async {
                                    // Get.toNamed("/mainpage");
                                  }),
                            );
                          },
                          itemCount: categoryByGenderController
                              .getallCategoryList[index!]["images"].length,
                          shrinkWrap: true,
                        ),
                      ),

                      // Container(
                      //   height: Get.height * 0.10,
                      //   width: Get.width * 0.30,
                      //   child: Image.network(
                      //     "https://orangeeye.atally.com/public/uploads/products/${homepageController.allProduct[index!]["image1"]}",
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      // CustomAssetsImage(
                      //   height: 130.h,
                      //   width: 135.w,
                      //   imagePath: homepageController.gogleList[index!],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: getHorizontalSize(10)),
                                child: AppText(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    text: categoryByGenderController
                                        .getallCategoryList[index!]["name"]),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: getHorizontalSize(10)),
                                  child: Row(
                                    children: [
                                      AppText(
                                          textDecoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 12.sp,
                                          text:
                                              "₹ ${categoryByGenderController.getallCategoryList[index!]["mrp"]}"),
                                      getWidth(context, 0.020),
                                      AppText(
                                          fontSize: 12.sp,
                                          text:
                                              "₹ ${categoryByGenderController.getallCategoryList[index!]["price"]}"),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                      height18,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            categoryByGenderController
                                            .getallCategoryList[index!]
                                        ["color_code"] ==
                                    "null"
                                ? SizedBox()
                                : ColorDots(
                                    borderColor: AppColor.greyColor,
                                    dotsColor: Color(int.parse(
                                        "0xff${categoryByGenderController.getallCategoryList[index!]["color_code"].replaceFirst(r'#', "")}")),
                                  ),
                            SizedBox(
                              height: Get.height * 0.05,
                              // width: Get.width * 0.20,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index2) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getHorizontalSize(10)),
                                    child: ColorDots(
                                      borderColor: AppColor.greyColor,
                                      dotsColor: Color(int.parse(
                                          "0xff${categoryByGenderController.getallCategoryList[index!]["product_attributes"][index2]["color_code"]!.replaceFirst(r'#', "")}")),
                                    ),
                                  );
                                },
                                itemCount: categoryByGenderController
                                    .getallCategoryList[index!]
                                        ["product_attributes"]
                                    .length,
                                shrinkWrap: true,
                              ),
                            ),
                          ],
                        ),
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         ...Iterable.generate(homepageController
                      //                 .pageproductColorList.length)
                      //             .map(
                      //           (e) => ColorDots(
                      //             dotsColor: Color(int.parse(
                      //                 "0xff${homepageController.pageproductColorList[e][]["color_code"].replaceFirst(r'#', "")}")),
                      //           ),
                      //         ),
                      //       ],
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () async {
                            if (homepageController
                                .sharedPref.userToken.value.isEmpty) {
                              Get.toNamed(
                                Routes.OTPPHONENUMBERPAGE,
                              );
                              // Get.to(LoginScreen());
                              // loginDialouge(context);
                            } else {
                              await homepageController.updatedWhislist(
                                categoryByGenderController
                                    .getallCategoryList[index!]["id"]
                                    .toString(),
                              );
                              homepageController.isSelected.value =
                                  categoryByGenderController
                                      .getallCategoryList[index!]["id"]
                                      .toString();
                            }

                            // if (homepageController
                            //         .finalHomepageProductList![index!]
                            //         .wishlist ==
                            //     true) {
                            //   homepageController.isAddWishlist.value = false;
                            // } else {
                            //   homepageController.isAddWishlist.value = true;
                            // }

                            // homepageController.isAddWishlist.value =
                            //     homepageController
                            //         .finalHomepageProductList![index!]
                            //         .wishlist!;
                            // print("bool");
                            // print(homepageController.isAddWishlist.value);

                            // homepageController.isAddWishlist.value =
                            //     !homepageController.isAddWishlist.value;
                          },
                          child: Icon(
                              categoryByGenderController
                                                  .getallCategoryList[index!]
                                              ["wishlist"] ==
                                          true ||
                                      homepageController.isSelected.value ==
                                          categoryByGenderController
                                              .getallCategoryList[index!]["id"]
                                              .toString()
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: AppColor.orangeColor),
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
