import 'package:get/get.dart';

import '../model/productbyGenderModel.dart';
import '../networking.dart/apiRepo.dart';
import '../utils/showLoadingIndicator.dart';

class CategoryByGenderController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool oninit = false.obs;

  RxList<ProductByGenderModel> allProductByGenderList =
      <ProductByGenderModel>[].obs;

  getCategoryAndProduct(String type, String category) async {
    try {
      isLoading.value = true;
      oninit.value == true ? null : showloadingIndicators();
      await ApiRepo().categoryWiseProduct(type, category).then((value) {
        allProductByGenderList.clear();
        allProductByGenderList.value = (value["data"] as List)
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
        allProductByGenderList.clear();
        allProductByGenderList.value = (value["data"] as List)
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
    super.onInit();
  }
}
