import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:orangeeye/model/stateModel.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/customToast.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import '../model/cityModel.dart';
import '../networking.dart/apiRepo.dart';
import '../utils/showLoadingIndicator.dart';

class AddNewAddressController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController pincodeController;
  late TextEditingController localityController;
  late TextEditingController addressController;
  late TextEditingController billingNameController;
  late TextEditingController billingPhoneController;
  late TextEditingController billingEmailController;
  late TextEditingController billingPincodeController;
  late TextEditingController billingLocalityController;
  late TextEditingController billingAddressController;
  // late TextEditingController cityController;
  // late TextEditingController searchController;

  final formKey = GlobalKey<FormState>();

  RxBool isCheck = false.obs;

  RxString selectedValue = "Uttarpradesh".obs;

  RxString paymentValue = "online".obs;

  var items = ["Uttarpradesh", "Bihar", "Lucknow"];

  RxList<StateModel>? stateList = <StateModel>[].obs;
  RxList<CityModel>? cityList = <CityModel>[].obs;
  RxList<StateModel> updatedCountryList = <StateModel>[].obs;
  RxBool isShowCountry = false.obs;
  RxString state = "choose City".obs;
  RxString city = "choose State".obs;
  RxString billingState = "choose City".obs;
  RxString billingCity = "choose State".obs;
  RxString orderId = "".obs;
  RxString txnToken = "".obs;
  RxString amount = "".obs;
  RxString result = "".obs;
  RxString curreny = "".obs;
  RxString orderids = "".obs;
  RxString status = "".obs;
  RxString banktxnId = "".obs;
  RxString msg = "".obs;
  RxString txnamount = "".obs;
  RxString txnId = "".obs;
  Pref sharedPref = Get.find();

  getState() async {
    Map<String, dynamic> data = {};
    data["country_id"] = "101";
    try {
      await ApiRepo().getState(data).then((value) {
        stateList!.clear();
        stateList!.value =
            (value as List).map((e) => StateModel.fromJson(e)).toList();
        state.value = stateList![0].name;
        print("stateList");
        print(stateList);
      });
    } catch (e) {
      print(e);
    }
  }

  getCity(String Id) async {
    Map<String, dynamic> data = {};
    data["state_id"] = Id;
    try {
      await ApiRepo().getCity(data).then((value) {
        cityList!.clear();
        cityList!.value =
            (value as List).map((e) => CityModel.fromJson(e)).toList();
        // city.value = cityList![0].name;
        print("cityList");
        print(cityList);
      });
    } catch (e) {
      print(e);
    }
  }

  Future placeOrder() async {
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    data["name"] = billingNameController.text;
    data["email"] = billingEmailController.text;
    data["phone"] = billingPhoneController.text;
    data["state"] = billingState.value;
    data["city"] = billingCity.value;
    data["zip"] = billingPincodeController.text;
    data["address"] = billingAddressController.text;
    data["payment_method"] = paymentValue.value;
    data["other_address"] = "";
    data["ship_name"] = isCheck.value == true ? nameController.text : "";
    data["ship_email"] = isCheck.value == true ? emailController.text : "";

    data["ship_phone"] = isCheck.value == true ? phoneController.text : "";

    data["ship_state"] = isCheck.value == true ? billingState.value : "";

    data["ship_city"] = isCheck.value == true ? billingCity.value : "";

    data["ship_zip"] = isCheck.value == true ? pincodeController.text : "";

    data["ship_address"] = isCheck.value == true ? addressController.text : "";

    print(data["user_id"]);
    print(data["name"]);
    print(data["email"]);
    print(data["phone"]);
    print(data["state"]);
    print(data["city"]);
    print(data["zip"]);
    print(data["address"]);
    print(data["payment_method"]);
    print(data["other_address"]);
    print(data["ship_name"]);
    print(data["ship_email"]);
    print(data["ship_phone"]);
    print(data["ship_state"]);
    print(data["ship_city"]);
    print(data["ship_zip"]);
    print(data["ship_address"]);

    try {
      showloadingIndicators();
      await ApiRepo().placeOrder(data).then((value) {
        orderId.value = value["orderId"];
        txnToken.value = value["txnToken"];
        amount.value = value["amount"];
        if (value["status"] == "success") {
          print(value["data"]);
          customeToast(value["message"]);
          // Get.toNamed(Routes.HOME);
        }
      });
      hideLoading();
    } catch (e) {
      print(e);
    }
  }
