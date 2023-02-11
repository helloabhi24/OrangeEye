import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:orangeeye/bindins/binding.dart';
import 'package:orangeeye/routes/appPages.dart';
import 'package:orangeeye/view.dart/onboardingScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
            home: OnboardingScreen(),
          )),
    );
  }
}
