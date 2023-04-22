import 'package:get/get.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:orangeeye/view.dart/cartPage.dart';
import 'package:orangeeye/view.dart/categoryPage.dart';
import 'package:orangeeye/view.dart/homePage.dart';
import 'package:orangeeye/view.dart/accountPage.dart';
import 'package:orangeeye/view.dart/prescriptionPage.dart';
import 'package:orangeeye/view.dart/sizeGuidePage.dart';
import 'package:orangeeye/view.dart/walletPage.dart';
import 'package:orangeeye/view.dart/wishlistPage.dart';
import '../networking.dart/apiRepo.dart';
import '../utils/customToast.dart';
import '../utils/loadingIndicator.dart';

class MainpageController extends GetxController {
  RxInt bottomNavbarIndex = 0.obs;
  var selectedImagePath = "".obs;
  Pref sharedPref = Get.find();
  RxString phoneNumber = "".obs;

  List pages = [
    HomePage(),
    CategoryPage(),
    const CartPage(),
    const AccountPage(),
  ];

  Future getProfile() async {
    try {
      showloadingIndicator();
      await ApiRepo().getProfile(sharedPref.userToken.value).then((value) {
        if (value["status"] == 1) {
          phoneNumber.value = value["data"]["phone"];
        } else {
          customeToast("something went worng please try again");
        }
      });
    } catch (e) {
      print(e);
    }

    hideLoading();
  }

  List<Map<String, dynamic>> drawerList = [
    {
      "title": "Sizechart",
      "images": "assets/images/psoreward.png",
      "page": SizeGuidePage(),
    },
    {
      "title": "MyOrder",
      "images": "assets/images/Home.png",
      "page": const CartPage(),
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
      "page": const CartPage(),
    },
    {
      "title": "Socila Media Links",
      "images": "assets/images/Home.png",
      "page": const CartPage(),
    },
    {
      "title": "Shipping Policy",
      "images": "assets/images/Home.png",
      "page": const CartPage(),
    },
    {
      "title": "Return Policy",
      "images": "assets/images/Home.png",
      "page": const CartPage(),
    },
    {"title": "Logout", "images": "assets/images/onlinefuel.png"},
  ];

  @override
  void onInit() async {
    await sharedPref.getUserId();
    print("userToken aksjjgdiaGFKLqhgflkhhgWFLJG");
    print(sharedPref.userToken.value);
    await getProfile();
    super.onInit();
  }
}
