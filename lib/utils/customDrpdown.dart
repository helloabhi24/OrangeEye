import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sharedPref.dart';

AddNewAddressController addNewAddressController = Get.find();
MainpageController mainpageController = Get.find();
Pref pref = Get.find();

customeStateDropdown(context) {
  return Obx(
    () => GestureDetector(
      onTap: () async {
        stateDialouge(context);
        await pref.getState();
        await pref.getStateid();
      },
      child: Container(
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
                  text: mainpageController.stateByName.value.isEmpty
                      ? "Choose State"
                      : mainpageController.stateByName.value
                  // addNewAddressController.billingStateid.value == 0
                  //     ? pref.stateName.value.isEmpty
                  //         ? "Choose State"
                  //         : pref.stateName.value
                  //     : addNewAddressController.state.value,
                  ),
            ),
            IconButton(
                onPressed: () async {
                  print("This is the id of state");
                  print(addNewAddressController.billingStateid.value);
                  print(pref.stateName.value);
                  print(addNewAddressController.state.value);
                  print("this is state id in profile");
                  print(pref.stateNameId.value);
                  stateDialouge(context);
                  await pref.getState();
                  await pref.getStateid();
                },
                icon: Icon(Icons.arrow_drop_down))
          ],
        ),
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
                                  mainpageController.stateByName.value =
                                      addNewAddressController
                                          .stateList![e].name;
                                  print("This is a data from click");
                                  print(addNewAddressController.state.value);
                                  print(addNewAddressController
                                      .billingStateid.value);
                                  mainpageController.stateById.value =
                                      addNewAddressController.stateList![e].id;
                                  addNewAddressController.billingCity.value =
                                      addNewAddressController.stateList![e].id
                                          .toString();

                                  addNewAddressController.billingStateid.value =
                                      addNewAddressController.stateList![e].id;
                                  pref.setState(
                                      addNewAddressController.state.value ??
                                          mainpageController.stateByName.value);
                                  pref.setStateid(addNewAddressController
                                          .billingStateid.value ??
                                      mainpageController.stateById.value);
                                  pref.getState();
                                  pref.getStateid();
                                  print(pref.stateNameId.value);
                                  // addNewAddressController.state.value =
                                  //     addNewAddressController
                                  //         .stateList![e].name;
                                  // print("This is a data from click");
                                  // print(addNewAddressController.state.value);
                                  // print(addNewAddressController
                                  //     .billingStateid.value);
                                  // addNewAddressController.billingCity.value =
                                  //     addNewAddressController.stateList![e].id
                                  //         .toString();

                                  // addNewAddressController.billingStateid.value =
                                  //     addNewAddressController.stateList![e].id;
                                  // pref.setState(
                                  //     addNewAddressController.state.value);
                                  // pref.setStateid(addNewAddressController
                                  //     .billingStateid.value);
                                  // pref.getState();
                                  // pref.getStateid();
                                  // print(pref.stateNameId.value);

                                  // addNewAddressController.billingCity.value =
                                  //     addNewAddressController.stateList![e].id
                                  //         .toString();

                                  // addNewAddressController.billingStateid.value =
                                  //     addNewAddressController.stateList![e].id;

                                  print("billing city");
                                  print(addNewAddressController
                                      .billingStateid.value);

                                  addNewAddressController.getCity(
                                      addNewAddressController.stateList![e].id
                                          .toString());

                                  addNewAddressController.billingCityid.value =
                                      0;
                                  pref.cityName.value = "";
                                  mainpageController.cityByName.value = "";
                                  Get.back();
                                },
                                child: AppText(
                                  text: addNewAddressController
                                      .stateList![e].name,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
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
    () => GestureDetector(
      onTap: () async {
        cityDialouge(context);
        await pref.getcity();
        await pref.getcityid();
      },
      child: Container(
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
                  text: mainpageController.cityByName.value.isEmpty
                      ? "Choose City"
                      : mainpageController.cityByName.value
                  // addNewAddressController.billingCityid.value == 0
                  //     ? pref.cityName.value.isEmpty
                  //         ? "Choose City"
                  //         : pref.cityName.value
                  //     : addNewAddressController.city.value,
                  ),
            ),
            IconButton(
                onPressed: () async {
                  cityDialouge(context);
                  print("is there any data in it");
                  print(addNewAddressController.cityList!.length);
                  await pref.getcity();
                  await pref.getcityid();
                },
                icon: Icon(Icons.arrow_drop_down))
          ],
        ),
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
                                  mainpageController.cityByName.value =
                                      addNewAddressController
                                          .cityList![e].name!;
                                  addNewAddressController.billingState.value =
                                      addNewAddressController.cityList![e].id
                                          .toString();
                                  addNewAddressController.billingCityid.value =
                                      addNewAddressController.cityList![e].id;
                                  mainpageController.cityById.value =
                                      addNewAddressController.cityList![e].id;
                                  pref.setcity(
                                      addNewAddressController.city.value);
                                  pref.setcityid(addNewAddressController
                                      .billingCityid.value);
                                  pref.getcity();
                                  pref.getcityid();
                                  // addNewAddressController.city.value =
                                  //     addNewAddressController
                                  //         .cityList![e].name!;
                                  // addNewAddressController.billingState.value =
                                  //     addNewAddressController.cityList![e].id
                                  //         .toString();
                                  // addNewAddressController.billingCityid.value =
                                  //     addNewAddressController.cityList![e].id;
                                  // pref.setcity(
                                  //     addNewAddressController.city.value);
                                  // pref.setcityid(addNewAddressController
                                  //     .billingCityid.value);
                                  // pref.getcity();
                                  // pref.getcityid();

                                  // addNewAddressController.billingState.value =
                                  //     addNewAddressController.cityList![e].id
                                  //         .toString();
                                  // addNewAddressController.billingCityid.value =
                                  //     addNewAddressController.cityList![e].id;
                                  // addNewAddressController.pinCodesCheck(
                                  //     mainpageController.cityByName.value);
                                  print("billing city id");
                                  print(addNewAddressController
                                      .billingCityid.value);

                                  Get.back();
                                  addNewAddressController.pinCodesCheck(
                                      mainpageController.cityByName.value);
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

