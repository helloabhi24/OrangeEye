import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:orangeeye/utils/showLoadingIndicator.dart';

import '../networking.dart/apiRepo.dart';

class ProfileSettingPageController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController dobController;
  late TextEditingController changePhoneController;

  Pref sharedPref = Get.find();
  MainpageController mainpageController = Get.find();

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    dobController = TextEditingController();
    changePhoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    changePhoneController.dispose();
    super.dispose();
  }

  updatedPhoneNumber() async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["id"] = sharedPref.userToken.value;
    data["number"] = changePhoneController.text;

    try {
      showloadingIndicators();
      await ApiRepo().updatePhoneNumber(data).then((value) async {
        await mainpageController.getProfile();
        print("value");
        print(value);
      });
    } catch (e) {
      print(e);
    }

    hideLoading();
  }
}
