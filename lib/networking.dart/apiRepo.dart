
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
        // customeToast("Something went wrong");
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

  Future categoryFilterData(String category) async {
    try {
      Response response = await _api.request.get(
        "https://orangeeyewearindia.com/api/get_product?category=${int.parse(category)}",
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

  Future categoryWiseProduct(String type, String category) async {
    try {
      Response response = await _api.request.get(
        "https://orangeeyewearindia.com/api/get_product?type=${int.parse(type)}&category=${int.parse(category)}",
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

  Future bestseller(String type, String category) async {
    try {
      Response response = await _api.request.get(
        "https://orangeeyewearindia.com/api/get_product?category=${int.parse(type)}&best_seller=${int.parse(category)}",
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

  Future newLaunches(String type, String category) async {
    try {
      Response response = await _api.request.get(
        "https://orangeeyewearindia.com/api/get_product?category=${int.parse(type)}&latest=${int.parse(category)}",
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
        "https://orangeeyewearindia.com/api/get_wishlist?user_id=${userId}}",
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

  Future getAddtocart(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.GETADDTOCART, options: options, data: data);

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

  Future getCoupun() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.GETCOUPOUNS,
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

  Future getLensesByCategory() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.GETLENSESBYCATEGORY,
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

  Future removeProductFromCart(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request.post(
          ServiceConstant.REMOVEPRODUCTFROMCART,
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

  Future getState(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.GETSTATE, options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getCity(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.GETCITY, options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future adsVideo() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.GETADSURL,
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

  Future updatePhoneNumber(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request.post(
          ServiceConstant.UPDATEPHONENUMBER,
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

  Future shippingPolicies() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.SHIPPINGPOLICIES,
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

  Future returnPolicies() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.RETURNPOLICIES,
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

  Future socialMedia() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.SOCIALMEDIA,
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

  Future prescription(String id) async {
    try {
      Response response = await _api.request.get(
        "https://orangeeyewearindia.com/api/prescription?user_id=${id}",
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

  Future placeOrder(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.PLACEORDER, options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getPlaceOrder(id) async {
    try {
      Response response = await _api.request.get(
        "https://orangeeyewearindia.com/api/get_order_list?user_id=${id}",
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

  Future getInvoice(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request
          .post(ServiceConstant.GETINVOICE, options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        customeToast("Something went wrong");
      }
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
    }
  }

  Future getGlasses() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.GETGLASSES,
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

  Future getCategoryName() async {
    try {
      Response response = await _api.request.post(
        ServiceConstant.GETCATEGORYNAME,
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

  Future getGlassesHomePage() async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.GETGLASSESHOMEPAGE,
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

  Future payment() async {
    try {
      Response response = await _api.request.post(
        "https://orangeeyewearindia.com/api/payment_gateway?order_id=ORDS028&user_id=28",
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
   

    Future profileUpdate(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request.post(
        ServiceConstant.UPDATEDPROFILE,
        options: options,
        data: data,
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

   Future getProfiledetail(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request.post(
        ServiceConstant.GETPROFILEDETAIL,
        options: options,
        data: data,
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
    

   Future getTermsandConditions() async {
    try {
      Response response = await _api.request.get(
      ServiceConstant.GETTERMANDCONDIITONS,
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


   Future getSizeGuide() async {
    try {
      Response response = await _api.request.get(
      ServiceConstant.GETSIZEGUIDE,
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


    Future getBlog() async {
    try {
      Response response = await _api.request.get(
      ServiceConstant.BLOG,
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
  

  Future getBlogdetail(Map<String, dynamic> data) async {
    try {
      Response response = await _api.request.post(
        ServiceConstant.BLOGDETAILS,
        options: options,
        data: data,
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
