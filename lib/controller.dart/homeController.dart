import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orangeeye/controller.dart/whishlistController.dart';
import 'package:orangeeye/model/allProdcutModel.dart';
import 'package:orangeeye/networking.dart/apiRepo.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customToast.dart';
import 'package:orangeeye/view.dart/cartPage.dart';
import '../model/differentTypeCategoryModel.dart';
import '../model/homePageSliderModel.dart';
import '../model/ourCollectionModel.dart';
import '../model/productAttriModel.dart';
import '../model/productDetailModel.dart';
import '../utils/sharedPref.dart';
import '../utils/showLoadingIndicator.dart';
import '../utils/sizeHelper.dart';

class HomepageController extends GetxController {
  RxInt sliderIndex = 0.obs;
  RxInt homePageSliderIndex = 0.obs;
  RxBool IsNewLaunches = false.obs;
  RxBool IsBestSeller = false.obs;
  RxBool isWhislist = false.obs;
  RxString selected = 'New Launches'.obs;
  RxString isSelected = ''.obs;
  RxString isLens = "".obs;
  RxBool isLoading = false.obs;
  RxInt dotIndex = 0.obs;
  RxInt colorDotsIndex = 0.obs;
  RxBool isAddWishlist = false.obs;
  RxBool isLensType = false.obs;
  RxBool isPrescriptionType = false.obs;
  RxBool isZeroPower = false.obs;
  RxBool isProgessive = false.obs;
  var page = "".obs;

  Pref sharedPref = Get.find();
  WishlistPageController wishlistPageController = Get.find();
  // RxBool IsBestSeller = false.obs

  RxList<HomePageSliderModel> homePageSliderList = <HomePageSliderModel>[].obs;

  RxList<DifferentTypeCategoryModel> getDifferentTypeProduct =
      <DifferentTypeCategoryModel>[].obs;

  // RxList<ProductAttribute> productColorList = <ProductAttribute>[].obs;

  RxList<ProductCategoryModel>? finalHomepageProductList =
      <ProductCategoryModel>[].obs;

  RxList<OurShopCollectionModel> shopOurCollectionList =
      <OurShopCollectionModel>[].obs;

  RxList<ProductDetailModel>? productDetailList = <ProductDetailModel>[].obs;

  RxList allProduct = [].obs;
  RxList imageList = [].obs;
  RxList allimageList = [].obs;
  var selectedImagePath = "".obs;
  RxString base64string = "".obs;
  RxString pathName = "".obs;

  Future getImage(ImageSource imageSource) async {
    var pickeImage = await ImagePicker().pickImage(source: imageSource);
    if (pickeImage != null) {
      File? img = await getCroppedImage(pickeImage);

      pathName.value = pickeImage.name;
      print("pathname");
      print(pathName.value);
      selectedImagePath.value = await img!.path;
      print("arunpath");
      print(selectedImagePath);
      File imagefile = File(selectedImagePath.value); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      base64string.value =
          base64.encode(imagebytes); //convert bytes to base64 string
      // await editPageController.getUpdateProfile(base64string.value);
      // await convertImageIntoByte();

      // print(selectedImagePath.value);
    } else {
      Get.snackbar("No Image Selected", "",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // getEditImage(ImageSource imageSource) async {
  //   XFile? pickeImage = await ImagePicker().pickImage(source: imageSource);
  //   if (pickeImage != null) {
  //     print("arun");
  //     File? img = await getCroppedImage(pickeImage);
  //     print(pickeImage);
  //     selectedImagePath.value = await img!.path;
  //     // await convertImageIntoByte();

  //     // print(editSliderList.length);
  //   } else {
  //     Get.snackbar("No Image Selected", "",
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }

  // Future convertImageIntoByte() async {
  //   Uint8List imageByte = await File(selectedImagePath.value).readAsBytesSync();
  //   base64string.value = base64.encode(imageByte);
  //   return base64string;
  // }

  getCroppedImage(XFile image) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: image.path);
    if (croppedFile == null) return null;
    return File(croppedFile.path);
  }

  getHomepageSlider() async {
    print("sliderLIST");
    try {
      await ApiRepo().getHomeSlider().then((value) {
        homePageSliderList.value = (value["data"] as List)
            .map((e) => HomePageSliderModel.fromJson(e))
            .toList();
        print("sliderLISRSD");
        print(homePageSliderList);
      });
    } catch (e) {
      print(e);
    }
  }

  getDifferntTypeProduct() async {
    try {
      await ApiRepo().getDifferentTypeProduct().then((value) {
        getDifferentTypeProduct.value = (value["data"]["frame_shape"] as List)
            .map((e) => DifferentTypeCategoryModel.fromJson(e))
            .toList();
        print("sliderLISRSD");
        print(getDifferentTypeProduct);
      });
    } catch (e) {
      print(e);
    }
  }

  getOurCollection() async {
    try {
      // showloadingIndicators();
      await ApiRepo().getOurCollection().then((value) {
        shopOurCollectionList.clear();
        shopOurCollectionList.value = (value["data"] as List)
            .map((e) => OurShopCollectionModel.fromJson(e))
            .toList();
        print("shopoURcOLLECTION");
        print(shopOurCollectionList);
      });
    } catch (e) {
      print(e);
    }
    // hideLoading();
  }

