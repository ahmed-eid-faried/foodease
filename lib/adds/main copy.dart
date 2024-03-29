// import 'dart:io';

// // import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/rendering.dart';
// import 'package:vendors/core/binding/bloc_providers.dart';
// import 'package:vendors/core/helper/restart_widget.dart';
// import 'package:vendors/core/imports/export_path.dart';
// import 'package:vendors/core/imports/export_path_packages.dart';
// import 'package:vendors/core/local/cache_helper.dart';
// // import 'package:vendors/core/notifications/firebase_api.dart';
// import 'package:vendors/firebase_options.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import '../vendors/bishyaka_app.dart';
// import '../vendors/bloc_observer.dart';
// import '../vendors/injection_container.dart' as di;

// // flutter pub run easy_localization:generate -S assets/translations -O lib/core/languages -o locale_keys.g.dart -f keys

// void main() async {
// //************************************* ensureInitialized ****************************************//
// //************************************* ensureInitialized ****************************************//
//   WidgetsFlutterBinding.ensureInitialized();
// //************************************* Firebase Core ****************************************//
// //************************************* Firebase Core ****************************************//
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
// //************************************* Analytics ****************************************//
// //************************************* Analytics ****************************************//
// // analytics
//   // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
// // (Optional) Disable IDFA tracking#
// // To use Firebase Analytics without IDFA collection capability, open /ios/Podfile or /macos/Podfile and add the following global variable to the top of the file:
// // $FirebaseAnalyticsWithoutAdIdSupport = true
// //************************************* Messaging Fcm ****************************************//
// //************************************* Messaging Fcm ****************************************//
// // Messaging
// // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
// // initFcm();
// // await setupFlutterNotifications();
// // debugPrint('TOKEN_ ${await FirebaseMessaging.instance.getToken()}');
// //************************************* Cache and local database ****************************************//
// //************************************* Cache and local database ****************************************//
// // Cache and local database
// // await HiveHelper.initHive();
//   await CacheHelper.init();
// //************************************* Crashlytics ****************************************//
// //************************************* Crashlytics ****************************************//
// // Crashlytics
//   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
//   handlingErrors();
//   FlutterError.onError = (errorDetails) {
//     FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//   };
// //************************************* Localization ****************************************//
// //************************************* Localization ****************************************//

//   await EasyLocalization.ensureInitialized();
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarIconBrightness: Brightness.light,
//     statusBarColor: Colors.transparent.withOpacity(0),
//   ));

//   Local.saveLang();
// // Local.lang(context) = CacheHelper.get(key: 'ARABIC') ?? false;
// //************************************* Orientation ****************************************//
// //************************************* Orientation ****************************************//
//   await deviceOrientation();
// //************************************* di ****************************************//
//   await di.init();
// //************************************* Observer ****************************************//
//   Bloc.observer = MyBlocObserver();
// //************************************* Http ****************************************//
//   HttpOverrides.global = MyHttpOverrides();
// //**************************************** ** Run App ** *******************************************//

//   runApp(EasyLocalization(
//     saveLocale: true,
//     supportedLocales: L10n.all,
//     path: 'assets/translations',
//     fallbackLocale: L10n.all[0],
//     child: MultiBlocProvider(
//       providers: CubitProviders.providers,
//       child: const RestartWidget(
//         child: MyApp(),
//       ),
//     ),
//   ));
// }

// Future<void> deviceOrientation() async {
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.landscapeLeft,
//     DeviceOrientation.landscapeRight,
//     DeviceOrientation.portraitDown,
//     DeviceOrientation.portraitUp
//   ]);
// }

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

// class L10n {
//   static final all = [
//     const Locale('en', 'US'),
//     const Locale('ar', 'EG'),
//   ];
// }

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// class Get {
//   static BuildContext? get context => navigatorKey.currentContext;
//   static NavigatorState? get navigator => navigatorKey.currentState;
// }

// handlingErrors() {
//   RenderErrorBox.backgroundColor = AppColor.blue;
//   ErrorWidget.builder = (FlutterErrorDetails details) => Container();

//   // ErrorWidget.builder = (FlutterErrorDetails details) {
//   //   print("details of errors:- $details");
//   //   return Container(
//   //       color: AppColor.primaryColor,
//   //       child: Padding(
//   //         padding: const EdgeInsets.all(20),
//   //         child: Text("$details"),
//   //       ));
//   // };
//   // RenderErrorBox.textStyle = RenderErrorBox.textStyle;
//   // RenderErrorBox.padding = const EdgeInsets.all(10);
// }
