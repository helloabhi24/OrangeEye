import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddNewAddressController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController pincodeController;
  late TextEditingController localityController;
  late TextEditingController addressController;
  late TextEditingController cityController;

  RxString selectedValue = "Uttarpradesh".obs;

  var items = ["Uttarpradesh", "Bihar", "Lucknow"];

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    pincodeController = TextEditingController();
    localityController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    pincodeController.dispose();
    localityController.dispose();
    addressController.dispose();
    cityController.dispose();
    super.dispose();
  }
}
