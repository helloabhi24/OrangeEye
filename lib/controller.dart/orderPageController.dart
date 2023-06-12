import 'package:get/get.dart';
import 'package:orangeeye/model/prescriptionModel.dart';
import 'package:orangeeye/utils/customToast.dart';

import '../model/placeOrderItem.dart';
import '../model/placeOrdermodel.dart';
import '../networking.dart/apiRepo.dart';

import '../utils/sharedPref.dart';
import '../utils/showLoadingIndicator.dart';

class OrderpageController extends GetxController {
  Pref sharedPref = Get.find();
  RxList<PrescriptionModel>? prescriptionList = <PrescriptionModel>[].obs;
  RxList<PlaceOrderModel>? placeOrderList = <PlaceOrderModel>[].obs;
  RxList<PlaceOrderItemsModel>? placeOrderItemList =
      <PlaceOrderItemsModel>[].obs;
  RxString orderId = "".obs;
  RxString date = "".obs;
  RxString billedName = "".obs;
  RxString billedPhone = "".obs;
  RxString billedEmail = "".obs;
  RxString billedAddress = "".obs;
  RxString paymentMethod = "".obs;
  RxString subTotal = "".obs;
  RxString grandTotal = "".obs;

  Future getPrescription() async {
    try {
      showloadingIndicators();
      await ApiRepo().prescription(sharedPref.userToken.value).then((value) {
        if (value["status"] == "success") {
          prescriptionList!.value = (value["data"] as List)
              .map((e) => PrescriptionModel.fromJson(e))
              .toList();
          print("prescriptionList");
        }
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getPlacedOrder() async {
    try {
      showloadingIndicators();
      await ApiRepo().getPlaceOrder(sharedPref.userToken.value).then((value) {
        if (value["status"] == "success") {
          placeOrderList!.value = (value["data"] as List)
              .map(
                (e) => PlaceOrderModel.fromJson(e),
              )
              .toList();
          print("place sorder ");
          print(placeOrderList);
        } else {
          customeToast(value["msg"]);
        }
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getInvoice(id) async {
    // await sharedPref.getUserId();
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    data["order_id"] = id;

    try {
      showloadingIndicators();
      await ApiRepo().getInvoice(data).then((value) async {
        placeOrderItemList!.clear();

        if (value["status"] == "success") {
          orderId.value = value["data"]["orderList"]["order_id"];
          date.value = value["data"]["orderList"]["date"];
          billedName.value = value["data"]["orderList"]["name"];
          billedPhone.value = value["data"]["orderList"]["phone"];
          billedEmail.value = value["data"]["orderList"]["email"];
          billedAddress.value = value["data"]["orderList"]["address"];
          paymentMethod.value = value["data"]["orderList"]["payment_method"];
          subTotal.value = value["data"]["orderList"]["sub_total"];
          grandTotal.value = value["data"]["orderList"]["gtotal"];
          placeOrderItemList!.value = (value["data"]["orderItems"] as List)
              .map(
                (e) => PlaceOrderItemsModel.fromJson(e),
              )
              .toList();
          print("place sorder ");
          print(placeOrderList);
        } else {
          customeToast("something went wrong");
        }
      });
    } catch (e) {
      print(e);
    }

    hideLoading();
  }

  @override
  void onInit() async {
    // await getPrescription();
    await getPlacedOrder();
    super.onInit();
  }
}
