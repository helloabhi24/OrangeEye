import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orangeeye/controller.dart/cartPageController.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/widgets/cartPageWidget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/appColor.dart';
import '../utils/customToast.dart';
import '../utils/customeAppBar.dart';
import '../utils/customeElevatedButton.dart';

class CartPage extends GetView<CartpageController> {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    HomepageController homepageController = Get.find();
    MainpageController mainpageController = Get.find();
    return Obx(
      () => Scaffold(
        appBar: mainpageController.isshowAppbar.value == true
            ? cartPage()
            : CustomAppbar.customeAppbar(
                title: "Cart", color: AppColor.blackColor),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: homepageController.getCartList!.isEmpty
              ? SizedBox(
                  height: Get.height * 0.80,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.network(
                        "https://assets9.lottiefiles.com/packages/lf20_ycdtcb3u.json",
                        animate: true,
                        alignment: Alignment.center,
                        height: Get.height * 0.25,
                      ),
                      AppText(
                        text: "Opps! No Orders",
                      )
                    ],
                  )),
                )
              : Column(
                  children: [
                    getheight(context, 0.010),
                    const ProductReturnPolicy(),
                    getheight(context, 0.010),
                    SizedBox(
                      // height: Get.height * 0.20,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Productdesc(
                            index: index,
                          );
                        },
                        itemCount: homepageController.getCartList!.length,
                      ),
                    ),
                    getheight(context, 0.020),
                    Coupouns(),
                    getheight(context, 0.010),
                    ProductPaymentDetails(),
                  ],
                ),
        ),
        bottomNavigationBar: homepageController.getCartList!.isEmpty
            ? SizedBox()
            : SizedBox(
                height: Get.height * 0.07,
                child: BottomAppBar(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: getHorizontalSize(10),
                        right: getHorizontalSize(10),
                        top: getVerticalSize(8)),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CustomElevatedButtons(
                                fontWeight: FontWeight.w600,
                                isBorder: false,
                                buttoncolor: AppColor.orangeColor,
                                height: Get.height * 0.050,
                                width: Get.width * 0.93,
                                textcolor: AppColor.whiteColor,
                                textButton: "Lets Chat",
                                ontap: () async {
                                  var whatsappAndroid = Uri.parse(
                                      "whatsapp://send?phone=6296157088&text=Hi, I need some help");
                                  if (await canLaunchUrl(whatsappAndroid)) {
                                    await launchUrl(whatsappAndroid);
                                  } else {
                                    customeToast(
                                        "WhatsApp is not installed on the device");
                                  }
                                }),
                          ),
                        ),
                        width8,
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CustomElevatedButtons(
                                fontWeight: FontWeight.w600,
                                isBorder: false,
                                buttoncolor: AppColor.orangeColor,
                                height: Get.height * 0.050,
                                width: Get.width * 0.93,
                                textcolor: AppColor.whiteColor,
                                textButton: "Checkout",
                                ontap: () {
                                  // Get.toNamed(Routes.CARTPAGE);
                                  Get.toNamed(Routes.SELECTADDRESS);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
