import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NotificationPageController extends GetxController {
  late TextEditingController mobileController;
  final formKey = GlobalKey<FormState>();
  RxBool isCheck = false.obs;

  @override
  void onInit() {
    mobileController = TextEditingController();
    super.onInit();
  }
}
