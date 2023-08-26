import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/controller.dart/whishlistController.dart';
import 'package:orangeeye/model/getCartModel.dart';
import 'package:orangeeye/model/otherProductShapeModel.dart';
import 'package:orangeeye/networking.dart/apiRepo.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customToast.dart';
import 'package:orangeeye/view.dart/cartPage.dart';
import '../model/FrameMaterialModel.dart';
import '../model/differentTypeCategoryModel.dart';
import '../model/fiftyProductsModel.dart';
import '../model/getLensesCategoryModel.dart';
import '../model/homePageSliderModel.dart';
import '../model/ourCollectionModel.dart';
import '../model/productDetailModel.dart';
import '../model/shopCollectionModel.dart';
import '../utils/sharedPref.dart';
import '../utils/showLoadingIndicator.dart';
import '../utils/sizeHelper.dart';

class HomepageController extends GetxController {
  RxInt sliderIndex = 0.obs;
  RxInt adsliderIndex = 0.obs;
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
  RxInt indexOfGetLenses = 0.obs;
  RxInt lensesid = 0.obs;
  RxInt sumResult = 0.obs;
  RxInt subTotal = 0.obs;
  RxBool isAddWishlist = false.obs;
  RxBool isLensType = false.obs;
  RxBool isPrescriptionType = false.obs;
  RxBool isZeroPower = false.obs;
  RxBool isProgessive = false.obs;
  RxString chooseSelected = ''.obs;
  RxString selectColorCode = ''.obs;
  RxString base64Images = ''.obs;
  var page = "".obs;
  RxString taxes = "".obs;
  RxString grandtotal = "".obs;
  RxString productSubtotal = "".obs;
  RxBool isLogin = false.obs;

  RxString productType = "".obs;

  RxBool showBackToTop = false.obs;
  late ScrollController scrollController;

  RxList<FrameMaterialModel> freameMaterialList = <FrameMaterialModel>[].obs;
  // late VideoPlayerController videoPlayerController;

  // late Future<void> intiallizeVideoPlayerController;

  Pref sharedPref = Get.find();
  WishlistPageController wishlistPageController = Get.find();
  AddNewAddressController addNewAddressController = Get.find();
  // RxBool IsBestSeller = false.obs

  RxList<HomePageSliderModel>? homePageSliderList = <HomePageSliderModel>[].obs;

  RxList<OtherProductShapeModel>? productShapeList =
      <OtherProductShapeModel>[].obs;

  RxList<ShopCollectionModel>? shopCollectionList = <ShopCollectionModel>[].obs;

  RxList<DifferentTypeCategoryModel> getDifferentTypeProduct =
      <DifferentTypeCategoryModel>[].obs;

  RxList<GetLensesByCategoryModel> getLensesByCategorey =
      <GetLensesByCategoryModel>[].obs;

  // RxList<ProductAttribute> productColorList = <ProductAttribute>[].obs;getCartList

  RxList<OtherProductShapeModel>? finalHomepageProductList =
      <OtherProductShapeModel>[].obs;

  RxList<FiftyProductModel>? fiftyProductsList = <FiftyProductModel>[].obs;

  RxList<GetCartModel>? getCartList = <GetCartModel>[].obs;

  RxList<OurShopCollectionModel> shopOurCollectionList =
      <OurShopCollectionModel>[].obs;

  RxList<ProductDetailModel>? productDetailList = <ProductDetailModel>[].obs;

  RxList likeUpdatedList = [].obs;
  RxList genderLikeUpdatedList = [].obs;

  RxList allProduct = [].obs;
  RxList imageList = [].obs;
  RxList adsList = [].obs;
  RxList allimageList = [].obs;
  var selectedImagePath = "".obs;
  var selectedImagePathinProfile = "".obs;
  RxString base64string = "".obs;
  RxString pathName = "".obs;

  RxString base64stringforProfile = "".obs;
  RxString pathNameforProfile = "".obs;

  RxString base64stringforInvoice = "".obs;
  RxString pathNameforInvoice = "".obs;
  var selectedImagePathinInvoice = "".obs;

