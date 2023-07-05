
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/controller.dart/mainPageController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/utils/appColor.dart';
import 'package:orangeeye/utils/appText.dart';
import 'package:orangeeye/utils/sizeHelper.dart';


class BlogPage extends GetView<MainpageController> {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
     Scaffold(appBar: AppBar(title: AppText(text: "Blog",),centerTitle: true,backgroundColor: AppColor.blackColor,),
        body: SizedBox(
          child: 
          ListView.builder(itemBuilder: (context , index ){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(onTap: ()async{
              // await  controller.getOurBlogDetail(controller.blogList[index]["slug"]);
              //          Get.toNamed(Routes.BLOGDETAILPAGE);
              },
                child: Column(
                  children: [                 
                    Container(height: 200,width: Get.width,
                          child: Image.network("https://orangeeyewearindia.com/public/uploads/blogs/"+ controller.blogList[index]["image"] , height: 100,width:Get.width, fit: BoxFit.cover,), ),
                     height10,  
                     RichText(text: TextSpan(text: controller.blogList[index]["title"],style: TextStyle(color: AppColor.blackColor),
                      children: [
                        TextSpan(text: " read more...",style: TextStyle(color: AppColor.blackColor , fontWeight: FontWeight.w600), recognizer: TapGestureRecognizer()..onTap = ()async{
                             await  controller.getOurBlogDetail(controller.blogList[index]["slug"]);
                      Get.toNamed(Routes.BLOGDETAILPAGE);
                        })
                      ]
                     )) ,
                  // AppText(text: controller.blogList[index]["title"], color: AppColor.blackColor, fontSize: 16.sp,fontWeight: FontWeight.w600,),
                  
                  ],
                ),
              )

            );
          } , itemCount: controller.blogList.length, shrinkWrap: true,),
        ),
           
      ),
    );
  }
}