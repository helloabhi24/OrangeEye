import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/model/coupounsModel.dart';

import '../networking.dart/apiRepo.dart';
import '../utils/customToast.dart';
import '../utils/sharedPref.dart';
import '../utils/showLoadingIndicator.dart';
import '../view.dart/cartPage.dart';

class CartpageController extends GetxController {
  late TextEditingController coupounController;
  RxInt i = 0.obs;
  RxBool isShow = false.obs;
  RxList<CoupounsModel> coupounsList = <CoupounsModel>[].obs;
  RxString selectedOption = "".obs;
  RxString selectCoupouns = "".obs;
  Pref sharedPref = Get.find();
  HomepageController homepageController = Get.find();

  countdecs() {
    --i;
  }

  countInc() {
    ++i;
  }

  removeProductFromCart(id) async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["id"] = id;
    print("productid");
    print(data["id"]);
    try {
      // showloadingIndicators();
      await ApiRepo().removeProductFromCart(data).then((value) async {
        if (value["status"] == "success") {
          // Get.to(CartPage());
          await homepageController.getCarts();
          print("value");
          print(value);
          customeToast(value["message"]);

          // hideLoading();
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

  getCoupouns() async {
    try {
      // showloadingIndicators();
      await ApiRepo().getCoupun().then((value) {
        coupounsList.value = (value["data"] as List)
            .map((e) => CoupounsModel.fromJson(e))
            .toList();
        print("coupouns");
        print(coupounsList);
      });
    } catch (e) {
      print(e);
    }
    // hideLoading();
  }

  @override
  void onInit() async {
    coupounController = TextEditingController();
    await homepageController.sum();
    // await getCarts();

    super.onInit();
  }
}
