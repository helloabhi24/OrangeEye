import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:restart_app/restart_app.dart';
import '../routes/approutes.dart';
import '../view.dart/authenticationPage/inputMobileNumberPage.dart';

Future<void> showMyDialog(context) async {
  MainpageController mainpageController = Get.find();
  Pref pref = Get.find();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logging out!'),
        content: AppText(
          color: AppColor.blackColor,
          text: "Are you sure you want to logout",
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        actions: <Widget>[
          TextButton(
            child: AppText(
              color: AppColor.blackColor,
              text: "Cancel".tr,
              fontSize: 17,
              fontWeight: FontWeight.w500,
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
              fontWeight: FontWeight.w500,
            ),
            onPressed: () async {
              await Pref().deleteToken();
              await pref.setUserId("");
              // await mainpageController.getProfile();
              Restart.restartApp(webOrigin: '/inputnumberotp');
              mainpageController.phoneNumber.value = "";
              Get.offAll(LoginScreen());
              // Get.toNamed(
              //   Routes.OTPPHONENUMBERPAGE,
              // );
            },
          ),
        ],
      );
    },
  );
}
