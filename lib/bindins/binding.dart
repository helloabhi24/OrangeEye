import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/homeController.dart';

class GetXbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageController>(() => HomepageController(), fenix: true);
  }
}
