import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/customeAppBar.dart';

class SizeGuidePage extends StatelessWidget {
  const SizeGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppbar.customeAppbar(
          title: "SizeGuide", color: AppColor.blackColor),
    );
  }
}
