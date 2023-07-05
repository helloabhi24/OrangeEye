import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orangeeye/controller.dart/addNewAddressController.dart';
import 'package:orangeeye/controller.dart/homeController.dart';
import 'package:orangeeye/controller.dart/profileSettingController.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/customDrpdown.dart';
import 'package:orangeeye/utils/customTextformfiled.dart';
import 'package:orangeeye/utils/customToast.dart';
import 'package:orangeeye/utils/customeAppBar.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import 'package:orangeeye/utils/validator.dart';
import '../utils/customeElevatedButton.dart';


class ProfileSettingPage extends GetView<ProfileSettingPageController> with InputValidationMixin{
  const ProfileSettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    HomepageController homepageController =  Get.find();
    AddNewAddressController addNewAddressController =  Get.find();
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppbar.customeAppbar(
            title: "Setting", color: AppColor.blackColor),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(15)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getheight(context, 0.05),
                Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                      onTap: (() {
                       homepageController.getImage(ImageSource.gallery);
                      }),
                      child: 
                      Container(
                        height: 70,
                        width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColor.blackColor, width: 1.2) ,
                                      ),
                         child: homepageController.selectedImagePath.value.isEmpty?CircleAvatar(radius: 100,
                          backgroundImage: NetworkImage("https://orangeeyewearindia.com/public/uploads/profile/"+controller.image.value),):
                         CircleAvatar(radius: 100,
                          backgroundImage:FileImage(File(homepageController.selectedImagePath.value)),),                       
                              )
                           ),
                ),
                getheight(context, 0.020),
                Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: AppText(
                      text: "Add profile picture",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                    ),
                  ),
                ),
                getheight(context, 0.020),
                Row(
                  children: [
                    Radio(
                        activeColor: AppColor.orangeColor,
                        value: true,
                        groupValue: true,
                        onChanged: (value) {}),
                    AppText(
                      text: "Miss",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                    ),
                    getWidth(context, 0.10),
                    Radio(
                        activeColor: AppColor.orangeColor,
                        value: true,
                        groupValue: true,
                        onChanged: (value) {}),
                    AppText(
                      text: "Mr",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                    ),
                  ],
                ),
                getheight(context, 0.020),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 AppText(
                text: "Name",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
                ),
                CustomFormField(validator: emptyValidation,
                controller: controller.nameController ,contentPadding: EdgeInsets.symmetric(vertical: getVerticalSize(10) , horizontal: getHorizontalSize(10)), hint: "Name..",),
                 getheight(context, 0.020),
                AppText(
                text: "Email",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
                ),
                CustomFormField(validator: emptyValidation,
                controller: controller.emailController , contentPadding: EdgeInsets.symmetric(vertical: getVerticalSize(10) , horizontal: getHorizontalSize(10)), hint: "Email..",),
                 getheight(context, 0.020),
                AppText(
                text: "Phone",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
                ),
                CustomFormField(validator: emptyValidation,
                inputType: TextInputType.number,isMaxLength: true,length: 10,
                controller: controller.phoneController , contentPadding: EdgeInsets.symmetric(vertical: getVerticalSize(10) , horizontal: getHorizontalSize(10)), hint: "Phone..",),
                 getheight(context, 0.020),
                 AppText(
                text: "State",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
                ),
                customeStateDropdown(context),           
                 getheight(context, 0.020),
                 AppText(
                text: "City",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
                ),
                 customeCityDropdown(context),
                 getheight(context, 0.020),
                AppText(
                text: "Zipcode",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
                ),
                CustomFormField(validator: emptyValidation,
                inputType: TextInputType.number,isMaxLength: true,length: 6,
                controller: controller.zipCodeController , contentPadding: EdgeInsets.symmetric(vertical: getVerticalSize(10) , horizontal: getHorizontalSize(10)), hint: "zipcode..",),
                getheight(context, 0.020),
                AppText(
                text: "Address",
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.greyColor,
                ),
                
                CustomFormField(maxLines: true,validator: emptyValidation,
                  controller: controller.addressController , contentPadding: EdgeInsets.symmetric(vertical: getVerticalSize(10) , horizontal: getHorizontalSize(10)), hint: "Address..",),
                getheight(context, 0.020),
                ],
                ),

                CustomElevatedButtons(
                          fontWeight: FontWeight.w600,
                          isBorder: false,
                          buttoncolor: AppColor.orangeColor,
                          height: Get.height * 0.050,
                          width: Get.width * 0.93,
                          textcolor: AppColor.whiteColor,
                          textButton: "Submit",
                          ontap: () async{
                           if(controller.nameController.text.isEmpty ||controller.emailController.text.isEmpty ||controller.phoneController.text.isEmpty ||controller.zipCodeController.text.isEmpty||controller.addressController.text.isEmpty  || pref.stateName.value.isEmpty || pref.cityName.value.isEmpty){
                            customeToast("Please select state and country");
                           }else{
                            print(addNewAddressController.billingStateid.value);
                             print(addNewAddressController.billingCityid.value);
                            await controller.updateProfile( );
                           }
                          // if(controller.formKey.currentState!.validate()){
                          //   await controller.updateProfile( );
                          // }else{
                          //  if(addNewAddressController.billingStateid.value==0 || addNewAddressController.billingCityid.value==0 || ){
                          //   print(addNewAddressController.billingStateid.value);
                          //   print(addNewAddressController.billingCityid.value);
                          //     customeToast("Please select state and country");
                          //   }else{
                          //     print("biiling values");
                          //      print(addNewAddressController.billingStateid.value);
                          //   print(addNewAddressController.billingCityid.value);
                          //    return null;
                          //   }
                          // }

                          }),
                          getheight(context, 0.020),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
