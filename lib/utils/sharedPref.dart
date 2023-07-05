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
  RxString stateName = "".obs;
  RxString cityName = "".obs;
  RxInt stateNameId = 0.obs;
  RxInt cityNameId = 0.obs;

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

   Future setState(String state) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("state", state);
  }

  getState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    stateName.value = pref.getString("state")!;  
    return stateName.value;
  }

   Future setcity(String city) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("city", city);
  }

  getcity() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    cityName.value = pref.getString("city")!;
    return cityName.value;
  }



    Future setStateid(int stateId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("stateId", stateId);
  }

  getStateid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    stateNameId.value = pref.getInt("stateId")!;  
    return stateNameId.value;
  }

   Future setcityid(int cityId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("cityId", cityId);
  }

  getcityid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    cityNameId.value = pref.getInt("cityId")!;
    return cityNameId.value;
  }



}
