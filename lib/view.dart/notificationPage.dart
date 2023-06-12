import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/notification.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';

class NotificationPage extends GetView<NotificationPageController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.blackColor),
        backgroundColor: AppColor.whiteColor,
        centerTitle: true,
        title: AppText(
          text: "Notification",
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColor.blackColor,
        ),
      ),
      body: ListView(
        children: [notificationTiles(), notificationTiles()],
      ),
    );
  }

  notificationTiles() {
    return ListTile(
      trailing: AppText(
        text: "2 hr ago",
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.greyColor,
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage("assets/image/model1.png"),
      ),
      title: AppText(
        text: "Alex Standll",
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
      subtitle: AppText(
        text: "Hey, alex standll ",
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.greyColor,
      ),
    );
  }
}