customeStateforbillingDropdown(context) {
  return Obx(
    () => GestureDetector(
      onTap: () async {
        stateDialougeforbilling(context);
        await pref.getState();
        await pref.getStateid();
      },
      child: Container(
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
                  text:
                      //  addNewAddressController.billingStateid.value == 0
                      //     ?
                      addNewAddressController.statenameforbilling.value.isEmpty
                          ? "Choose State"
                          : addNewAddressController.statenameforbilling.value
                  // pref.stateName.value.isEmpty
                  //     ? "Choose State"
                  //     : pref.stateName.value == pref.stateNameforBill.value
                  //         ? pref.stateNameforBill.value
                  //         : pref.stateNameforBill.value
                  // : addNewAddressController.state.value,
                  ),
            ),
            IconButton(
                onPressed: () async {
                  print("This is billing details");
                  print("This is the id of state");
                  print(pref.stateName.value);
                  print(pref.stateNameforBill.value);
                  print(pref.stateNameforBill.value);
                  print(addNewAddressController.billingStateidInt.value);
                  print(pref.stateName.value);
                  print(addNewAddressController.state.value);
                  print(pref.stateNameId.value);
                  print(pref.stateNameIdforBill.value);
                  stateDialougeforbilling(context);
                  await pref.getState();
                  await pref.getStateid();
                },
                icon: Icon(Icons.arrow_drop_down))
          ],
        ),
      ),
    ),
  );
}

