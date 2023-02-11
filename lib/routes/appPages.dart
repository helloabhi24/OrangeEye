import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orangeeye/bindins/binding.dart';
import 'package:orangeeye/controller.dart/onboardingController.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/view.dart/OtpPage.dart';
import 'package:orangeeye/view.dart/addNewAddress.dart';
import 'package:orangeeye/view.dart/cartPage.dart';
import 'package:orangeeye/view.dart/catByGender.dart';
import 'package:orangeeye/view.dart/checkoutPage.dart';
import 'package:orangeeye/view.dart/homePage.dart';
import 'package:orangeeye/view.dart/loginPage.dart';
import 'package:orangeeye/view.dart/mainpage.dart';
import 'package:orangeeye/view.dart/onboardingScreen.dart';
import 'package:orangeeye/view.dart/paymnetPage.dart';
import 'package:orangeeye/view.dart/prescriptionPage.dart';
import 'package:orangeeye/view.dart/signupPage.dart';

import '../view.dart/myOrderPage.dart';

class AppPage {
  AppPage._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: "/home", page: (() => HomePage()), binding: GetXbindings()),
    GetPage(
        name: "/onboarding",
        page: (() => OnboardingScreen()),
        binding: GetXbindings()),
    GetPage(
        name: "/signup",
        page: (() => const SignUpPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/login",
        page: (() => const LoginPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/otp", page: (() => const OTPScreen()), binding: GetXbindings()),
    GetPage(
        name: "/mainpage", page: (() => MainPage()), binding: GetXbindings()),
    GetPage(
        name: "/checkoutpage",
        page: (() => CheckoutPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/newaddresspage",
        page: (() => AddnewAddressPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/paymentpage",
        page: (() => PaymentPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/categorybygender",
        page: (() => CategoryByGenderPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/orderpage",
        page: (() => MyOrderPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/prescription",
        page: (() => PrescriptionPage()),
        binding: GetXbindings())
  ];
}
