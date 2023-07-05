import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';

class PrivacyPoliciesPage extends GetView<MainpageController> {
  const PrivacyPoliciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.orangeColor,
          title: AppText(
            text: "Privacy & Policy",
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
        body: Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Scrollbar(
                      radius: const Radius.circular(10),
                      isAlwaysShown: true,
                      thickness: 6,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Html(
                            data: controller.privacyPolicies.value,
                            style: {
                              "table": Style(
                                backgroundColor: const Color.fromARGB(
                                    0x50, 0xee, 0xee, 0xee , ),
                                    fontSize: FontSize.xxLarge
                              ),
                              "tr": Style(
                                border: const Border(
                                    bottom: BorderSide(color: Colors.grey)),
                                    fontSize: FontSize.xxLarge
                              ),
                              "th": Style(
                                padding: const EdgeInsets.all(6),
                                backgroundColor: Colors.grey,
                                fontSize: FontSize.xxLarge
                              ),
                              "td": Style(
                                padding: const EdgeInsets.all(6),
                                alignment: Alignment.topLeft,
                                fontSize: FontSize.xxLarge
                              ),
                              'h5': Style(
                                  maxLines: 2,
                                  textOverflow: TextOverflow.ellipsis , fontSize: FontSize.xxLarge),
                            },
                          )
                          // CustomText(
                          //   text: controller.description2.value,
                          //   fontSize: 16,
                          //   fontWeight: FontWeight.w500,
                          // )
                        ],
                      ),
                    ),
            )
      ),
    );
  }
}
