import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/controller.dart/cartPageController.dart';
import 'package:orangeeye/controller.dart/catByGenderController.dart';
import 'package:orangeeye/controller.dart/categoryPageController.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/loginController.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/controller.dart/onboardingController.dart';
import 'package:orangeeye/controller.dart/orderPageController.dart';
import 'package:orangeeye/controller.dart/paymentPageController.dart';
import 'package:orangeeye/controller.dart/profilePageController.dart';
import 'package:orangeeye/controller.dart/signupController.dart';

class GetXbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageController>(() => HomepageController(), fenix: true);
    Get.lazyPut<MainpageController>(() => MainpageController(), fenix: true);
    Get.lazyPut<CartpageController>(() => CartpageController(), fenix: true);
    Get.lazyPut<ProfilepageController>(() => ProfilepageController(),
        fenix: true);
    Get.lazyPut<CategorypageController>(() => CategorypageController(),
        fenix: true);

    Get.lazyPut<LoginPageController>(() => LoginPageController(), fenix: true);
    Get.lazyPut<OnboardingController>(() => OnboardingController(),
        fenix: true);

    Get.lazyPut<LoginPageController>(() => LoginPageController(), fenix: true);
    Get.lazyPut<SignUppageController>(() => SignUppageController(),
        fenix: true);
    Get.lazyPut<AddNewAddressController>(() => AddNewAddressController(),
        fenix: true);
    Get.lazyPut<PaymentPageController>(() => PaymentPageController(),
        fenix: true);
    Get.lazyPut<CategoryByGenderController>(() => CategoryByGenderController(),
        fenix: true);

    Get.lazyPut<OrderpageController>(() => OrderpageController(), fenix: true);
  }
}
