import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodease/core/di_container.dart' as di;
import 'package:foodease/core/helper/cache_helper.dart';
import 'package:foodease/core/theme/controllers/theme_controller.dart';
import 'package:foodease/core/theme/dark_theme.dart';
import 'package:foodease/core/theme/light_theme.dart';
import 'package:foodease/core/utill/app_constants.dart';
import 'package:foodease/features/home/home_controller.dart';
import 'package:foodease/features/home/main_page.dart';
import 'package:foodease/features/screens/screens.dart';
import 'package:foodease/features/splash/controllers/splash_controller.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    MultiProvider(
      providers: [
         ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ThemeController(sharedPreferences: CacheHelper.sharedPreferences),
        ),
        ChangeNotifierProvider<SplashController>(
            create: (_) => di.sl<SplashController>()),
        // ChangeNotifierProvider<LocalizationController>(
        //     create: (_) => di.sl<LocalizationController>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Locale> locales = AppConstants.languages
    //     .map((language) => Locale(language.languageCode!, language.countryCode))
    //     .toList();

    return MaterialApp(
      title: AppConstants.appName,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeController>(context).darkTheme ? dark : light,
      // locale: Provider.of<LocalizationController>(context).locale,
      // localizationsDelegates: const [
      //   AppLocalization.delegate,
      //   // Your other localizations delegates go here
      // ],
      // supportedLocales: locales,
      home: const Screens(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Get {
  static BuildContext? get context => navigatorKey.currentContext;
  static NavigatorState? get navigator => navigatorKey.currentState;
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:foodease/core/localization/controllers/localization_controller.dart';
// import 'package:foodease/core/theme/controllers/theme_controller.dart';
// import 'package:foodease/core/theme/dark_theme.dart';
// import 'package:foodease/core/theme/light_theme.dart';
// import 'package:foodease/core/utill/app_constants.dart';
// import 'package:provider/provider.dart';
// import 'core/helper/custom_delegate.dart';
// import 'core/localization/app_localization.dart';

// // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //     FlutterLocalNotificationsPlugin();
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Future<void> main() async {
//   HttpOverrides.global = MyHttpOverrides();
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   // await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
//   // await di.init();

//   // flutterLocalNotificationsPlugin
//   //     .resolvePlatformSpecificImplementation<
//   //         AndroidFlutterLocalNotificationsPlugin>()
//   //     ?.requestNotificationsPermission();

//   // NotificationBody? body;
//   // try {
//   //   final RemoteMessage? remoteMessage =
//   //       await FirebaseMessaging.instance.getInitialMessage();
//   //   if (remoteMessage != null) {
//   //     body = NotificationHelper.convertNotification(remoteMessage.data);
//   //   }
//   //   await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
//   //   FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
//   // } catch (_) {}

//   // await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
//   // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

//   runApp(MultiProvider(
//     providers: const [
//       // ChangeNotifierProvider(create: (context) => di.sl<CategoryController>()),
//     ],
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   // final NotificationBody? body;
//   const MyApp({
//     super.key,
//     // required this.body
//   });

//   @override
//   Widget build(BuildContext context) {
//     List<Locale> locals = [];
//     for (var language in AppConstants.languages) {
//       locals.add(Locale(language.languageCode!, language.countryCode));
//     }
//     return MaterialApp(
//       title: AppConstants.appName,
//       navigatorKey: navigatorKey,
//       debugShowCheckedModeBanner: false,
//       theme: Provider.of<ThemeController>(context).darkTheme ? dark : light,
//       locale: Provider.of<LocalizationController>(context).locale,
//       localizationsDelegates: [
//         AppLocalization.delegate,
//         // GlobalMaterialLocalizations.delegate,
//         // GlobalWidgetsLocalizations.delegate,
//         // GlobalCupertinoLocalizations.delegate,
//         FallbackLocalizationDelegate()
//       ],
//       builder: (context, child) {
//         return MediaQuery(
//             data: MediaQuery.of(context)
//                 .copyWith(textScaler: TextScaler.noScaling),
//             child: child!);
//       },
//       supportedLocales: locals,
//       home: Container(color: Colors.red),
//       // home: SplashScreen(
//       //   body: body,
//       // ),
//     );
//   }
// }

// class Get {
//   static BuildContext? get context => navigatorKey.currentContext;
//   static NavigatorState? get navigator => navigatorKey.currentState;
// }

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
