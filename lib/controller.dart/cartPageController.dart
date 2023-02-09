import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartpageController extends GetxController {
  late TextEditingController coupounController;
  RxInt i = 0.obs;

  countdecs() {
    --i;
  }

  countInc() {
    ++i;
  }

  @override
  void onInit() {
    coupounController = TextEditingController();
    super.onInit();
  }
}
