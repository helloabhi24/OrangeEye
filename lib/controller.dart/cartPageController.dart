import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../networking.dart/apiRepo.dart';

class CartpageController extends GetxController {
  late TextEditingController coupounController;
  RxInt i = 0.obs;

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

  @override
  void onInit() {
    coupounController = TextEditingController();
    getAddtocart();
    super.onInit();
  }
}
