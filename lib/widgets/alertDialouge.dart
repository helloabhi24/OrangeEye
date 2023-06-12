import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import '../routes/approutes.dart';

Future<void> showMyDialog(context) async {
  MainpageController mainpageController = Get.find();
  Pref pref = Get.find();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('islogout'),
        content: AppText(
          color: AppColor.blackColor,
          text: "Are you sure you want to logout",
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        actions: <Widget>[
          TextButton(
            child: AppText(
              color: AppColor.blackColor,
              text: "Cancle".tr,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: AppText(
              color: AppColor.blackColor,
              text: "Ok",
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () async {
              await Pref().deleteToken();
              await pref.setUserId("");
              // await mainpageController.getProfile();
              mainpageController.phoneNumber.value = "";
              Get.toNamed(
                Routes.OTPPHONENUMBERPAGE,
              );
            },
          ),
        ],
      );
    },
  );
}