  Future getImage(ImageSource imageSource) async {
    var pickeImage = await ImagePicker().pickImage(source: imageSource);
    if (pickeImage != null) {
      File? img = await getCroppedImage(pickeImage);
      pathName.value = pickeImage.name;
      selectedImagePath.value = await img!.path;

      File imagefile = File(selectedImagePath.value); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      base64string.value =
          "data:image/jpeg;base64," + base64.encode(imagebytes);
      print("byteImage");
      // print(base64string.value); //convert bytes to base64 string
      // await editPageController.getUpdateProfile(base64string.value);
      // await convertImageIntoByte();

      // print(selectedImagePath.value);
    } else {
      customeToast("No Image Selected");
    }
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 3), curve: Curves.linear);
  }

  Future getImageforInvoice(ImageSource imageSource) async {
    var pickeImage = await ImagePicker().pickImage(source: imageSource);
    if (pickeImage != null) {
      File? img = await getCroppedImage(pickeImage);
      pathNameforInvoice.value = pickeImage.name;
      selectedImagePathinInvoice.value = await img!.path;

      File imagefile =
          File(selectedImagePathinInvoice.value); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      base64stringforInvoice.value =
          "data:image/jpeg;base64," + base64.encode(imagebytes);
      print("byteImage");
      // print(base64string.value); //convert bytes to base64 string
      // await editPageController.getUpdateProfile(base64string.value);
      // await convertImageIntoByte();

      // print(selectedImagePath.value);
    } else {
      customeToast("No Image Selected");
    }
  }

  Future getImageforProfile(ImageSource imageSource) async {
    var pickeImage = await ImagePicker().pickImage(source: imageSource);
    if (pickeImage != null) {
      File? img = await getCroppedImage(pickeImage);
      pathNameforProfile.value = pickeImage.name;
      selectedImagePathinProfile.value = await img!.path;

      File imagefile =
          File(selectedImagePathinProfile.value); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      base64stringforProfile.value =
          "data:image/jpeg;base64," + base64.encode(imagebytes);
      print("byteImage");
      // print(base64stringforProfile.value); //convert bytes to base64 string
      // await editPageController.getUpdateProfile(base64string.value);
      // await convertImageIntoByte();

      // print(selectedImagePath.value);
    } else {
      customeToast("No Image Selected");
    }
  }

  uploadPrescriptions() async {
    Map<String, dynamic> data = {};
    // data["pincode"] = zip;
    // data["city"] = city;
    try {
      showloadingIndicators();
      await ApiRepo().uploadPrescription(data).then((value) {
        print(value["status"]);
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getframeMaterial(String id) async {
    try {
      showloadingIndicators();
      await ApiRepo()
          .frameMaterial(
        id,
      )
          .then((value) {
        // freameMaterialList.clear();

        // bestSellerList.clear();
        // bestSellerList.value = value["data"];
        // print("bestseller");
        // print(bestSellerList);
        // genderWiseProductList!.clear();
        freameMaterialList.value = (value["data"] as List)
            .map((e) => FrameMaterialModel.fromJson(e))
            .toList();
        print(freameMaterialList.value);
        // print("genderWiseProductList");
        // print(genderWiseProductList);
        // allProductByGenderList.addAll(value["data"]);
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

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
        homePageSliderList!.value = (value["data"] as List)
            .map((e) => HomePageSliderModel.fromJson(e))
            .toList();
        print("sliderLISRSD**********************");
        print(homePageSliderList);
      });
    } catch (e) {
      print(e);
    }
  }

  subtotal() {
    subTotal.value =
        getCartList!.fold(0, (sum, element) => sum + element.productSubtotal!);

    print("subtotal****************");
    print(subTotal.value);
  }

  sum() {
    sumResult.value =
        getCartList!.fold(0, (sum, element) => sum + element.subtotal!);
    print("someresult");
    print(sumResult.value);
    // sumResult.value = getCartList!.fold(
    //     0, (previousValue, element) => previousValue + element.totalPrice!);
    // print("value");
    // print(sumResult.value);
  }

  getAdsUrl() async {
    print("sliderLIST");
    try {
      await ApiRepo().adsVideo().then((value) {
        adsList.add(value["video"]);
        print("advideo");
        print(adsList.length);
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
        print("sliderframetype");
        print(getDifferentTypeProduct);
      });
    } catch (e) {
      print(e);
    }
  }

  getLensesByCategory() async {
    try {
      await ApiRepo().getLensesByCategory().then((value) {
        getLensesByCategorey.value = (value["data"] as List)
            .map((e) => GetLensesByCategoryModel.fromJson(e))
            .toList();
        print("GETLENSESEBYCATEGORY");
        print(getLensesByCategorey);
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
            .map((e) => OtherProductShapeModel.fromJson(e))
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

  getFiftyProducts() async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["latest"] = 1;
    data["limit"] = 30;

    sharedPref.userToken.value.isEmpty
        ? null
        : data["user_id"] = sharedPref.userToken.value;
    try {
      isLoading.value = true;
      showloadingIndicators();

      await ApiRepo().getFiftyProduct(data).then((value) {
        print("dbkjasfk");
        fiftyProductsList!.value = (value["data"] as List)
            .map((e) => FiftyProductModel.fromJson(e))
            .toList();
        print(
            "foinalhomepagelistgdfsghfdsghsdfhfghdfhshfdsh555555555555555555555555");
        // print(fiftyProductsList!.value);
        // print(fiftyProductsList![0].productAttributes![0].colorCode);
      });
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    hideLoading();
  }

  getProductDetail(String value) async {
    print("slug");
    print(value);
    Map<String, dynamic> data = {};
    data["slug"] = value;
    data["user_id"] = sharedPref.userToken.value;
    try {
      isLoading.value = true;
      showloadingIndicators();
      await ApiRepo().getProductDetail(data).then((value) {
        if (value["status"] == "success") {
          productDetailList!.value = (value["data"] as List)
              .map((e) => ProductDetailModel.fromJson(e))
              .toList();
          print("this is the product type in the products");
          productType.value = productDetailList![0].producttype.name;
          print(productDetailList![0].producttype.name);
          print(productType.value);
          print("productDetailModel");
          print(productDetailList);
          selectColorCode.value =
              productDetailList![0].productAttributes![0].id.toString();
          // print("this is description in the products");
          // print(productDetailList![0].shortDescription);
          // print("SHow data from the table of description");
          // print(Html(
          //   data: productDetailList![0].shortDescription,
          //   tagsList: ["strong"],
          // ));
          // print("This is html view");

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

  getAllData(String value) async {
    print("arunss");
    Map<String, dynamic> data = {};
    data["best_seller"] = "";
    data["frame_shape"] = value;
    data["frame_type"] = "";
    // data["frame_type"] = value;
    data["user_id"] = "";
    try {
      showloadingIndicators();
      await ApiRepo().getOurRecommendation(data).then((value) {
        if (value["status"] == "success") {
          productShapeList!.value = (value["data"] as List)
              .map((e) => OtherProductShapeModel.fromJson(e))
              .toList();
          print(productShapeList);
        }
        print(value);
      });
    } catch (e) {
      print(e);
    }

    hideLoading();
  }

  getShopCollectionData(String value) async {
    print("arunss");
    Map<String, dynamic> data = {};
    data["best_seller"] = "";
    data["frame_shape"] = "";
    data["frame_type"] = "";
    data["frame_material"] = value;
    sharedPref.userToken.value.isEmpty
        ? null
        : data["user_id"] = sharedPref.userToken.value;

    // data["user_id"] = "";
    try {
      showloadingIndicators();
      await ApiRepo().getOurRecommendation(data).then((value) {
        if (value["status"] == "success") {
          shopCollectionList!.clear();
          shopCollectionList!.value = (value["data"] as List)
              .map((e) => ShopCollectionModel.fromJson(e))
              .toList();
          print(shopCollectionList);
        }
        print(value);
      });
    } catch (e) {
      print(e);
    }

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
      // showloadingIndicators();

      await ApiRepo().updatedWishlist(data).then((value) {
        if (value["status"] == "success") {
          print("get,shdkhsfdkhkfh");
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
    // hideLoading();
  }

  getAddToCart(
    String size,
    String color,
    String productId,
    String qty,
    String prescreption,
  ) async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    data["size"] = size;
    data["color"] = color;
    data["product_id"] = productId;
    data["lens"] = lensesid.value;
    data["qty"] = qty;
    data["prescription"] = prescreption;
    print("Here is add to cart");
    print(data["user_id"]);
    print(data["size"]);
    print(data["color"]);
    print(data["product_id"]);
    print(data["lens"]);
    print(data["qty"]);
    print(data["prescription"]);

    try {
      // isLoading.value = true;
      showloadingIndicators();
      await ApiRepo().addToCart(data).then((value) async {
        if (value["status"] == "success") {
          await getCarts();
          // subtotal();
          await Get.to(CartPage());

          // sum();
          customeToast(value["msg"]);
        } else {
          customeToast(value["msg"]);
          // customeToast("something went wrong");
        }
      });
    } catch (e) {
      print(e);
    }
    // isLoading.value = false;
    hideLoading();
  }

  getProductIncreement(
    String productId,
    int qty,
  ) async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    data["product_id"] = productId;
    data["qty"] = qty.toString();
    print(data["user_id"]);
    print(data["product_id"]);
    print(data["qty"]);
    try {
      showloadingIndicators();
      await ApiRepo().addToCart(data).then((value) async {
        if (value["status"] == "success") {
          getCarts();
          // Get.to(CartPage());
          // sum();
          // print("value");
          // print(value);
          // customeToast(value["msg"]);
        } else {
          customeToast(value["msg"]);
          // customeToast("something went wrong");
        }
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getCarts() async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    print("UserToken");
    print(data["user_id"]);
    try {
      // isLoading.value = true;
      // showloadingIndicators();
      await ApiRepo().getAddtocart(data).then((value) {
        if (value["status"] == "success") {
          isLogin.value = true;
          getCartList!.value = (value["data"] as List)
              .map((e) => GetCartModel.fromJson(e))
              .toList();
          taxes.value = value["tax"].toString();
          grandtotal.value = value["grandtotal"].toString();
          productSubtotal.value = value["subtotal"].toString();
          subtotal();
          // Get.to(CartPage());
          print("value");
          print(getCartList!.length);
          // customeToast(value["msg"]);
        } else {
          customeToast(value["msg"]);
          isLogin.value = false;
        }
      });
    } catch (e) {
      print(e);
    }
    // isLoading.value = false;
    // hideLoading();
  }

  FirebaseDynamicLinks firebaseDynamicLinks = FirebaseDynamicLinks.instance;

  Future createDynamicLink(
    bool shorts,
    String id,
  ) async {
    String linkMessage;
    // isCreatingLink.value = true;
    final DynamicLinkParameters dynamicLinkParameters = DynamicLinkParameters(
        link: Uri.parse("https://www.liftkaro.com/storyData?id=${id}"),
        uriPrefix: "https://liftkaro.page.link",
        androidParameters: const AndroidParameters(
            packageName: "com.example.orangeeye", minimumVersion: 125));

    Uri url;
    if (shorts) {
      final ShortDynamicLink parameter =
          await firebaseDynamicLinks.buildShortLink(dynamicLinkParameters);
      url = parameter.shortUrl;
    } else {
      url = await firebaseDynamicLinks.buildLink(dynamicLinkParameters);
    }
    linkMessage = url.toString();
    return linkMessage;
  }

  Future initDynamic() async {
    firebaseDynamicLinks.onLink.listen((event) {
      final Uri uri = event.link;
      final queryParam = uri.queryParameters;
      if (queryParam.isNotEmpty) {
        Get.to(event.link.path);
      } else {
        Get.to(event.link.path);
      }
    });
  }

  Future initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((event) async {
      final Uri uri = event.link;
      final isstory = uri.pathSegments.contains("id");
      if (isstory) {
        //  final id = uri.queryParameters["id"];
        // if (uri != null) {
        //   return Get.to(
        //       ProductDetailScreen(
        //         detailProduct: productDetailList,
        //         index: 0,
        //       ),
        //       transition: Transition.zoom);

        // }
      }
    });
  }

  @override
  void onInit() async {
    // videoPlayerController = VideoPlayerController.network(
    //     'https://cdn.shopify.com/videos/c/o/v/8b381cc7520e4a8da8f4dee3941c806a.mp4');
    // intiallizeVideoPlayerController = videoPlayerController.initialize();

    // videoPlayerController.setLooping(true);
    // videoPlayerController.setVolume(0.0);
    // videoPlayerController.play();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= 400) {
          showBackToTop.value = true; // show the back-to-top button
        } else {
          showBackToTop.value = false; // hide the back-to-top button
        }
      });
    await getHomepageSlider();
    await getOurRecommendation("");
    await getOurCollection();
    await getDifferntTypeProduct();
    await getLensesByCategory();
    await getCarts();
    await getAdsUrl();
    await getFiftyProducts();

    // initDynamicLinks();
    // await addNewAddressController.getProfileAddress();

    super.onInit();
  }

  RxList<String> backgroudSliderList = [
    "assets/image/model1.png",
    "assets/image/model2.png",
    "assets/image/model3.png",
    "assets/image/model4.png",
    "assets/image/model5.png",
  ].obs;

  RxList<String> homepageImageList = [
    "assets/image/glas3.avif",
    "assets/image/glass1.avif",
    "assets/image/glass2.avif",
    "assets/image/glass4.avif",
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

  @override
  void dispose() {
    // videoPlayerController.dispose();
    scrollController.dispose();
    super.dispose();
  }
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

// class AdWidget extends StatefulWidget {
//   const AdWidget({super.key});

//   @override
//   State<AdWidget> createState() => _AdWidgetState();
// }

// class _AdWidgetState extends State<AdWidget> {
//   late VideoPlayerController videoPlayerController;

//   late Future<void> intiallizeVideoPlayerController;
//   @override
//   void initState() {
//     videoPlayerController = VideoPlayerController.network(
//         'https://cdn.shopify.com/videos/c/o/v/8b381cc7520e4a8da8f4dee3941c806a.mp4');
//     setState(() {
//       intiallizeVideoPlayerController = videoPlayerController.initialize();
//     });

//     videoPlayerController.setLooping(true);
//     videoPlayerController.setVolume(0.0);
//     videoPlayerController.play();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return videoPlayerController.value.isInitialized
//         ? Container(
//             height: Get.height * 0.50,
//             width: Get.width,
//             child: VideoPlayer(videoPlayerController),
//           )
//         // AspectRatio(
//         //     aspectRatio:
//         //         controller.videoPlayerController.value.aspectRatio,
//         //     child: VideoPlayer(controller.videoPlayerController),
//         //   )
//         : Container();
//   }
// }
