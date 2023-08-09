import 'dart:convert';

import 'dart:typed_data';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orangeeye/model/prescriptionModel.dart';
import 'package:orangeeye/utils/customToast.dart';
import '../model/placeOrderItem.dart';
import '../model/placeOrdermodel.dart';
import '../model/prescriptionImageModel.dart';
import '../networking.dart/apiRepo.dart';
import '../utils/appColor.dart';
import '../utils/appText.dart';
import '../utils/sharedPref.dart';
import '../utils/showLoadingIndicator.dart';
import '../utils/sizeHelper.dart';
import '../view.dart/invoice.dart';

class OrderpageController extends GetxController {
  Pref sharedPref = Get.find();
  RxList<PrescriptionModel>? prescriptionList = <PrescriptionModel>[].obs;
  RxList<PlaceOrderModel>? placeOrderList = <PlaceOrderModel>[].obs;
  RxList? prescriptionImageList = [].obs;
  RxList<PlaceOrderItemsModel>? placeOrderItemList =
      <PlaceOrderItemsModel>[].obs;
  RxString orderId = "".obs;
  RxString id = "".obs;
  RxString idForPrescription = "".obs;
  RxString date = "".obs;
  RxString billedName = "".obs;
  RxString billedPhone = "".obs;
  RxString billedEmail = "".obs;
  RxString billedAddress = "".obs;
  RxString shipName = "".obs;
  RxString shipPhone = "".obs;
  RxString shipEmail = "".obs;
  RxString shipAddress = "".obs;
  RxString paymentMethod = "".obs;
  RxString subTotal = "".obs;
  RxString grandTotal = "".obs;

  RxString pinCodeBill = "".obs;
  RxString pinCodeShip = "".obs;

  RxString stateIdInvoice = "".obs;
  RxString cityIdInvoice = "".obs;
  RxString stateIdShip = "".obs;
  RxString cityIdShip = "".obs;

  RxInt stateByIdInvoice = 0.obs;
  RxString cityByNameInvoice = "".obs;
  RxInt cityByIdInvoice = 0.obs;
  RxString stateByNameInvoice = "".obs;

  RxString stateByNameInvoiceShip = "".obs;
  RxString cityByNameInvoiceShip = "".obs;

  RxString base64stringforInvoice = "".obs;
  RxString pathNameforInvoice = "".obs;
  var selectedImagePathinInvoice = "".obs;
  var selectedImagePathinProfile = "".obs;

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
          print("place order");
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

