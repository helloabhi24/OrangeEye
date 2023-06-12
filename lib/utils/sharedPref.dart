import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref extends GetxController {
  RxString userToken = "".obs;
  RxString userPhoneNumber = "".obs;
  RxDouble walletAmount = 0.0.obs;
  RxString actualWalletAmount = "".obs;
  RxString primaryId = "".obs;
  RxString returnId = "".obs;
  RxString returnId2 = "".obs;

  RxString appssignature = "".obs;

  RxList<String> walletAmountList = <String>[].obs;

  RxList<String> addressList = <String>[].obs;

  Future setUserPhoneNumber(String number) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("Usernumber", number);
  }

  getUserPhoneNumber() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userPhoneNumber.value = pref.getString("Usernumber")!;
    print("phone  number");
    print(userPhoneNumber.value);
    return userPhoneNumber.value;
  }

  Future setUserId(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("userId", id);
  }

  getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userToken.value = pref.getString("userId")!;
    print("phone  number");
    print(userToken.value);
    return userToken.value;
  }

  deleteToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("userId");
    return pref.remove("userId");
  }

  Future setAppSignauture(String appSignature) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("AppSignature", appSignature);
  }

  getAppSignature() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    appssignature.value = pref.getString("AppSignature")!;
    print("app signature");
    print(appssignature.value);
    return appssignature.value;
  }

  Future setUserAddressDetail(List<String> addressList) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList("address", addressList);
  }

  getUserAddressDetail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    addressList.value = pref.getStringList("address")!;
    print("app signature");
    print(addressList);
    return addressList;
  }
}
