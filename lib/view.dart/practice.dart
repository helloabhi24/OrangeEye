// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/services.dart';
// import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../utils/customToast.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _HomeScreenState();
//   }
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String mid = "", orderId = "", amount = "", txnToken = "";
//   String result = "";
//   bool isStaging = false;
//   bool isApiCallInprogress = false;
//   String callbackUrl = "";
//   bool restrictAppInvoke = false;
//   bool enableAssist = true;
//   @override
//   void initState() {
//     print("initState");
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.all(8),
//           child: Column(
//             children: <Widget>[
//               // EditText('Merchant ID', mid, onChange: (val) => mid = val),
//               // EditText('Order ID', orderId, onChange: (val) => orderId = val),
//               // EditText('Amount', amount, onChange: (val) => amount = val),
//               // EditText('Transaction Token', txnToken,
//               //     onChange: (val) => txnToken = val),
//               // EditText('CallBack URL', callbackUrl,
//               //     onChange: (val) => callbackUrl = val),
//               Row(
//                 children: <Widget>[
//                   Checkbox(
//                       activeColor: Theme.of(context).buttonColor,
//                       value: isStaging,
//                       onChanged: (bool? val) {
//                         setState(() {
//                           isStaging = val!;
//                         });
//                       }),
//                   Text("Staging")
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   Checkbox(
//                       activeColor: Theme.of(context).buttonColor,
//                       value: restrictAppInvoke,
//                       onChanged: (bool? val) {
//                         setState(() {
//                           restrictAppInvoke = val!;
//                         });
//                       }),
//                   Text("Restrict AppInvoke")
//                 ],
//               ),
//               Container(
//                 margin: EdgeInsets.all(16),
//                 child: ElevatedButton(
//                   onPressed: isApiCallInprogress
//                       ? null
//                       : () {
//                           // var whatsappAndroid = Uri.parse(
//                           //     "https://orangeeyewearindia.com/cart/pay/ORDS055");
//                           // if (await canLaunchUrl(whatsappAndroid)) {
//                           //   await launchUrl(whatsappAndroid);
//                           // } else {
//                           //   customeToast(
//                           //       "WhatsApp is not installed on the device");
//                           // }
//                           // _startTransaction(
//                           //     "VuhEjm57073837498953",
//                           //     "ORDS028",
//                           //     "1",
//                           //     "670ec79a16f04ec9b4efac13175fc5121684496081814",
//                           //     "https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=<ORDS028>",
//                           //     true,
//                           //     true);
//                           var response = AllInOneSdk.startTransaction(
//                               "VuhEjm57073837498953",
//                               "ORDS028",
//                               "1",
//                               "670ec79a16f04ec9b4efac13175fc5121684496081814",
//                               "https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=<ORDS028>",
//                               true,
//                               false,
//                               true);
//                           response.then((value) {
//                             print(value);
//                             setState(() {
//                               result = value.toString();
//                             });
//                           }).catchError((onError) {
//                             if (onError is PlatformException) {
//                               setState(() {
//                                 result = onError.message! +
//                                     " \n  " +
//                                     onError.details.toString();
//                               });
//                             } else {
//                               setState(() {
//                                 result = onError.toString();
//                               });
//                             }
//                           });
//                         },
//                   child: Text('Start Transcation'),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.bottomLeft,
//                 child: Text("Message : "),
//               ),
//               Container(
//                 child: Text(result),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _startTransaction(
//     mid,
//     orderId,
//     amount,
//     txnToken,
//     callbackUrl,
//     isStaging,
//     restrictAppInvoke,
//   ) async {
//     print("Arun");
//     if (txnToken.isEmpty) {
//       return;
//     }
//     var sendMap = <String, dynamic>{
//       "mid": mid,
//       "orderId": orderId,
//       "amount": amount,
//       "txnToken": txnToken,
//       "callbackUrl": callbackUrl,
//       "isStaging": isStaging,
//       "restrictAppInvoke": restrictAppInvoke,
//       // "enableAssist": enableAssist
//     };
//     print(sendMap);
//     try {
//       var response = AllInOneSdk.startTransaction(mid, orderId, amount,
//           txnToken, callbackUrl, isStaging, restrictAppInvoke);
//       response.then((value) {
//         print(value);
//         setState(() {
//           result = value.toString();
//         });
//       }).catchError((onError) {
//         if (onError is PlatformException) {
//           setState(() {
//             result = onError.message.toString() +
//                 " \n  " +
//                 onError.details.toString();
//           });
//         } else {
//           setState(() {
//             result = onError.toString();
//           });
//         }
//       });
//     } catch (err) {
//       result = err.toString();
//     }
//   }

//   PaytmConfig paytmConfig = PaytmConfig();

//   String getMap(double amount, String callbackUrl, String orderId) {
//     return json.encode({
//       "mid": mid,
//       "key_secret": paytmConfig.mKey,
//       "website": paytmConfig.website,
//       "orderId": orderId,
//       "amount": amount.toString(),
//       "callbackUrl": callbackUrl,
//       "custId": "122", // Pass users Customer ID here
//     });
//   }
// }

// class PaytmConfig {
//   final String _mid = "...";
//   final String _mKey = "...";
//   final String _website = "DEFAULT"; // or "WEBSTAGING" in Testing
//   final String _url =
//       'https://flutter-paytm-backend.herokuapp.com/generateTxnToken'; // Add your own backend URL

//   String get mid => _mid;
//   String get mKey => _mKey;
//   String get website => _website;
//   String get url => _url;
// }
