
import 'package:get/get.dart';
import 'package:orangeeye/utils/appColor.dart';

customSnackBar(String title) {
  return Get.snackbar(title, "", backgroundColor: AppColor.whiteColor);
}
