import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  late TextEditingController mobileController;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    mobileController = TextEditingController();
    super.onInit();
  }
}
