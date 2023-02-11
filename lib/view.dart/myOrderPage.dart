import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/orderPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customeAppBar.dart';

class MyOrderPage extends GetView<OrderpageController> {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.customeAppbar(
          title: "Order", color: AppColor.blackColor),
      body: Column(
        children: [],
      ),
    );
  }
}
