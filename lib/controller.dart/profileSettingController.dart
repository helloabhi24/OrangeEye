import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/customToast.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:orangeeye/utils/showLoadingIndicator.dart';

import '../networking.dart/apiRepo.dart';
import '../utils/customDrpdown.dart';

class ProfileSettingPageController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController dobController;
  late TextEditingController changePhoneController;
  late TextEditingController zipCodeController;

  // final formKey = GlobalKey<FormState>();
  Pref sharedPref = Get.find();
  MainpageController mainpageController = Get.find();
  RxString image = "".obs;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    dobController = TextEditingController();
    changePhoneController = TextEditingController();
    addressController = TextEditingController();
    zipCodeController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    changePhoneController.dispose();
    addressController.dispose();
    zipCodeController.dispose();
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
  }

  getProfileData() async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    try {
      showloadingIndicators();
      await ApiRepo().getProfiledetail(data).then((value) async {
        if (value["data"] == "Please Enter User Id") {
        } else {
          image.value = value["data"]["image"];
        }
        print(value);
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  updateProfile() async {
    AddNewAddressController addNewAddressController = Get.find();
    HomepageController homepageController = Get.find();
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    data["name"] = nameController.text;
    data["email"] = emailController.text;
    data["phone"] = phoneController.text;
    // data["state"] = addNewAddressController.billingStateid.value;
    // data["state"] = pref.stateNameId.value;
    data["state"] = mainpageController.stateById.value;
    // data["city"] = addNewAddressController.billingCityid.value;
    // data["city"] = pref.cityNameId.value;
    data["city"] = mainpageController.cityById.value;
    data["address"] = addressController.text;
    data["zip"] = zipCodeController.text;
    data["about"] = "";
    data["image"] = homepageController.base64stringforProfile.value;

    print(data["user_id"]);
    print(data["name"]);
    print(data["email"]);
    print(data["phone"]);
    print(data["state"]);
    print(data["city"]);
    print(data["address"]);
    print(data["zip"]);
    print(data["image"]);

    try {
      showloadingIndicators();
      await ApiRepo().profileUpdate(data).then((value) async {
        if (value["status"] == "success") {
          // customeToast(value["data"]);
          customeToast("Profile Updated Successfully");
          await getProfileData();
          await Get.toNamed(Routes.MAINPAGE);
        } else {
          customeToast(value["data"]);
        }
      });
    } catch (e) {
      print(e);
    }
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    zipCodeController.clear();
    addressController.clear();
    hideLoading();
  }
}