  getInvoice(String id) async {
    // await sharedPref.getUserId();
    print("orderids");
    print(id);
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    data["order_id"] = id;

    print(data["user_id"]);
    print(data["order_id"]);

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
          stateIdInvoice.value = value["data"]["orderList"]["state"].toString();
          cityIdInvoice.value = value["data"]["orderList"]["city"].toString();
          pinCodeBill.value = value["data"]["orderList"]["zip"].toString();
          print(stateIdInvoice.value);
          shipName.value = value["data"]["orderList"]["ship_name"] ??
              value["data"]["orderList"]["name"];
          shipPhone.value = value["data"]["orderList"]["ship_phone"] ??
              value["data"]["orderList"]["phone"];
          shipEmail.value = value["data"]["orderList"]["ship_email"] ??
              value["data"]["orderList"]["email"];
          shipAddress.value = value["data"]["orderList"]["ship_address"] ??
              value["data"]["orderList"]["address"];
          stateIdShip.value = value["data"]["orderList"]["ship_state"] ??
              value["data"]["orderList"]["state"].toString();
          cityIdShip.value = value["data"]["orderList"]["ship_city"] ??
              value["data"]["orderList"]["city"].toString();
          pinCodeShip.value = value["data"]["orderList"]["ship_zip"] ??
              value["data"]["orderList"]["zip"].toString();
          print("This is the value of shipping ");
          print(stateIdInvoice.value);
          print(stateIdShip.value);

          paymentMethod.value = value["data"]["orderList"]["payment_method"];
          subTotal.value = value["data"]["orderList"]["sub_total"].toString();
          grandTotal.value = value["data"]["orderList"]["gtotal"].toString();
          placeOrderItemList!.value = (value["data"]["orderItems"] as List)
              .map(
                (e) => PlaceOrderItemsModel.fromJson(e),
              )
              .toList();

          if (stateByIdInvoice.value == stateIdShip.value) {
            getStatesByIdInvoice(stateIdInvoice.value);
            stateByNameInvoiceShip.value = stateByNameInvoice.value;
          } else {
            getStatesByIdInvoice(stateIdInvoice.value);
            getStatesByIdInvoiceShip(stateIdShip.value);
          }
          if (cityByIdInvoice.value == cityIdShip.value) {
            getCitysByIdInvoice(cityIdInvoice.value);
            cityByNameInvoiceShip.value = cityByNameInvoice.value;
          } else {
            getCitysByIdInvoiceShip(cityIdInvoice.value);
            getCitysByIdInvoice(cityIdShip.value);
          }

          // getCitysByIdInvoice(cityIdInvoice.value);
          print("place sorder ");
          print(placeOrderItemList);

          //  await Get.to(InvoicePage());
        } else {
          customeToast("something went wrong");
        }
      });
    } catch (e) {
      print(e);
    }

    hideLoading();
  }

  Future getImageforInvoice(ImageSource imageSource) async {
    var pickeImage = await ImagePicker().pickImage(source: imageSource);
    if (pickeImage != null) {
      File? img = await getCroppedImage(pickeImage);
      pathNameforInvoice.value = pickeImage.name;
      selectedImagePathinInvoice.value = await img!.path;

      File imagefile =
          File(selectedImagePathinInvoice.value); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      base64stringforInvoice.value =
          "data:image/jpeg;base64," + base64.encode(imagebytes);
      print("byteImage");
      // print(base64string.value); //convert bytes to base64 string
      // await editPageController.getUpdateProfile(base64string.value);
      // await convertImageIntoByte();

      // print(selectedImagePath.value);
    } else {
      customeToast("No Image Selected");
    }
  }

  getCroppedImage(XFile image) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: image.path);
    if (croppedFile == null) return null;
    return File(croppedFile.path);
  }

  fileSelectedWidgetForInvoicee(context) {
    return Obx(
      () => Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  getImageforInvoice(ImageSource.gallery);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: Get.height * 0.06,
                  width: Get.width * 0.40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.greyColor.withOpacity(0.4)),
                  child: AppText(
                    text: "ChooseFile",
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              getheight(context, 0.010),
              SizedBox(
                width: Get.width * 0.60,
                child: AppText(
                  overFlow: TextOverflow.ellipsis,
                  text: pathNameforInvoice.value.isEmpty
                      ? "      No file selected"
                      : pathNameforInvoice.value,
                ),
              ),
              GestureDetector(
                onTap: () {
                  !pathNameforInvoice.isEmpty ? uploadPrescriptions() : null;
                  Get.back();
                  // your code
                },
                child: Card(
                  color: AppColor.blackColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const AppText(
                      text: "Upload Now",
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ),
              // getheight(context, 0.010),
              // Container(
              //   alignment: Alignment.center,
              //   height: Get.height * 0.20,
              //   width: Get.width * 0.93,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: AppColor.greyColor),
              //     borderRadius: BorderRadius.circular(10),
              //     // color: AppColor.redColor,
              //   ),
              //   child: homepageController.selectedImagePath.value.isEmpty
              //       ? AppText(
              //           text: "No prescription Image",
              //           fontSize: 15.sp,
              //           fontWeight: FontWeight.w600,
              //         )
              //       : Image.file(
              //           File(homepageController.selectedImagePath.value),
              //           fit: BoxFit.cover,
              //           width: Get.width,
              //         ),
              // ),
              // getheight(context, 0.010),
              // AppText(
              //   text:
              //       "Please Uploaded prescription image with PD (Pupillary Distance)",
              //   color: AppColor.redColor,
              //   fontSize: 13,
              // ),
              // getheight(context, 0.007),
              // AppText(
              //   text: "SPACTALE FRAME WITH PRESCRIPTION",
              //   color: AppColor.blackColor,
              //   fontWeight: FontWeight.w600,
              //   fontSize: 13,
              // ),
              // getheight(context, 0.007),
              // AppText(
              //   text: "LENSES AND ZERO POWER LENSES",
              //   color: AppColor.blackColor,
              //   fontSize: 13,
              //   fontWeight: FontWeight.w600,
              // ),
              // getheight(context, 0.007),
              // AppText(
              //   text: "INSATLLED ARE FINAL SALE",
              //   color: AppColor.blackColor,
              //   fontSize: 13,
              //   fontWeight: FontWeight.w600,
              // ),
              // getheight(context, 0.010),
            ],
          )),
    );
  }

  getPrescriptions(String OrderId) async {
    try {
      showloadingIndicators();
      // prescriptionImageList!.clear();
      await ApiRepo().getPrescription(OrderId).then((value) {
        if (value["status"] == "success") {
          // prescriptionImageList!.value = (value["data"]["prescription"] as List)
          //     .map(
          //       (e) => PrescriptionImageModel.fromJson(e),
          //     )
          //     .toList();

          if (value["data"].isEmpty) {
            prescriptionImageList!.clear();
          } else {
            prescriptionImageList!.clear();
            prescriptionImageList!.value =
                (value["data"]["prescription"] as List).toList();
          }
          print(prescriptionImageList!.value);
          print(prescriptionImageList!.length);
          // print("place order");
          // print(placeOrderList);
        } else {
          customeToast(value["msg"]);
        }
      });
      // hideLoading();
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  uploadPrescriptions() async {
    Map<String, dynamic> data = {};
    data["order_item"] = id.value;
    data["prescription"] = base64stringforInvoice.value;
    try {
      showloadingIndicators();
      await ApiRepo().uploadPrescription(data).then((value) {
        if (value["msg"] == "Prescription Successfully uploaded...") {
          base64stringforInvoice.value = "";
          pathNameforInvoice.value = "";
          customeToast(value["msg"]);
          Get.back();
        }
      });
    } catch (e) {
      print(e);
    }
    hideLoading();
  }

  getStatesByIdInvoice(String value) async {
    Map<String, dynamic> data = {};
    data["id"] = value;

    try {
      // showloadingIndicators();
      await ApiRepo().getStateById(data).then((value) {
        if (value["status"] == "success") {
          // stateByIdInvoice.value = value["data"]["id"];
          stateByNameInvoice.value = value["data"]["name"];
          // blogimage.value = value["data"][0]["image"];
          // blogtitle.value = value["data"][0]["title"];
          // blogddescription.value = value["data"][0]["description"];
        }
      });
    } catch (e) {
      print(e);
    }
    // hideLoading();
  }

  getCitysByIdInvoice(String value) async {
    Map<String, dynamic> data = {};
    data["id"] = value;

    try {
      // showloadingIndicators();
      await ApiRepo().getCityById(data).then((value) {
        if (value["status"] == "success") {
          // cityByIdInvoice.value = value["data"]["id"];
          cityByNameInvoice.value = value["data"]["name"];
          // blogimage.value = value["data"][0]["image"];
          // blogtitle.value = value["data"][0]["title"];
          // blogddescription.value = value["data"][0]["description"];
        }
      });
    } catch (e) {
      print(e);
    }
    // hideLoading();
  }

  getStatesByIdInvoiceShip(String value) async {
    Map<String, dynamic> data = {};
    data["id"] = value;

    try {
      // showloadingIndicators();
      await ApiRepo().getStateById(data).then((value) {
        if (value["status"] == "success") {
          // stateByIdInvoice.value = value["data"]["id"];
          stateByNameInvoiceShip.value = value["data"]["name"];
          // blogimage.value = value["data"][0]["image"];
          // blogtitle.value = value["data"][0]["title"];
          // blogddescription.value = value["data"][0]["description"];
        }
      });
    } catch (e) {
      print(e);
    }
    // hideLoading();
  }

  getCitysByIdInvoiceShip(String value) async {
    Map<String, dynamic> data = {};
    data["id"] = value;

    try {
      // showloadingIndicators();
      await ApiRepo().getCityById(data).then((value) {
        if (value["status"] == "success") {
          // cityByIdInvoice.value = value["data"]["id"];
          cityByNameInvoiceShip.value = value["data"]["name"];
          // blogimage.value = value["data"][0]["image"];
          // blogtitle.value = value["data"][0]["title"];
          // blogddescription.value = value["data"][0]["description"];
        }
      });
    } catch (e) {
      print(e);
    }
    // hideLoading();
  }

  @override
  void onInit() async {
    // await getPrescription();
    //await getPlacedOrder();
    super.onInit();
  }
}
