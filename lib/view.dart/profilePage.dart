import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/profilePageController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/view.dart/addNewAddress.dart';
import 'package:orangeeye/view.dart/myOrderPage.dart';
import 'package:orangeeye/view.dart/prescriptionPage.dart';
import 'package:orangeeye/widgets/profilePageWidget.dart';

import '../utils/appText.dart';

class ProfilePage extends GetView<ProfilepageController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileImage(),
          getheight(context, 0.07),
          listiles("My orders", () => Get.toNamed(Routes.MYORDERPAGE)),
          listiles(
              "Shipping Address", () => Get.toNamed(Routes.ADDNEWADDRESSPAGE)),
          listiles("Saved Prescriptions",
              () => Get.toNamed(Routes.PRESCRIPTIONPAGE)),
        ],
      ),
    );
  }

  listiles(String title, Function ontap) {
    return ListTile(
      onTap: () {
        ontap();
      },
      leading: AppText(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: AppColor.orangeColor,
      ),
    );
  }
}
