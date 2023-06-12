import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/walletPageController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customeAssetsImage.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

class WalletPage extends GetView<WalletPageController> {
  const WalletPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.blackColor),
        backgroundColor: AppColor.whiteColor,
        title: AppText(
          text: "Wallet",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColor.blackColor,
        ),
      ),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getHorizontalSize(15),
                  vertical: getVerticalSize(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: "Create Wallet",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                  Column(
                    children: [
                      AppText(
                        text: "₹4000",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor,
                      ),
                      AppText(
                        text: "My balance",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.blackColor,
                      ),
                    ],
                  )
                ],
              )),
          CustomAssetsImage(
            height: Get.height * 0.18,
            imagePath: "assets/image/wallet.png",
          ),
          getheight(context, 0.020),
          listiles("My Wallet", "", Icons.wallet, () {}),
          listiles("Balance", "", Icons.balance, () {}),
          listiles("Currency", "", Icons.currency_bitcoin, () {}),
        ],
      ),
    );
  }

  listiles(String title, String subtitle, IconData icon, Function ontap) {
    return ListTile(
      onTap: () {
        ontap();
      },
      leading: Icon(icon),
      title: AppText(
        text: title,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
      subtitle: AppText(
        text: subtitle,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        color: AppColor.greyColor,
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: AppColor.orangeColor,
      ),
    );
  }
}
