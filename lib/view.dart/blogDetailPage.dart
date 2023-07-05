
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/utils/sizeHelper.dart';
import '../utils/appText.dart';

class BlogDetailPage extends GetView<MainpageController> {
  const BlogDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(appBar: AppBar(elevation: 0, backgroundColor: Colors.black,title: AppText(text: "Blog Detail", ),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(height: 200,width: Get.width,
                          child: Image.network("https://orangeeyewearindia.com/public/uploads/blogs/"+ controller.blogimage.value , height: 100,width:Get.width,)),
                          height10,
              AppText(text: controller.blogtitle.value, fontSize: 17.sp,fontWeight: FontWeight.w600,),
              height5,
              AppText(text: controller.blogddescription.value,),
                            
            ],),
          ),
        )
      ),
    );
  }
}