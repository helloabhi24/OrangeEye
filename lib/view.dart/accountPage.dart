import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/accountPageController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/widgets/alertDialouge.dart';
import 'package:orangeeye/widgets/profilePageWidget.dart';

import '../utils/appText.dart';

class AccountPage extends GetView<ProfilepageController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const ProfileImage(),
          getheight(context, 0.07),
          listiles(
              "My orders",
              "check your order status(track , return , cancle , etc)",
              Icons.shopping_cart,
              () => Get.toNamed(Routes.MYORDERPAGE)),
          listiles("Wishlist", "Buy from items saved in whislist",
              Icons.favorite, () => Get.toNamed(Routes.WISHLISTPAGE)),
          listiles(
              "Prescriptions",
              "Your prescriptions will be saved for future reference",
              Icons.medical_services,
              () => Get.toNamed(Routes.PRESCRIPTIONPAGE)),
          listiles("Coupouns", "Browse copouns to get discount on Orange eye",
              Icons.discount, () => Get.toNamed(Routes.COUPONSPAGE)),
          listiles("Wallet", "Check your Orange eye wallet balance",
              Icons.wallet, () => Get.toNamed(Routes.WALLETPAGE)),
          listiles("Payment method ", "Manage your saved payment methods",
              Icons.payment, () => Get.toNamed(Routes.PRESCRIPTIONPAGE)),
          listiles("Address ", "Manage your saved addresses", Icons.location_on,
              () => Get.toNamed(Routes.ADDNEWADDRESSPAGE)),
          listiles("Profile setting ", "Edit/update your profile detail & more",
              Icons.settings, () => Get.toNamed(Routes.PROFILESETTING)),
          listiles(
              "Blog",
              "See blogs for your enhancement in our product knowledge",
              Icons.book,
              () => Get.toNamed(Routes.PRESCRIPTIONPAGE)),
          listiles("Logout", "logout", Icons.book, () => showMyDialog(context)),
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
