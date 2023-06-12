import 'package:flutter/material.dart';
import 'package:orangeeye/utils/appText.dart';

import '../utils/appColor.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.blackColor),
        backgroundColor: AppColor.whiteColor,
        centerTitle: true,
        title: AppText(
          text: "About Us",
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColor.blackColor,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: "About Page",
          )
        ],
      ),
    );
  }
}
