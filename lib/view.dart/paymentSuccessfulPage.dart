import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orangeeye/controller.dart/paymentPageController.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';

import '../controller.dart/addNewAddressController.dart';
import '../routes/approutes.dart';
import '../utils/appColor.dart';
import '../utils/customeElevatedButton.dart';

class PaymentPage extends GetView<AddNewAddressController> {
  const PaymentPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
     Scaffold(
        body: Column(
          children: [
             controller.isFailedOrder.value==true?
            Lottie.network(
                  'https://assets5.lottiefiles.com/packages/lf20_hfkrvixt.json'):
    
            Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_0df8dldf.json'),
                  AppText(text:controller.isFailedOrder.value==true? "Order failed": "Order Successfull",fontSize: 16.sp,fontWeight: FontWeight.w600,),
    
         AppText(text: controller.isFailedOrder.value==true?"": "Thankyou so much for you Order", fontSize: 16.sp,fontWeight: FontWeight.w600,),
         height15,
             Align(alignment: Alignment.topCenter,
               child: CustomElevatedButtons(
                    isBorder: false,
                    buttoncolor: AppColor.orangeColor,
                    height: Get.height * 0.060,
                    width: Get.width * 0.90,
                    textcolor: AppColor.whiteColor,
                    textButton: "Back to Dashboard",
                    ontap: () {
                      Get.toNamed(Routes.MAINPAGE);             
                    }),
             ),
          ],
        ),
      ),
    );
  }
}