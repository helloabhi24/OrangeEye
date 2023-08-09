import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/model/glassesModel.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:orangeeye/utils/showLoadingIndicator.dart';
import 'package:orangeeye/view.dart/blogPage.dart';
import 'package:orangeeye/view.dart/cartPage.dart';
import 'package:orangeeye/view.dart/categoryPage.dart';
import 'package:orangeeye/view.dart/homePage.dart';
import 'package:orangeeye/view.dart/accountPage.dart';
import 'package:orangeeye/view.dart/prescriptionPage.dart';
import 'package:orangeeye/view.dart/returnPoliciesPage.dart';
import 'package:orangeeye/view.dart/shippingPolicies.dart';
import 'package:orangeeye/view.dart/sizeGuidePage.dart';
import 'package:orangeeye/view.dart/wishlistPage.dart';
import '../model/getCategoryNameModel.dart';
import '../networking.dart/apiRepo.dart';
import '../utils/customToast.dart';
import '../view.dart/myOrderPage.dart';

class MainpageController extends GetxController {
  RxInt bottomNavbarIndex = 0.obs;
  var selectedImagePath = "".obs;
  Pref sharedPref = Get.find();
  RxString phoneNumber = "".obs;
  RxBool isshowAppbar = false.obs;
  RxString policies = "".obs;
  RxString privacyPolicies = "".obs;
  RxString termsAndCondition = "".obs;
  RxString facebook = "".obs;
  RxString insta = "".obs;
  RxString twitter = "".obs;
  RxString youtube = "".obs;
  RxString sizeGuide = "".obs;
  RxString blogtitle = "".obs;
  RxString blogimage = "".obs;
  RxString blogddescription = "".obs;

  RxInt stateById = 0.obs;
  RxString stateByName = "".obs;

  RxString stateByIdfromProfile = "".obs;
  RxString cityByIdfromProfile = "".obs;

  RxInt cityById = 0.obs;
  RxString cityByName = "".obs;

  AddNewAddressController addNewAddressController = Get.find();

  RxList<GlassesModel> getGlassesList = <GlassesModel>[].obs;

  RxList<GetCategoryNameModel> getCategoryName = <GetCategoryNameModel>[].obs;

  RxList getglassesHomePageList = [].obs;

  RxList blogList = [].obs;
  RxList blogDetailPage = [].obs;

  List pages = [
    HomePage(),
    CategoryPage(),
    const CartPage(),
    const AccountPage(),
  ];

  Future getProfile() async {
    try {
      showloadingIndicators();
      await ApiRepo()
          .getProfile(sharedPref.userToken.value)
          .then((value) async {
        if (value["status"] == 1) {
          print("This is value of getProfile in main page controller");
          phoneNumber.value = value["data"]["phone"];
          stateByIdfromProfile.value = value["data"]["state"].toString();
          cityByIdfromProfile.value = value["data"]["city"].toString();
          await getStatesById(stateByIdfromProfile.value);
          await getCitysById(cityByIdfromProfile.value);
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
          privacyPolicies.value = value["data"];
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
          print(getglassesHomePageList.value);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future getTermsandconditions() async {
    try {
      await ApiRepo().getTermsandConditions().then((value) {
        if (value["status"] == "success") {
          termsAndCondition.value = value["data"];
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future getsizeguide() async {
    try {
      await ApiRepo().getSizeGuide().then((value) {
        if (value["status"] == "success") {
          sizeGuide.value = value["data"].toString();
          // print(sizeGuide.value);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future getBlogs() async {
    print("arun");
    try {
      await ApiRepo().getBlog().then((value) {
        if (value["status"] == "success") {
          blogList.value = value["data"];
        }
      });
    } catch (e) {
      print(e);
    }
  }

  getStatesById(String value) async {
    Map<String, dynamic> data = {};
    data["id"] = value;

    try {
      showloadingIndicators();
      await ApiRepo().getStateById(data).then((value) {
        if (value["status"] == "success") {
          stateById.value = value["data"]["id"];
          stateByName.value = value["data"]["name"];
          // blogimage.value = value["data"][0]["image"];
          // blogtitle.value = value["data"][0]["title"];
          // blogddescription.value = value["data"][0]["description"];
        }
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getCitysById(String value) async {
    Map<String, dynamic> data = {};
    data["id"] = value;

    try {
      showloadingIndicators();
      await ApiRepo().getCityById(data).then((value) {
        if (value["status"] == "success") {
          cityById.value = value["data"]["id"];
          cityByName.value = value["data"]["name"];
          // blogimage.value = value["data"][0]["image"];
          // blogtitle.value = value["data"][0]["title"];
          // blogddescription.value = value["data"][0]["description"];
        }
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getOurBlogDetail(String value) async {
    Map<String, dynamic> data = {};
    data["slug"] = value;

    try {
      // showloadingIndicators();
      await ApiRepo().getBlogdetail(data).then((value) {
        if (value["status"] == "success") {
          blogimage.value = value["data"][0]["image"];
          blogtitle.value = value["data"][0]["title"];
          blogddescription.value = value["data"][0]["description"];
        }
      });
    } catch (e) {
      print(e);
    }
    // hideLoading();
  }

  List<Map<String, dynamic>> drawerList = [
    {
      "title": "Size guide",
      "images": "assets/images/psoreward.png",
      "page": SizeGuidePage(),
    },
    {
      "title": "My Order",
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

    {"title": "Blog", "images": "assets/images/Home.png", "page": BlogPage()},
    {
      "title": "Socila Media Links",
      "images": "assets/images/Home.png",
    },
    {
      "title": "Shipping & Handling",
      "images": "assets/images/Home.png",
      "page": const ShippingPoliciesPage(),
    },
    // {
    //   "title": "Terms & Conditions",
    //   "images": "assets/images/Home.png",
    //   "page": const TermsAndConditionPage(),
    // },
    {
      "title": "Privacy & Policy",
      "images": "assets/images/Home.png",
      "page": const PrivacyPoliciesPage(),
    },
  ];

  @override
  void onInit() async {
    getProductGlasses();
    getCategoryNameProduct();
    await sharedPref.getUserId();
    await getProfile();
    // await getStatesById(stateByIdfromProfile.value.toString());
    // await getCitysById(cityByIdfromProfile.value.toString());
    await getRetrunPolicies();
    await getShippingPolicies();
    await getTermsandconditions();
    getsizeguide();
    getBlogs();
    await getSocilaMediaLinks();
    await getGlassesHomePage();
    await addNewAddressController.getProfileAddress();
    super.onInit();
  }
}
