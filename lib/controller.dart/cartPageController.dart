import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:orangeeye/model/coupounsModel.dart';

import '../networking.dart/apiRepo.dart';

class CartpageController extends GetxController {
  late TextEditingController coupounController;
  RxInt i = 0.obs;
  RxBool isShow = false.obs;
  RxList<CoupounsModel> coupounsList = <CoupounsModel>[].obs;
  RxString selectedOption = "".obs;
  RxString selectCoupouns = "".obs;

  countdecs() {
    --i;
  }

  countInc() {
    ++i;
  }

  getAddtocart() async {
    try {
      await ApiRepo().getAddtocart().then((value) {
        print(value);
      });
    } catch (e) {
      print(e);
    }
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
    getAddtocart();

    super.onInit();
  }
}