stateDialougeforbilling(context) {
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
                                  addNewAddressController
                                          .stateforbilling.value =
                                      addNewAddressController
                                          .stateList![e].name;
                                  print("This is a data from click");
                                  print(addNewAddressController
                                      .stateforbilling.value);
                                  print(addNewAddressController
                                      .billingStateid.value);
                                  addNewAddressController
                                          .statenameforbilling.value =
                                      addNewAddressController
                                          .stateList![e].name;

                                  addNewAddressController
                                          .billingStateidInt.value =
                                      addNewAddressController.stateList![e].id;
                                  pref.setStateforBilling(
                                      addNewAddressController
                                          .statenameforbilling.value);
                                  pref.setStateidforBill(addNewAddressController
                                      .billingStateidInt.value);
                                  pref.getStateforBill();
                                  pref.getStateidforBill();
                                  print(pref.stateNameId.value);

                                  // addNewAddressController.billingCity.value =
                                  //     addNewAddressController.stateList![e].id
                                  //         .toString();

                                  // addNewAddressController.billingStateid.value =
                                  //     addNewAddressController.stateList![e].id;

                                  print("billing city");
                                  print(addNewAddressController
                                      .billingStateid.value);

                                  addNewAddressController.getCityforBill(
                                      addNewAddressController.stateList![e].id
                                          .toString());
                                  addNewAddressController
                                      .citynameforbilling.value = "";

                                  Get.back();
                                },
                                child: AppText(
                                  text: addNewAddressController
                                      .stateList![e].name,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

customeCityforbillingDropdown(context) {
  return Obx(
    () => GestureDetector(
      onTap: () async {
        cityDialougeforBilling(context);
        await pref.getcityforBill();
        await pref.getcityidforBill();
      },
      child: Container(
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
                  text:
                      // addNewAddressController.billingCityid.value == 0
                      //     ?
                      addNewAddressController.citynameforbilling.value.isEmpty
                          ? "Choose City"
                          : addNewAddressController.citynameforbilling.value
                  // pref.cityName.value.isEmpty
                  //     ? "Choose City"
                  //     : pref.cityName.value == pref.cityNameforBill.value
                  //         ? pref.cityNameforBill.value
                  //         : pref.cityNameforBill.value,
                  // : addNewAddressController.city.value,
                  ),
            ),
            IconButton(
                onPressed: () async {
                  cityDialougeforBilling(context);
                  await pref.getcityforBill();
                  await pref.getcityidforBill();
                  // print(addNewAddressController.pinCodeStatusForBill.value);
                },
                icon: Icon(Icons.arrow_drop_down))
          ],
        ),
      ),
    ),
  );
}

cityDialougeforBilling(context) {
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
                            addNewAddressController.cityListforBill!.length)
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  addNewAddressController
                                          .citynameforbilling.value =
                                      addNewAddressController
                                          .cityListforBill![e].name!;

                                  addNewAddressController
                                          .billingCityidInt.value =
                                      addNewAddressController
                                          .cityListforBill![e].id;
                                  pref.setcityforBilling(addNewAddressController
                                      .citynameforbilling.value);
                                  pref.setcityidforBill(addNewAddressController
                                      .billingCityidInt.value);
                                  pref.getcityforBill();
                                  pref.getcityidforBill();
                                  // addNewAddressController.billingState.value =
                                  //     addNewAddressController.cityList![e].id
                                  //         .toString();
                                  // addNewAddressController.billingCityid.value =
                                  //     addNewAddressController.cityList![e].id;
                                  print("billing city id");
                                  print(addNewAddressController
                                      .billingCityid.value);

                                  Get.back();
                                  addNewAddressController.pinCodesCheckForBill(
                                    addNewAddressController
                                        .citynameforbilling.value,
                                  );
                                },
                                child: AppText(
                                  text: addNewAddressController
                                      .cityListforBill![e].name!,
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

customeStateforshippingDropdown(context) {
  return Obx(
    () => GestureDetector(
      onTap: () async {
        stateDialougeforshipping(context);
        // await pref.getState();
        // await pref.getStateid();
      },
      child: Container(
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
                  text:
                      //  addNewAddressController.billingStateid.value == 0
                      //     ?
                      addNewAddressController.stateforshipping.value.isEmpty
                          ? "Choose State"
                          : addNewAddressController.stateforshipping.value
                  // pref.stateName.value.isEmpty
                  //     ? "Choose State"
                  //     : pref.stateName.value == pref.stateNameforBill.value
                  //         ? pref.stateNameforBill.value
                  //         : pref.stateNameforBill.value
                  // : addNewAddressController.state.value,
                  ),
            ),
            IconButton(
                onPressed: () async {
                  // print("This is billing details");
                  // print("This is the id of state");
                  // print(pref.stateName.value);
                  // print(pref.stateNameforBill.value);
                  // print(pref.stateNameforBill.value);
                  // print(addNewAddressController.billingStateidInt.value);
                  // print(pref.stateName.value);
                  // print(addNewAddressController.state.value);
                  // print(pref.stateNameId.value);
                  // print(pref.stateNameIdforBill.value);
                  stateDialougeforshipping(context);
                  // await pref.getState();
                  // await pref.getStateid();
                },
                icon: Icon(Icons.arrow_drop_down))
          ],
        ),
      ),
    ),
  );
}

