import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/profilePageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/widgets/profilePageWidget.dart';

import '../utils/appText.dart';

class ProfilePage extends GetView<ProfilepageController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          getheight(context, 0.07),
          const ProfileImage(),
          getheight(context, 0.07),
          listiles("My orders"),
          listiles("Shipping Address"),
          listiles("My favourite"),
          listiles("Saved Prescriptions"),
          listiles("logout"),
        ],
      ),
    );
  }

  listiles(String title) {
    return ListTile(
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