//   {
//    "user_id":"21",
//     "name":"ashish",
//     "email":"ashish@gmail.com",
//     "phone":"96XXXXXXXX",
//     "state":"",
//      "city":"",
//      "zip":"",
//      "address":"",
//      "payment_method":"cod,online",
//      "other_address":"",
//      "ship_name":"",
//      "ship_email":"",
//      "ship_phone":"",
//      "ship_state":"",
//       "ship_city":"",
//       "ship_zip":"",
//       "ship_address":""
// }

  // for paytm payment integrate ************

  initiateTransaction(
      String mid,
      String orderId,
      String amount,
      String txnToken,
      String callbackurl,
      bool isStaging,
      bool restrictAppInvoke) {
    var response = AllInOneSdk.startTransaction(mid, orderId, amount, txnToken,
        callbackurl, isStaging, restrictAppInvoke);

    response.then((value) {
      result.value = value.toString();
      print("reslutvalue0000000");
      print(result.value);
    }).catchError((onError) {
      if (onError is PlatformException) {
        result.value = onError.message! + " \n  " + onError.details.toString();
      } else {
        result.value = onError.toString();
      }
    });
  }

  // Future<void> initiateTransaction(String orderId, String amount,
  //     String txnToken, String callBackUrl) async {
  //   // String result = '';
  //   var response = await AllInOneSdk.startTransaction(
  //     "VuhEjm57073837498953",
  //     orderId,
  //     amount,
  //     txnToken,
  //     callBackUrl,
  //     false, // isStaging
  //     true, // restrictAppInvoke
  //     true,
  //   );
  //   print("response1000000");
  //   print(response.toString());
  //   try {
  //     response.then((value) {
  //       // Transaction successfull
  //       print("tansation successful");
  //       result.value = value.toString();
  //       curreny.value = value!["CURRENCY"];
  //       orderids.value = value["ORDERID"];
  //       status.value = value["STATUS"];
  //       banktxnId.value = value["BANKTXNID"];
  //       msg.value = value["RESPMSG"];
  //       txnamount.value = value["TXNAMOUNT"];
  //       txnId.value = value["TXNID"];
  //       print("ashishpal ans arun");
  //       print(value);
  //       print(value);
  //     }).catchError((onError) {
  //       if (onError is PlatformException) {
  //         print("12654789");
  //         result.value =
  //             onError.message! + " \n  " + onError.details.toString();
  //         print("ashishpal");
  //         print("ashishpal ans arun");
  //         print(result);
  //       } else {
  //         result.value = onError.toString();
  //         print("rseuljk0000000000000000");
  //         print(result.value + "arunpal");
  //       }
  //     });
  //   } catch (err) {
  //     // Transaction failed
  //     result.value = err.toString();
  //     print(result);
  //     print("shiv");
  //     print("transaction failed ");
  //   }
  // }

//   var response = AllInOneSdk.startTransaction(
//          mid, orderId, amount, txnToken, callbackurl, isStaging, restrictAppInvoke);
// response.then((value) {
//        print(value);
//        setState(() {
//          result = value.toString();
//        });
//  }).catchError((onError) {
//        if (onError is PlatformException) {
//          setState(() {
//            result = onError.message + " \n  " + onError.details.toString();
//          });
//        } else {
//          setState(() {
//            result = onError.toString();
//          });
//        }
//  });

  @override
  void onInit() async {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    pincodeController = TextEditingController();
    localityController = TextEditingController();
    addressController = TextEditingController();

    billingNameController = TextEditingController();
    billingEmailController = TextEditingController();
    billingPhoneController = TextEditingController();
    billingPincodeController = TextEditingController();
    billingLocalityController = TextEditingController();
    billingAddressController = TextEditingController();
    // cityController = TextEditingController();
    // searchController = TextEditingController();
    await getState();
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
    // cityController.dispose();
    super.dispose();
  }
}
