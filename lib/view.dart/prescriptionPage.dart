import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/orderPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customeAppBar.dart';

class PrescriptionPage extends GetView<OrderpageController> {
  const PrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.customeAppbar(
          title: "Prescription", color: AppColor.blackColor),
      body: Column(
        children: [],
      ),
    );
  }
}
