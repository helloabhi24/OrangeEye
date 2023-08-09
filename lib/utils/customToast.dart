import 'package:fluttertoast/fluttertoast.dart';
import 'package:orangeeye/utils/appColor.dart';

customeToast(String text) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.blackColor,
      textColor: AppColor.whiteColor);
}
