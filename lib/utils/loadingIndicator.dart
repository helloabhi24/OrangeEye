import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orangeeye/utils/appColor.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: AppColor.whiteColor,
    ));
  }
}

showloadingIndicator() {
  return Center(child: CircularProgressIndicator());
}

hideLoading() {
  if (Get.isDialogOpen!) {
    Get.back();
  }
}
