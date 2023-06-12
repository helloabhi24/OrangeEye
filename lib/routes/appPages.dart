import 'package:get/get.dart';
import 'package:orangeeye/bindins/binding.dart';
import 'package:orangeeye/routes/approutes.dart';
import 'package:orangeeye/view.dart/authenticationPage/OtpPage.dart';
import 'package:orangeeye/view.dart/addNewAddress.dart';
import 'package:orangeeye/view.dart/cartPage.dart';
import 'package:orangeeye/view.dart/catByGender.dart';
import 'package:orangeeye/view.dart/categoryWiseProductPage.dart';
import 'package:orangeeye/view.dart/checkoutPage.dart';
import 'package:orangeeye/view.dart/coupounRedeemPage.dart';
import 'package:orangeeye/view.dart/coupounsPage.dart';
import 'package:orangeeye/view.dart/genderWiseProductPage.dart';
import 'package:orangeeye/view.dart/homePage.dart';
import 'package:orangeeye/view.dart/authenticationPage/inputMobileNumberPage.dart';
import 'package:orangeeye/view.dart/authenticationPage/authtypePage.dart';
import 'package:orangeeye/view.dart/invoice.dart';
import 'package:orangeeye/view.dart/mainpage.dart';
import 'package:orangeeye/view.dart/notificationPage.dart';
import 'package:orangeeye/view.dart/onboardingScreen.dart';
import 'package:orangeeye/view.dart/paymnetPage.dart';
import 'package:orangeeye/view.dart/prescriptionPage.dart';
import 'package:orangeeye/view.dart/prescriptionTypeScreen.dart/selectPrescriptionTypePage.dart';
import 'package:orangeeye/view.dart/profileSettingPage.dart';
import 'package:orangeeye/view.dart/authenticationPage/signupPage.dart';
import 'package:orangeeye/view.dart/walletPage.dart';
import 'package:orangeeye/view.dart/wishlistPage.dart';
import 'package:orangeeye/widgets/cartPageWidget.dart';
import '../view.dart/myOrderPage.dart';
import '../view.dart/productDetailPage.dart';
import '../view.dart/selectAddress.dart';

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
        binding: GetXbindings()),
    GetPage(
        name: "/inputnumberotp",
        page: (() => LoginScreen()),
        binding: GetXbindings()),
    GetPage(
        name: "/notification",
        page: (() => NotificationPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/profilesetting",
        page: (() => ProfileSettingPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/wishlist",
        page: (() => WishlistPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/walletpage",
        page: (() => WalletPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/coupouns",
        page: (() => Coupounspage()),
        binding: GetXbindings()),
    GetPage(
        name: "/reddem",
        page: (() => CoupounRedeemPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/productdescriptionpage",
        page: (() => ProductDetailScreen()),
        binding: GetXbindings()),
    GetPage(
        name: "/categorywiseproduct",
        page: (() => CategoryWiseProductPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/selectprescriptionpage",
        page: (() => SelectPrescriptionPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/checkoutpage",
        page: (() => CartPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/selctaddress",
        page: (() => SelectAddress()),
        binding: GetXbindings()),
    GetPage(
        name: "/genderwiseproductpage",
        page: (() => GenderWiseProductPage()),
        binding: GetXbindings()),
    GetPage(
        name: "/invoicepage",
        page: (() => InvoicePage()),
        binding: GetXbindings()),
  ];
}
