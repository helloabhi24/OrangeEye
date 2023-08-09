import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:orangeeye/networking.dart/apiRepo.dart';
import 'package:orangeeye/utils/customDrpdown.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:orangeeye/utils/showLoadingIndicator.dart';
import 'package:orangeeye/view.dart/mainpage.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../utils/customToast.dart';

class LoginPageController extends GetxController {
  late TextEditingController mobileController;
  late TextEditingController checkloginController;
  late TextEditingController otpController;
  OtpTimerButtonController controller = OtpTimerButtonController();
  OtpTimerButtonController OtpController = OtpTimerButtonController();
  RxBool isOtpSend = false.obs;
  RxBool isLogin = false.obs;
  // final formKey = GlobalKey<FormState>();

  RxBool isCheck = false.obs;
  RxString smsCode = "".obs;
  RxString privacyPolicies = "".obs;
  RxString oldOtp = "".obs;
  RxString appSignature = "".obs;
  RxString responseappSignature = "".obs;
  RxString responseOtp = "".obs;
  RxBool isLoading = false.obs;
  RxString Id = "".obs;
  RxString userPhoneNumber = "".obs;
  Pref sharedPref = Get.find();

  Future userSignIn(String text) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["phone"] = text;
    data["signature"] = appSignature.value;

    try {
      showloadingIndicators();
      await ApiRepo().signInUser(data).then((value) async {
        if (value["status"] == 1) {
          isOtpSend.value = true;
          isLogin.value = true;
          responseappSignature.value = value["signature"];
          responseOtp.value = value["data"].toString();
          customeToast("Otp send Succefully");
        } else {
          customeToast(value["msg"]);
        }
      });
    } catch (e) {
      print(e);
    }

    hideLoading();
  }

  Future verifyOtp() async {
    print(mobileController.text);
    print(otpController.text);
    print(otpController.text);
    final Map<String, dynamic> data = <String, dynamic>{};
    data["phone"] = mobileController.text.toString();
    data["otp"] = otpController.text.toString();
    data["oldotp"] = otpController.text.toString();
    print("all data");
    print(data["phone"]);
    print(data["otp"]);
    print(data["oldotp"]);

    print("old");
    print(data["oldotp"]);

    try {
      showloadingIndicators();
      await ApiRepo().otpVerify(data).then((value) async {
        if (value["status"] == 1) {
          customeToast(value["message"]);
          Id.value = value["data"]["id"].toString();
          await sharedPref.setUserId(Id.value);
          // await sharedPref.getUserId();
          Get.to(MainPage());
          mainpageController.getProfile();
          // Get.toNamed(Routes.MAINPAGE);
          otpController.clear();
          mobileController.clear();
        } else {
          customeToast("something went worng please try again");
        }
      });
    } catch (e) {
      print(e);
    }
    // mobileController.clear();
    hideLoading();
  }

  Future checkverifyOtp(String text) async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["phone"] = checkloginController.text;
    data["otp"] = text;
    data["oldotp"] = text;

    print(data["phone"]);
    print(data["otp"]);
    print(data["oldotp"]);

    try {
      showloadingIndicators();
      await ApiRepo().otpVerify(data).then((value) async {
        if (value["status"] == 1) {
          customeToast(value["message"]);
          Id.value = value["data"]["id"].toString();
          await sharedPref.setUserId(Id.value);
          checkloginController.clear();
          otpController.clear();
          Get.back();
        } else {
          customeToast("something went worng please try again");
        }
      });
    } catch (e) {
      print(e);
    }
    // mobileController.clear();
    hideLoading();
  }

  Future resendOtp(String text, String appSignature) async {
    // await sharedPref.getUserPhoneNumber();
    final Map<String, dynamic> data = <String, dynamic>{};
    data["phone"] = text;
    data["signature"] = appSignature;

    print("phone number");
    print(data["phone"]);

    try {
      showloadingIndicators();
      await ApiRepo().resendOtp(data).then((value) {
        if (value["status"] == 1) {
          responseappSignature.value = value["signature"];
          responseOtp.value = value["data"].toString();
          customeToast("otp send");
        } else {
          customeToast("something went worng please try again");
        }
      });
    } catch (e) {
      print(e);
    }
    // mobileController.clear();
    hideLoading();
  }

  // Future listenOtp() async {
  //   await SmsAutoFill().listenForCode();
  // }

  Future getPrivacy() async {
    try {
      showloadingIndicators();
      await ApiRepo().getPrivacyPolicies().then((value) {
        if (value["status"] == "success") {
          privacyPolicies.value = value["data"];
        }
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  @override
  void onInit() {
    mobileController = TextEditingController();
    checkloginController = TextEditingController();
    otpController = TextEditingController();
    //listenOtp();
    super.onInit();
  }

  @override
  void onClose() {
    // SmsAutoFill().unregisterListener();
    mobileController.dispose();
    checkloginController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
