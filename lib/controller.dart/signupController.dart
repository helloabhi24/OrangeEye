import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUppageController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
