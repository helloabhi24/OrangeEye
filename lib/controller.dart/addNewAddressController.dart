
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/profileSettingController.dart';
import 'package:orangeeye/model/stateModel.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customToast.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
import '../model/cityModel.dart';
import '../networking.dart/apiRepo.dart';
import '../utils/showLoadingIndicator.dart';
import '../view.dart/paymentSuccessfulPage.dart';


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

   RxBool isFailedOrder = false.obs;   

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
  RxInt billingStateid = 0.obs;
  RxInt billingCityid = 0.obs;
  RxString orderId = "".obs;
  RxString txnToken = "".obs;
  RxString amount = "".obs;
  RxString result = "".obs;
  RxString result1 = "".obs;
  RxString result2 = "".obs;
  RxString result3 = "".obs;
  RxString result4 = "".obs;
  RxString result5 = "".obs;
  RxString result6 = "".obs;
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
    HomepageController homepageController =  Get.find();
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    data["name"] = billingNameController.text;
    data["email"] = billingEmailController.text;
    data["phone"] = billingPhoneController.text;
    data["state"] = sharedPref.stateNameId.value;
    data["city"] = sharedPref.cityNameId.value;
    data["zip"] = billingPincodeController.text;
    data["address"] = billingAddressController.text;
    data["payment_method"] = paymentValue.value;
    data["other_address"] = billingAddressController.text;
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
    try {
 
    // controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    // controller.runJavaScript("document.body.innerText").then()
      showloadingIndicators();
      await ApiRepo().placeOrder(data).then((value) async{      
        if (value["status"] == "success") {
          if(value["payment_method"]=="cod"){
             if(value["msg"]=="Your order placed Successfully"){
              
             }else{
              isFailedOrder.value =  true;
             }
           customeToast(value["msg"]);
            await homepageController.getCarts();
            
            await Get.to(PaymentPage());
          }else{
            orderId.value = value["orderId"];
         txnToken.value = value["txnToken"];
         amount.value = value["amount"];
            customeToast(value["msg"]);
          }
          
          // Get.toNamed(Routes.HOME);
        }
      });
      hideLoading();
    } catch (e) {
      print(e);
    }
  }

   getProfileAddress() async {
    await sharedPref.getUserId();
    ProfileSettingPageController profileSettingPageController =  Get.find();
  
    Map<String, dynamic> data = {};
    data["user_id"] = sharedPref.userToken.value;
    print(data["user_id"]);
   
    try {
      showloadingIndicators();
      await ApiRepo().getProfiledetail(data).then((value) {
        billingNameController.text = value["data"]["name"]??"";
        billingPhoneController.text = value["data"]["phone"]??"";
        billingEmailController.text = value["data"]["email"]??"";
        billingAddressController.text = value["data"]["address"]??"";
        billingLocalityController.text = value["data"]["address"]??"";
        billingPincodeController.text = value["data"]["zip"]??"";
        profileSettingPageController.nameController.text = value["data"]["name"]??"";
        profileSettingPageController.emailController.text = value["data"]["email"]??"";
        profileSettingPageController.phoneController.text = value["data"]["phone"]??"";
        profileSettingPageController.zipCodeController.text = value["data"]["zip"]??"";
        profileSettingPageController.addressController.text = value["data"]["address"]??"";
        profileSettingPageController.image.value = value["data"]["image"]??"";
        
      });
      hideLoading();
    } catch (e) {
      print(e);
    }
  }

  initiateTransaction(
      String mid,
      String orderId,
      String amount,
      String txnToken,
      String callbackurl,
      bool isStaging,
      bool restrictAppInvoke) async{
        var response = AllInOneSdk.startTransaction(
         mid, orderId, amount, txnToken, callbackurl, isStaging, restrictAppInvoke);
       response.then((value) {
        if(value!["STATUS"]=="TXN_SUCCESS"){
          print("FILDUR");
        }else{
          print("FGSSCHJKL;FGCHVJBKNLVJBKNL000000000000000000");
          print("TRANSACTION FAIL");
        }
        print("vdsabfns-=================");
       print(value);
       result.value = value.toString();
 }).catchError((onError) {
       if (onError is PlatformException) {
         
           result.value = onError.message! + " \n  " + onError.details.toString();
         
       } else {
     
           result.value = onError.toString();
       
       }
 });

        
    // var response = AllInOneSdk.startTransaction(mid, orderId, amount, txnToken,
    //     callbackurl, isStaging, restrictAppInvoke);
       
    //  print(response.toString());
    //  print(response);
    // response.then((value) {
    //   result.value = value.toString();
    //   print("reslutvalue0000000");
    //   print(result.value);
    // }).catchError((onError) {
    //   if (onError is PlatformException) {
    //     result.value =   onError.details["RESPMSG"].toString();
    //     result1.value =  onError.details["CURRENCY"].toString();
    //     result2.value =  onError.details["ORDERID"].toString();
    //     result3.value =  onError.details["STATUS"].toString();
    //     result4.value =  onError.details["BANKTXNID"].toString();
    //     result5.value =  onError.details["TXNAMOUNT"].toString();
    //     result6.value =  onError.details["TXNID"].toString();
    //     print("arun1------------");
    //     Get.to(PaymentSuccess());
    //  print(result);
    //  print(result.value);

    //   } else {
    //     result.value = onError.toString();
    //        print("arun1000000000-==");
    //  print(response);
    //   }
    // });
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
    await getProfileAddress();

  
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





class PaymentSuccess extends GetView<AddNewAddressController>{
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
       Scaffold(body: Column(
        children: [
          controller.result3.value=="TXN_FAILURE"?
          Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_vuliyhde.json' , height: 200):Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_imrP4H.json' , height: 200),
                Row(children: [
                  AppText(text: "Currency",),
                  AppText(text: controller.result1.value, fontSize: 16.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,),
                ],),
                Row(children: [
                  AppText(text: "OrderNo",),
                  AppText(text: controller.result2.value, fontSize: 16.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,),
                ],),
                Row(children: [
                  AppText(text: "Transaction Status",),
                  AppText(text: controller.result3.value, fontSize: 16.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,),
                ],),
                Row(children: [
                  AppText(text: "Amount",),
                  AppText(text: controller.result5.value, fontSize: 16.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,),
                ],),
                Row(children: [
                  AppText(text: "TransactionID",),
                  Expanded(child: SizedBox(child: AppText(text: controller.result6.value, fontSize: 16.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,))),
                ],),
                Row(children: [
                  AppText(text: "Message",),
                  AppText(text: controller.result.value, fontSize: 16.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,),
                ],),
          
          // AppText(text: controller.result2.value, fontSize: 26.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,),
          // AppText(text: controller.result3.value, fontSize: 26.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,),
          // AppText(text: controller.result4.value, fontSize: 26.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,),
          // AppText(text: controller.result5.value, fontSize: 26.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,),
          // AppText(text: controller.result6.value, fontSize: 26.sp,fontWeight: FontWeight.w700,color: AppColor.blackColor,),
        ],
      ),),
    );
  }
}