stateDialougeforshipping(context) {
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
                                  addNewAddressController
                                          .stateforshipping.value =
                                      addNewAddressController
                                          .stateList![e].name;
                                  print("This is a data from click");
                                  print(addNewAddressController
                                      .stateforbilling.value);
                                  print(addNewAddressController
                                      .billingStateid.value);
                                  // addNewAddressController
                                  //         .statenameforbilling.value =
                                  //     addNewAddressController
                                  //         .stateList![e].name;

                                  addNewAddressController
                                          .shippingStateidInt.value =
                                      addNewAddressController.stateList![e].id;
                                  // pref.setStateforBilling(
                                  //     addNewAddressController
                                  //         .statenameforbilling.value);
                                  // pref.setStateidforBill(addNewAddressController
                                  //     .billingStateidInt.value);
                                  // pref.getStateforBill();
                                  // pref.getStateidforBill();
                                  // print(pref.stateNameId.value);

                                  // addNewAddressController.billingCity.value =
                                  //     addNewAddressController.stateList![e].id
                                  //         .toString();

                                  // addNewAddressController.billingStateid.value =
                                  //     addNewAddressController.stateList![e].id;

                                  // print("billing city");
                                  // print(addNewAddressController
                                  //     .billingStateid.value);

                                  addNewAddressController.getCityforShip(
                                      addNewAddressController.stateList![e].id
                                          .toString());
                                  addNewAddressController
                                      .citynameforshipping.value = "";

                                  Get.back();
                                },
                                child: AppText(
                                  text: addNewAddressController
                                      .stateList![e].name,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

customeCityforshippingDropdown(context) {
  return Obx(
    () => GestureDetector(
      onTap: () async {
        cityDialougeforshipping(context);
        // await pref.getcityforBill();
        // await pref.getcityidforBill();
      },
      child: Container(
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
                  text:
                      // addNewAddressController.billingCityid.value == 0
                      //     ?
                      addNewAddressController.citynameforshipping.value.isEmpty
                          ? "Choose City"
                          : addNewAddressController.citynameforshipping.value
                  // pref.cityName.value.isEmpty
                  //     ? "Choose City"
                  //     : pref.cityName.value == pref.cityNameforBill.value
                  //         ? pref.cityNameforBill.value
                  //         : pref.cityNameforBill.value,
                  // : addNewAddressController.city.value,
                  ),
            ),
            IconButton(
                onPressed: () async {
                  cityDialougeforshipping(context);
                  // await pref.getcityforBill();
                  // await pref.getcityidforBill();
                },
                icon: Icon(Icons.arrow_drop_down))
          ],
        ),
      ),
    ),
  );
}

cityDialougeforshipping(context) {
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
                            addNewAddressController.cityListforShip!.length)
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  addNewAddressController
                                          .citynameforshipping.value =
                                      addNewAddressController
                                          .cityListforShip![e].name!;

                                  addNewAddressController
                                          .shippingCityidInt.value =
                                      addNewAddressController
                                          .cityListforShip![e].id;
                                  // pref.setcityforBilling(addNewAddressController
                                  //     .citynameforbilling.value);
                                  // pref.setcityidforBill(addNewAddressController
                                  //     .billingCityidInt.value);
                                  // pref.getcityforBill();
                                  // pref.getcityidforBill();
                                  // addNewAddressController.billingState.value =
                                  //     addNewAddressController.cityList![e].id
                                  //         .toString();
                                  // addNewAddressController.billingCityid.value =
                                  //     addNewAddressController.cityList![e].id;
                                  // print("billing city id");
                                  // print(addNewAddressController
                                  //     .billingCityid.value);

                                  Get.back();
                                  addNewAddressController.pinCodesCheckForShip(
                                      addNewAddressController
                                          .citynameforshipping.value);
                                },
                                child: AppText(
                                  text: addNewAddressController
                                      .cityListforShip![e].name!,
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
