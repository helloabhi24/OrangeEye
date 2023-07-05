import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orangeeye/bindins/binding.dart';
import 'package:orangeeye/routes/appPages.dart';
import 'package:orangeeye/utils/sharedPref.dart';
import 'package:orangeeye/view.dart/mainpage.dart';
import 'package:orangeeye/view.dart/onboardingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  Pref sharedPref = Get.put(Pref());
  @override
  Widget build(BuildContext context) {
     sharedPref.getUserId();
    return 
    Obx(() => 
    ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: ((context, child) => GetMaterialApp(
                initialBinding: GetXbindings(),
                getPages: AppPage.routes,
                debugShowCheckedModeBanner: false,
                title: 'OrangeEye',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: child)),
            child: 
            sharedPref.userToken.value.isEmpty
                ? OnboardingScreen()
                : MainPage()
                
        // MainPage(),
    ));
  }
}
