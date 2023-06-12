import 'package:get/get.dart';
import 'package:orangeeye/model/glassesModel.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:orangeeye/utils/showLoadingIndicator.dart';
import 'package:orangeeye/view.dart/aboutUsPage.dart';
import 'package:orangeeye/view.dart/cartPage.dart';
import 'package:orangeeye/view.dart/categoryPage.dart';
import 'package:orangeeye/view.dart/homePage.dart';
import 'package:orangeeye/view.dart/accountPage.dart';
import 'package:orangeeye/view.dart/prescriptionPage.dart';
import 'package:orangeeye/view.dart/returnPoliciesPage.dart';
import 'package:orangeeye/view.dart/shippingPolicies.dart';
import 'package:orangeeye/view.dart/sizeGuidePage.dart';
import 'package:orangeeye/view.dart/walletPage.dart';
import 'package:orangeeye/view.dart/wishlistPage.dart';
import '../model/getCategoryNameModel.dart';
import '../model/productbyGenderModel.dart';
import '../networking.dart/apiRepo.dart';
import '../utils/customToast.dart';
import '../utils/loadingIndicator.dart';
import '../view.dart/myOrderPage.dart';

class MainpageController extends GetxController {
  RxInt bottomNavbarIndex = 0.obs;
  var selectedImagePath = "".obs;
  Pref sharedPref = Get.find();
  RxString phoneNumber = "".obs;
  RxBool isshowAppbar = false.obs;
  RxString policies = "".obs;
  RxString facebook = "".obs;
  RxString insta = "".obs;
  RxString twitter = "".obs;
  RxString youtube = "".obs;

  RxList<GlassesModel> getGlassesList = <GlassesModel>[].obs;

  RxList<GetCategoryNameModel> getCategoryName = <GetCategoryNameModel>[].obs;

  RxList getglassesHomePageList = [].obs;

  List pages = [
    HomePage(),
    CategoryPage(),
    const CartPage(),
    const AccountPage(),
  ];

  Future getProfile() async {
    try {
      showloadingIndicators();
      await ApiRepo().getProfile(sharedPref.userToken.value).then((value) {
        if (value["status"] == 1) {
          phoneNumber.value = value["data"]["phone"];
        } else {
          customeToast(value["msg"]);
          // customeToast("something went worng please try again");
        }
      });
    } catch (e) {
      print(e);
    }

    hideLoading();
  }

  Future getRetrunPolicies() async {
    try {
      // showloadingIndicators();
      await ApiRepo().returnPolicies().then((value) {
        if (value["status"] == "success") {
          policies.value = value["data"];
        }
      });
    } catch (e) {
      print(e);
    }

    // hideLoading();
  }

  Future getSocilaMediaLinks() async {
    try {
      // showloadingIndicators();
      await ApiRepo().socialMedia().then((value) {
        if (value["status"] == "success") {
          facebook.value = value["data"]["facebook"];
          insta.value = value["data"]["instagram"];
          twitter.value = value["data"]["twitter"];
          youtube.value = value["data"]["youtube"];
        }
      });
    } catch (e) {
      print(e);
    }

    // hideLoading();
  }

  Future getShippingPolicies() async {
    try {
      // showloadingIndicators();
      await ApiRepo().shippingPolicies().then((value) {
        if (value["status"] == "success") {
          policies.value = value["data"];
        }
      });
    } catch (e) {
      print(e);
    }

    // hideLoading();
  }

  Future getProductGlasses() async {
    try {
      // showloadingIndicators();
      await ApiRepo().getGlasses().then((value) {
        if (value["status"] == "success") {
          getGlassesList.value = (value["data"] as List)
              .map(
                (e) => GlassesModel.fromJson(e),
              )
              .toList();
          print("glassesList");
          print(getGlassesList);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future getCategoryNameProduct() async {
    try {
      // showloadingIndicators();
      await ApiRepo().getCategoryName().then((value) {
        if (value["status"] == "success") {
          getCategoryName.value = (value["data"] as List)
              .map(
                (e) => GetCategoryNameModel.fromJson(e),
              )
              .toList();
          print("categoryNmae");
          print(getCategoryName);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future getGlassesHomePage() async {
    try {
      // showloadingIndicators();
      await ApiRepo().getGlassesHomePage().then((value) {
        if (value["status"] == "success") {
          getglassesHomePageList.value = value["data"];
          print("categoryNmae");
          print(getglassesHomePageList);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  // RxList<ProductByGenderModel> allProductByGenderList =
  //     <ProductByGenderModel>[].obs;
  // getCategory(String type, String category) async {
  //   try {
  //     showloadingIndicators();
  //     await ApiRepo().categoryWiseProduct(type, category).then((value) {
  //       allProductByGenderList.clear();
  //       allProductByGenderList.value = (value["data"] as List)
  //           .map((e) => ProductByGenderModel.fromJson(e))
  //           .toList();

  //       print("allProductByGenderList");
  //       print(allProductByGenderList);
  //       // allProductByGenderList.addAll(value["data"]);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  //   hideLoading();
  // }

  List<Map<String, dynamic>> drawerList = [
    {
      "title": "Sizechart",
      "images": "assets/images/psoreward.png",
      "page": SizeGuidePage(),
    },
    {
      "title": "MyOrder",
      "images": "assets/images/Home.png",
      "page": const MyOrderPage(),
    },
    {
      "title": "Wishlist",
      "images": "assets/images/Category.png",
      "page": const WishlistPage(),
    },
    {
      "title": "Prescription",
      "images": "assets/images/Home.png",
      "page": const PrescriptionPage(),
    },
    {
      "title": "MyWallet",
      "images": "assets/images/Home.png",
      "page": const WalletPage(),
    },
    {
      "title": "AboutUs",
      "images": "assets/images/Home.png",
      "page": const AboutUsPage(),
    },
    {
      "title": "Socila Media Links",
      "images": "assets/images/Home.png",
    },
    {
      "title": "Shipping Policy",
      "images": "assets/images/Home.png",
      "page": const ShippingPoliciesPage(),
    },
    {
      "title": "Return Policy",
      "images": "assets/images/Home.png",
      "page": const RetrunPoliciesPage(),
    },
  ];

  @override
  void onInit() async {
    getProductGlasses();
    getCategoryNameProduct();
    await sharedPref.getUserId();
    await getProfile();
    await getRetrunPolicies();
    await getShippingPolicies();
    getSocilaMediaLinks();

    await getGlassesHomePage();
    super.onInit();
  }
}
