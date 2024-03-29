import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsHelper {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static Future<void> logEvent(
      String name, Map<String, dynamic> parameters) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: _analytics);
// MaterialApp(
//   navigatorObservers: [observer],
}

// class AnalyticsHelperEvent extends AnalyticsHelper{

//   static Future<void> logScreenView(String screenName) async =>
//       await AnalyticsHelper._analytics.setCurrentScreen(screenName: screenName);

//   static Future<void> logSignUp(String signUpMethod) async =>
//       await AnalyticsHelper._analytics.logSignUp(signUpMethod: signUpMethod);

//   static Future<void> logLogin(String loginMethod) async =>
//       await  AnalyticsHelper._analytics.logLogin(loginMethod: loginMethod);

//   static Future<void> logLogout() async =>
//       await  AnalyticsHelper._analytics.logEvent(name: 'logout');

//   static Future<void> logPurchase(double value, String currency,
//       {String transactionId,
//       required String itemName,
//       String itemType,
//       String itemId,
//       String itemCategory,
//       int quantity,
//       double price,
//       String origin,
//       String destination}) async {
//     await _analytics.logEcommercePurchase(
//       currency: currency,
//       value: value,
//       transactionId: transactionId,
//       tax: 0,
//       shipping: 0,
//       coupon: null,
//       affiliation: null,
//       items: [
//         EcommerceItem(
//           name: itemName,
//           itemId: itemId,
//           itemType: itemType,
//           itemCategory: itemCategory,
//           price: price,
//           quantity: quantity,
//           origin: origin,
//           destination: destination,
//         ),
//       ],
//     );
//   }

//   static Future<void> setUserProperty(String name, String value) async =>
//       await  AnalyticsHelper._analytics.setUserProperty(name: name, value: value);

//   static Future<void> setUserId(String userId) async =>
//       await  AnalyticsHelper._analytics.setUserId(id:userId, callOptions: )
// }
