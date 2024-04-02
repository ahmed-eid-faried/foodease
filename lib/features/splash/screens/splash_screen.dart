// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:foodease/core/helper/alert_exit_app.dart';
// import 'package:foodease/core/localization/language_constrants.dart';
// import 'package:foodease/core/push_notification/models/notification_body.dart';
// import 'package:foodease/core/routes_manager.dart';
// import 'package:foodease/core/utill/app_constants.dart';
// import 'package:foodease/core/utill/custom_themes.dart';
// import 'package:foodease/core/utill/dimensions.dart';
// import 'package:foodease/core/utill/images.dart';
// import 'package:foodease/core/widgets/common/bouncy_widget.dart';
// import 'package:foodease/core/widgets/common/no_internet_screen_widget.dart';
// import 'package:foodease/features/splash/controllers/splash_controller.dart';
// import 'package:provider/provider.dart';

// class SplashScreen extends StatefulWidget {
//   final NotificationBody? body;
//   const SplashScreen({super.key, this.body});

//   @override
//   SplashScreenState createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();
//   late StreamSubscription<ConnectivityResult> _onConnectivityChanged;

//   @override
//   void initState() {
//     super.initState();

//     bool firstTime = true;
//     _onConnectivityChanged = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) {
//       if (!firstTime) {
//         bool isNotConnected = result != ConnectivityResult.wifi &&
//             result != ConnectivityResult.mobile;
//         isNotConnected
//             ? const SizedBox()
//             : ScaffoldMessenger.of(context).hideCurrentSnackBar();
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             backgroundColor: isNotConnected ? Colors.red : Colors.green,
//             duration: Duration(seconds: isNotConnected ? 6000 : 3),
//             content: Text(
//                 isNotConnected
//                     ? getTranslated('no_connection', context)!
//                     : getTranslated('connected', context)!,
//                 textAlign: TextAlign.center)));
//         if (!isNotConnected) {
//           // _route();
//           Go.knavigatorAndRemove(context, Routes.screens);
//         }
//       }
//       firstTime = false;
//     });
//     Go.knavigatorAndRemove(context, Routes.screens);

//     // _route();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _onConnectivityChanged.cancel();
//   }

//   // void _route() {
//   //   Provider.of<SplashController>(context, listen: false)
//   //       .initConfig(context)
//   //       .then((bool isSuccess) {
//   //     if (isSuccess) {
//   //       Provider.of<SplashController>(Get.context!, listen: false)
//   //           .initSharedPrefData();
//   //       Timer(const Duration(seconds: 1), () {
//   //         if (Provider.of<SplashController>(Get.context!, listen: false)
//   //             .configModel!
//   //             .maintenanceMode!) {
//   //           Navigator.of(Get.context!).pushReplacement(
//   //               MaterialPageRoute(builder: (_) => const MaintenanceScreen()));
//   //         } else if (Provider.of<AuthController>(Get.context!, listen: false)
//   //             .isLoggedIn()) {
//   //           Provider.of<AuthController>(Get.context!, listen: false)
//   //               .updateToken(Get.context!);
//   //           if (widget.body != null) {
//   //             if (widget.body!.type == 'order') {
//   //               Navigator.of(Get.context!).pushReplacement(MaterialPageRoute(
//   //                   builder: (BuildContext context) =>
//   //                       OrderDetailsScreen(orderId: widget.body!.orderId)));
//   //             } else if (widget.body!.type == 'notification') {
//   //               Navigator.of(context).pushReplacement(MaterialPageRoute(
//   //                   builder: (BuildContext context) =>
//   //                       const NotificationScreen()));
//   //             } else {
//   //               Navigator.of(context).pushReplacement(MaterialPageRoute(
//   //                   builder: (BuildContext context) => const InboxScreen(
//   //                         isBackButtonExist: true,
//   //                       )));
//   //             }
//   //           } else {
//   //             Navigator.of(Get.context!).pushReplacement(MaterialPageRoute(
//   //                 builder: (BuildContext context) => const DashBoardScreen()));
//   //           }
//   //         } else if (Provider.of<SplashController>(Get.context!, listen: false)
//   //             .showIntro()!) {
//   //           Navigator.of(Get.context!).pushReplacement(MaterialPageRoute(
//   //               builder: (BuildContext context) => OnBoardingScreen(
//   //                   indicatorColor: ColorResources.grey,
//   //                   selectedIndicatorColor: Theme.of(context).primaryColor)));
//   //         } else {
//   //           if (Provider.of<AuthController>(context, listen: false)
//   //                       .getGuestToken() !=
//   //                   null &&
//   //               Provider.of<AuthController>(context, listen: false)
//   //                       .getGuestToken() !=
//   //                   '1') {
//   //             Navigator.of(context).pushReplacement(MaterialPageRoute(
//   //                 builder: (BuildContext context) => const DashBoardScreen()));
//   //           } else {
//   //             Provider.of<AuthController>(context, listen: false)
//   //                 .getGuestIdUrl();
//   //             Navigator.pushAndRemoveUntil(
//   //                 context,
//   //                 MaterialPageRoute(builder: (_) => const DashBoardScreen()),
//   //                 (route) => false);
//   //           }
//   //         }
//   //       });
//   //     }
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       key: _globalKey,
//       body: Provider.of<SplashController>(context).hasConnection
//           ? Center(
//               child: Column(mainAxisSize: MainAxisSize.min, children: [
//                 BouncyWidget(
//                     duration: const Duration(milliseconds: 2000),
//                     lift: 50,
//                     ratio: 0.5,
//                     pause: 0.25,
//                     child: SizedBox(
//                         width: 150,
//                         child: Image.asset(AppImage.icon, width: 150.0))),
//                 Text(AppConstants.appName,
//                     style: textRegular.copyWith(
//                         fontSize: Dimensions.fontSizeOverLarge,
//                         color: Colors.white)),
//                 Padding(
//                     padding:
//                         const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
//                     child: Text(AppConstants.slogan,
//                         style: textRegular.copyWith(
//                             fontSize: Dimensions.fontSizeDefault,
//                             color: Colors.white)))
//               ]),
//             )
//           : const NoInternetOrDataScreenWidget(
//               isNoInternet: true, child: SplashScreen()),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/images.dart';
import 'package:foodease/features/auth/view/background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImage.logo,
          width: 175.w(context),
          height: 175.w(context),
        ),
        Text(
          'FoodNinja',
          style: TextStyle(
            color: ColorResources.green,
            fontSize: 40.sp(context),
            fontFamily: 'Viga',
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Deliever Favorite Food',
          style: TextStyle(
            color: ColorResources.getSecondary(context),
            fontSize: 13.sp(context),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    ));
  }
}
