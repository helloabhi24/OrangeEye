import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../networking.dart/apiRepo.dart';
import '../utils/customToast.dart';
import '../utils/showLoadingIndicator.dart';

class ProfilepageController extends GetxController {
  RxInt bottomNavbarIndex = 0.obs;
  var selectedImagePath = "".obs;

  getEditImage(ImageSource imageSource) async {
    XFile? pickeImage = await ImagePicker().pickImage(source: imageSource);
    if (pickeImage != null) {
      File? img = await getCroppedImage(pickeImage);
      print(pickeImage);
      selectedImagePath.value = await img!.path;
    } else {
      Get.snackbar("No Image Selected", "",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  getCroppedImage(XFile image) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: image.path);
    if (croppedFile == null) return null;
    return File(croppedFile.path);
  }

  updatePhonenumber() async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["id"] = "";

    try {
      // showloadingIndicators();
      await ApiRepo().updatePhoneNumber(data).then((value) async {
        if (value["status"] == "success") {
          // hideLoading();
        } else {
          customeToast("something went wrong");
        }
      });
    } catch (e) {
      print(e);
    }

    hideLoading();
  }
}
