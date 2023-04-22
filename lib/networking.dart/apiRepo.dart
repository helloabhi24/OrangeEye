import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:orangeeye/networking.dart/serviceConstant.dart';
import 'package:orangeeye/networking.dart/serviceRequest.dart';
import '../utils/customToast.dart';
import 'exception.dart';

class ApiRepo {
  final Api _api = Api();
  Response? response;
  Options options = Options(
      headers: {
        HttpHeaders.authorizationHeader: 'YOUR KEY HERE',
      },
      validateStatus: (_) => true,
      contentType: 'application/json',
      responseType: ResponseType.json);

  //***********************signInApi***************************/

  Future signInUser(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.SIGNINAPI, options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  //***********************OTP verify***************************/

  Future otpVerify(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.VERIFYOTP, options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  //***********************Resend OTP***************************/

  Future resendOtp(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.RESENDOTP, options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  //***********************getProfile***************************/

  Future getProfile(String userId) async {
    try {
      Response response = await _api.request.get(
        '/api/profile/${userId}',
        options: options,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  //***********************getSlider***************************/

  Future getHomeSlider() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.GETHOMEPAGESLIDER,
        options: options,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getAllData() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.GETALLDATA,
        options: options,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getOurRecommendation(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request.post(
          ServiceConstant.GETOURRECOMMENDATION,
          options: options,
          data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future categoryWiseProduct(String type, String category) async {
    try {
      Response response = await _api.request.get(
        "https://skardtech.com/orangeeye/api/get_product?type=${int.parse(type)}&category=${int.parse(category)}",
        options: options,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getProductDetail(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.GETPRODUCTDETAIL, options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getOurCollection() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.GETOURCOLLECTIONS,
        options: options,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future updatedWishlist(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.UPDATEDWISHLIST, options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getWishlistProduct(String userId) async {
    try {
      Response response = await _api.request.get(
        "https://orangeeye.skardtech.com/api/get_wishlist?user_id=${userId}}",
        options: options,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getDifferentTypeProduct() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.GETDIFFERTNTTYPEPRODUCT,
        options: options,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future addToCart(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.ADDTOCART, options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getAddtocart() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.GETADDTOCART,
        options: options,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getPrivacyPolicies() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.privacypolicies,
        options: options,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }
}