  getOurRecommendation(String value) async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["best_seller"] = value;
    sharedPref.userToken.value.isEmpty
        ? null
        : data["user_id"] = sharedPref.userToken.value;
    try {
      isLoading.value = true;
      showloadingIndicators();

      await ApiRepo().getOurRecommendation(data).then((value) {
        print("dbkjasfk");
        finalHomepageProductList!.value = (value["data"] as List)
            .map((e) => ProductCategoryModel.fromJson(e))
            .toList();
        print("foinalhomepagelist");
        print(finalHomepageProductList![0].productAttributes![0].colorCode);
      });
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    hideLoading();
  }

  getProductDetail(String value) async {
    Map<String, dynamic> data = {};
    data["slug"] = value;
    try {
      isLoading.value = true;
      showloadingIndicators();

      await ApiRepo().getProductDetail(data).then((value) {
        if (value["status"] == "success") {
          productDetailList!.value = (value["data"] as List)
              .map((e) => ProductDetailModel.fromJson(e))
              .toList();
          print("productDetailModel");
          print(productDetailList);

          // allimageList.clear();
          // imageList.clear();
          // imageList.addAll(value["data"]);
          // allimageList.addAll(value["data"][0]["images"]);

          // print("allimage list");
          // print(allimageList);
          // productColorList.value =
          //     (value["data"][0]["product_attributes"] as List)
          //         .map((e) => ProductAttribute.fromJson(e))
          //         .toList();
        }
        print(value);
      });
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    hideLoading();
  }

  colorWiseProduct(String value) async {
    Map<String, dynamic> data = {};
    data["slug"] = value;
    try {
      isLoading.value = true;
      showloadingIndicators();

      await ApiRepo().getProductDetail(data).then((value) {
        if (value["status"] == "success") {
          allimageList.clear();
          allimageList.addAll(value["data"][0]["product_attributes"]);
          print(allimageList);
        }
        print(value);
      });
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    hideLoading();
  }

  updatedWhislist(String value) async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["product_id"] = value;
    data["user_id"] = sharedPref.userToken.value;
    print("product id");
    print(data["product_id"]);
    print(data["user_id"]);

    try {
      //  isLoading.value = true;
      showloadingIndicators();

      await ApiRepo().updatedWishlist(data).then((value) {
        if (value["status"] == "success") {
          print(value);
          // isWhislist.value = true;
        }
        print(value);
      });
      await wishlistPageController.getWishlistProduct();
    } catch (e) {
      print(e);
    }
    // isLoading.value = false;
    hideLoading();
  }

  getAddToCart(String size, String color, String productId, String qty,
      String prescreption) async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    data["size"] = size;
    data["color"] = "";
    data["product_id"] = productId;
    data["lens"] = "12";
    data["qty"] = qty;
    data["prescription"] = prescreption;

    print(data["user_id"]);
    print(data["size"]);
    print(data["color"]);
    print(data["product_id"]);
    print(data["lens"]);
    print(data["qty"]);
    print(data["prescription"]);

    try {
      isLoading.value = true;
      showloadingIndicators();
      await ApiRepo().addToCart(data).then((value) {
        if (value["status"] == "success") {
          print("value");
          print(value);
          customeToast(value["message"]);
        } else {
          customeToast("something went wrong");
        }

        // finalHomepageProductList!.value = (value["data"] as List)
        //     .map((e) => ProductCategoryModel.fromJson(e))
        //     .toList();
        // print("foinalhomepagelist");
        // print(finalHomepageProductList![0].productAttributes![0].colorCode);
      });
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    hideLoading();
  }

  @override
  void onInit() async {
    await getHomepageSlider();
    await getOurRecommendation("");
    await getOurCollection();
    await getDifferntTypeProduct();
    await sharedPref.getUserId();

    super.onInit();
  }

  RxList<String> backgroudSliderList = [
    "assets/image/model1.png",
    "assets/image/model2.png",
    "assets/image/model3.png",
    "assets/image/model4.png",
    "assets/image/model5.png",
  ].obs;
  RxList<Widget> sliderList = [
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model1.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model2.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model3.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model4.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model5.png",
    ),
  ].obs;

  RxList<Widget> sliderList2 = [
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model1.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model2.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model3.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model4.png",
    ),
    const SliderWidget(
      isPadding: true,
      isCircularRadius: true,
      image: "assets/image/model5.png",
    ),
  ].obs;

  RxList<String> gogleList = [
    "assets/image/g1.png",
    "assets/image/g2.png",
    "assets/image/g3.png",
    "assets/image/g4.png",
    "assets/image/g5.png",
    "assets/image/g3.png",
    "assets/image/g4.png",
    "assets/image/g5.png",
  ].obs;

  RxList<String> categoryList = [
    "assets/image/g1.png",
    "assets/image/g2.png",
    "assets/image/g3.png",
  ].obs;
}

class SliderWidget extends StatelessWidget {
  final String image;
  final bool isPadding;
  final bool isCircularRadius;
  const SliderWidget(
      {this.isCircularRadius = false,
      this.isPadding = false,
      this.image = "",
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (isPadding == true)
          ? EdgeInsets.only(top: Get.height * 0.050)
          : const EdgeInsets.only(top: 0),
      child: Container(
        height: Get.height * 0.30,
        width: getHorizontalSize(5414),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(5, 5),
              color: AppColor.whiteColor,
              blurRadius: 10.0,
            ),
          ],
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(image)),
          borderRadius:
              BorderRadius.circular(isCircularRadius == true ? 10 : 0),
        ),
      ),
    );
  }
}

enum buttonValue { NewLaunches, BestSeller }
