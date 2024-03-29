// import 'package:vendors/core/imports/export_path.dart';
// import 'package:vendors/core/splash_screen.dart';
// import 'package:vendors/features/MyStore/presentation/pages/mystore.dart';
// import 'package:vendors/features/add_product/presentation/pages/addproduct.dart';
// import 'package:vendors/features/address/presentation/pages/add_new_address.dart';
// import 'package:vendors/features/address/presentation/pages/saved_address_list.dart';
// import 'package:vendors/features/auth/presentation/pages/change_password.dart';
// import 'package:vendors/features/auth/presentation/pages/forget_password/forget_password.dart';
// import 'package:vendors/features/auth/presentation/pages/login/login.dart';
// // import 'package:vendors/features/auth/presentation/pages/register/register.dart';
// import 'package:vendors/features/balance/presentation/pages/balance.dart';
// import 'package:vendors/features/cash_exchange/presentation/pages/cash_exchange.dart';
// import 'package:vendors/features/customer_service/presentation/pages/customer_service_intro.dart';
// import 'package:vendors/features/customer_service/presentation/pages/customer_service_list.dart';
// import 'package:vendors/features/home/presentation/pages/home.dart';
// import 'package:vendors/features/main_page/presentaion/pages/main_page.dart';
// import 'package:vendors/features/notifications/presentation/pages/notifications.dart';
// import 'package:vendors/features/onboarding/presentation/pages/onboarding.dart';
// import 'package:vendors/features/order_details/presentation/pages/order_details.dart';
// import 'package:vendors/features/orders/presentation/pages/recent_orders.dart';
// import 'package:vendors/features/profile/presentation/pages/my_profile.dart';
// import 'package:vendors/features/refund_request/presentation/pages/recent_orders.dart';
// import 'package:vendors/features/request_details/presentation/pages/request_details.dart';
// import 'package:vendors/features/screens/presentation/pages/screens.dart';
// import 'package:vendors/features/store_details/presentation/pages/store_details.dart';
// import 'package:vendors/features/suppling_requests/presentation/pages/suppling_requests.dart';

// import '../../features/customer_service/presentation/pages/delivery_and_shipping_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodease/features/auth/view/background.dart';
import 'package:foodease/features/auth/view/signup.dart';
import 'package:foodease/features/onboarding/onboarding.dart';
import 'package:foodease/features/screens/screens.dart';
import 'package:foodease/features/splash/screens/splash_screen.dart';

class Routes {
  static const String myAnimatedSplashScreen = "/myAnimatedSplashScreen";
  static const String screens = "/screens";
  static const String onboarding = "/onboarding";
  static const String backgroundScreen = "/backgroundScreen";
  static const String splashScreen = "/splashScreen";
  static const String signUp = "/signUp";

  // static const String home = "/home";
  // static const String recentOrders = "/recentOrders";
  // static const String balance = "/balance";
  // static const String mystore = "/mystore";
  // static const String addproduct = "/addproduct";
  // static const String orderDetails = "/orderDetails";
  // static const String storedetails = "/storedetails";
  // static const String supplingRequests = "/supplingRequests";
  // static const String requestDetails = "/RequestDetails";
  // static const String cashExchange = "/cashExchange";
  // static const String login = "/login";
  // static const String changePassword = "/changePassword";
  // // static const String register = "/register";
  // static const String forgetPassword = "/forgetPassword";
  // static const String savedAddressView = "/SavedAddressView";
  // static const String addNewAddress = "/addNewAddress";
  // static const String onboarding = "/onboarding";
  // static const String customerServiceChat = "/customerServiceChat";
  // static const String customerServiceIntro = "/CustomerServiceIntro";
  // static const String customServiceDetails = "/CustomServiceDetails";
  // static const String notifications = "/notifications";
  // static const String mainPage = "/mainPage";
  // static const String myProfile = "/MyProfile";
  // static const String refundOrders = "/refundOrders";
}

class RoutesMap {
  static Map<String, Widget Function(BuildContext)> routesMap() {
    return {Routes.screens: (p0) => const Screens()};
  }
// AddProduct
// AddProduct

// MyStore
// StoreDetails
// OrderDetails
// RequestDetails
// CustomerServiceChat

// Notifications
// CashExchange

// AddNewAddress
// SavedAddressView
  static Widget routeMap(String screen) {
    switch (screen) {
      case Routes.myAnimatedSplashScreen:
        return const Screens();
      case Routes.screens:
        return const Screens();
      case Routes.onboarding:
        return const Onboarding();
      case Routes.backgroundScreen:
        return BackgroundScreen(
          child: Container(),
        );
      case Routes.splashScreen:
        return const SplashScreen();
      case Routes.signUp:
        return const SignUp();
      // case Routes.mystore:
      //   return const MyStore();
      // case Routes.addproduct:
      //   return const AddProduct();
      // case Routes.orderDetails:
      //   return const OrderDetails();
      // case Routes.storedetails:
      //   return const StoreDetails();
      // case Routes.supplingRequests:
      //   return const SupplingRequests();
      // case Routes.requestDetails:
      //   return const RequestDetails();
      // case Routes.cashExchange:
      //   return const CashExchange();
      // case Routes.login:
      //   return const Login();
      // case Routes.changePassword:
      //   return const ChangePassword();
      // case Routes.forgetPassword:
      //   return const ForgetPassword();
      // case Routes.addNewAddress:
      //   return const AddNewAddress();
      // case Routes.savedAddressView:
      //   return const SavedAddressView();
      // case Routes.onboarding:
      //   return const Onboarding();
      // case Routes.customerServiceChat:
      //   return const CustomerServiceChat();
      // case Routes.customerServiceIntro:
      //   return const CustomerServiceIntro();
      // case Routes.customServiceDetails:
      //   return const CustomServiceDetails();
      // case Routes.notifications:
      //   return const Notifications();
      // case Routes.mainPage:
      //   return const MainPage();
      // case Routes.myProfile:
      //   return const MyProfile();
      // case Routes.refundOrders:
      //   return const RefundOrders();
      default:
        return const Screens();
    }
  }
}
