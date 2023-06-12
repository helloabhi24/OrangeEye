import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/cartPageController.dart';

class CoupounspageController extends GetxController {
  // RxList<String> gogleList = [
  //   "assets/image/g1.png",
  //   "assets/image/g2.png",
  //   "assets/image/g3.png",
  //   "assets/image/g4.png",
  //   "assets/image/g5.png",
  //   "assets/image/g3.png",
  //   "assets/image/g4.png",
  //   "assets/image/g5.png",
  // ].obs;

  CartpageController cartpageController = Get.find();

  @override
  void onInit() async {
    print("counpoms List");
    await cartpageController.getCoupouns();
    print(cartpageController.coupounsList.length);
    super.onInit();
  }
}
