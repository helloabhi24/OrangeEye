import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/cartPageController.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/profileSettingController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/view.dart/blogPage.dart';
import 'package:orangeeye/widgets/alertDialouge.dart';
import '../utils/appText.dart';

class AccountPage extends GetView<HomepageController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartpageController cartpageController = Get.find();
    ProfileSettingPageController profileSettingPageController =  Get.find();
    return Obx(()=>
       Scaffold(
        body: ListView(
          children: [
            // const ProfileImage(),
            height18,
            Column(children: [
              Container(
                          height: 80,
                          width: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColor.blackColor, width: 1.2) ,
                                        ),
                           child: profileSettingPageController.image.value.isEmpty? CircleAvatar(radius: 70, child: Icon(Icons.person),):
                           CircleAvatar(radius: 70,
                            backgroundImage: NetworkImage( "https://orangeeyewearindia.com/public/uploads/profile/"+profileSettingPageController.image.value),),),
            getheight(context, 0.010),
               AppText(
                text: profileSettingPageController.nameController.text.isEmpty?"No Name":profileSettingPageController.nameController.text,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColor.blackColor,
              ),
              getheight(context, 0.010),
               AppText(
                text: profileSettingPageController.emailController.text.isEmpty?"No Emailid":profileSettingPageController.emailController.text,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColor.blackColor,
              ),
            ],),
    
            getheight(context, 0.04),
            listiles(
                "My orders",
                "check your order status(track , return , cancle , etc)",
                Icons.shopping_cart,
                () => Get.toNamed(Routes.MYORDERPAGE)),
            listiles("Wishlist", "Buy from items saved in whislist",
                Icons.favorite, () => Get.toNamed(Routes.WISHLISTPAGE)),
            // listiles(
            //     "Prescriptions",
            //     "Your prescriptions will be saved for future reference",
            //     Icons.medical_services,
            //     () => Get.toNamed(Routes.PRESCRIPTIONPAGE)),
            listiles("Coupouns", "Browse copouns to get discount on Orange eye",
                Icons.discount, () async {
              await cartpageController.getCoupouns();
              Get.toNamed(Routes.COUPONSPAGE);
            }),
            // listiles("Wallet", "Check your Orange eye wallet balance",
            //     Icons.wallet, () => Get.toNamed(Routes.WALLETPAGE)),
            // listiles("Payment method ", "Manage your saved payment methods",
            //     Icons.payment, () => Get.toNamed(Routes.PRESCRIPTIONPAGE)),
            // listiles("Address ", "Manage your saved addresses", Icons.location_on,
            //     () => Get.toNamed(Routes.ADDNEWADDRESSPAGE)),
            listiles("Profile setting ", "Edit/update your profile detail & more",
                Icons.settings, () => Get.toNamed(Routes.PROFILESETTING)),
            listiles(
                "Blog",
                "See blogs for your enhancement in our product knowledge",
                Icons.book,
                () =>
                     Get.to(BlogPage())
                    ),
            controller.sharedPref.userToken.value.isEmpty
                ? SizedBox()
                : listiles(
                "Logout", "logout", Icons.logout, () => showMyDialog(context)),
          ],
        ),
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
