import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sharedPref.dart';

AddNewAddressController addNewAddressController = Get.find();
Pref pref = Get.find();

customeStateDropdown(context) {
  return Obx(
    () => Container(
      height: Get.height * 0.07,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white38,
          border: Border.all(color: AppColor.greyColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              text:  addNewAddressController.billingStateid.value==0? pref.stateName.value.isEmpty? "Choose State":  pref.stateName.value : addNewAddressController.state.value,
            ),
          ),
          IconButton(
              onPressed: () async{
                stateDialouge(context);
               await pref.getState();
               await pref.getStateid();
              },
              icon: Icon(Icons.arrow_drop_down))
        ],
      ),
    ),
  );
}

stateDialouge(context) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Material(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 80,
              padding: EdgeInsets.all(20),
              color: Colors.grey.withOpacity(0.1),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...Iterable.generate(
                            addNewAddressController.stateList!.length)
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  addNewAddressController.state.value =
                                      addNewAddressController
                                          .stateList![e].name;
                                  pref.setState(addNewAddressController.state.value);
                                  pref.setStateid(addNewAddressController.billingStateid.value);

                                  addNewAddressController.billingCity.value =
                                      addNewAddressController.stateList![e].id
                                          .toString();
                                        
                                  addNewAddressController.billingStateid.value = addNewAddressController.stateList![e].id;

                                          print("billing city");
                                          print(addNewAddressController.billingStateid.value);

                                  addNewAddressController.getCity(
                                      addNewAddressController.stateList![e].id
                                          .toString());

                                  Get.back();
                                },
                                child: AppText(
                                  text: addNewAddressController
                                      .stateList![e].name,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

customeCityDropdown(context) {
  return Obx(
    () => Container(
      height: Get.height * 0.07,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white38,
          border: Border.all(color: AppColor.greyColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              text: addNewAddressController.billingCityid.value==0? pref.cityName.value.isEmpty?"Choose City": pref.cityName.value :addNewAddressController.city.value,
            ),
          ),
          IconButton(
              onPressed: () async{
                cityDialouge(context);
              await pref.getcity();
              await pref.getcityid();
              },
              icon: Icon(Icons.arrow_drop_down))
        ],
      ),
    ),
  );
}

cityDialouge(context) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Material(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 80,
              padding: EdgeInsets.all(20),
              color: Colors.grey.withOpacity(0.1),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...Iterable.generate(
                            addNewAddressController.cityList!.length)
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  addNewAddressController.city.value =
                                      addNewAddressController
                                          .cityList![e].name!;
                                  pref.setcity(addNewAddressController.city.value);
                                  pref.setcityid(addNewAddressController.billingCityid.value);
                                  addNewAddressController.billingState.value =
                                      addNewAddressController.cityList![e].id
                                          .toString();
                                          addNewAddressController.billingCityid.value = addNewAddressController.cityList![e].id;
                                          print("billing city id");
                                          print(addNewAddressController.billingCityid.value);

                                  Get.back();
                                },
                                child: AppText(
                                  text: addNewAddressController
                                      .cityList![e].name!,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
