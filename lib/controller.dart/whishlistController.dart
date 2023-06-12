import 'package:get/get.dart';
import '../model/whislistModel.dart';
import '../networking.dart/apiRepo.dart';
import '../utils/sharedPref.dart';
import '../utils/showLoadingIndicator.dart';

class WishlistPageController extends GetxController {
  RxList<WhislistModel>? whislistProductList = <WhislistModel>[].obs;

  RxInt frameChangeIndex = 0.obs;

  Pref sharedPref = Get.find();

  RxList whistList = [].obs;

  getWishlistProduct() async {
    await sharedPref.getUserId();
    // print(sharedPref.userToken.value);
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    try {
      showloadingIndicators();
      await ApiRepo()
          .getWishlistProduct(sharedPref.userToken.value)
          .then((value) {
        if (value["status"] == "success") {
          whistList.clear();
          whistList.addAll(value["data"]);
          // whislistProductList!.value = (value["data"] as List)
          //     .map((e) => WhislistModel.fromJson(e))
          //     .toList();
          print("whislist");
          print(whistList);
        }
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  @override
  void onInit() async {
    print("ariunwhislist");
    await getWishlistProduct();

    super.onInit();
  }

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
}
