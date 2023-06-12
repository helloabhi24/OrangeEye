import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';

AddNewAddressController addNewAddressController = Get.find();

customeStateDropdown(context) {
  return Obx(
    () => Container(
      height: Get.height * 0.07,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.whiteColor,
          border: Border.all(color: AppColor.greyColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              text: addNewAddressController.city.value,
            ),
          ),
          IconButton(
              onPressed: () {
                stateDialouge(context);
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
                                  addNewAddressController.city.value =
                                      addNewAddressController
                                          .stateList![e].name;

                                  addNewAddressController.billingCity.value =
                                      addNewAddressController.stateList![e].id
                                          .toString();

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
          borderRadius: BorderRadius.circular(10),
          color: AppColor.whiteColor,
          border: Border.all(color: AppColor.greyColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(
              text: addNewAddressController.state.value,
            ),
          ),
          IconButton(
              onPressed: () {
                cityDialouge(context);
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
                                  addNewAddressController.state.value =
                                      addNewAddressController
                                          .cityList![e].name!;
                                  addNewAddressController.billingState.value =
                                      addNewAddressController.cityList![e].id
                                          .toString();

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
