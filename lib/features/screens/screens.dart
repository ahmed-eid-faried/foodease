import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodease/core/helper/alert_exit_app.dart';
import 'package:foodease/core/helper/cache_helper.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/localization/locale_keys.g.dart';
import 'package:foodease/core/routes_manager.dart';
import 'package:foodease/core/theme/controllers/theme_controller.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/values_manager.dart';
import 'package:foodease/core/widgets/custom_widgets/text_custom.dart';
import 'package:foodease/features/screens/restart_widget.dart';
import 'package:provider/provider.dart';

List<PageModel> listScreens = [
  const PageModel(
    title: "MainPage",
    route: Routes.mainPage,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Onboarding",
    route: Routes.onboarding,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Background",
    route: Routes.backgroundScreen,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "SplashScreen",
    route: Routes.splashScreen,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "signUp",
    route: Routes.signUp,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "signIn",
    route: Routes.signIn,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Signup Process",
    route: Routes.signupProcess,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Payment Method",
    route: Routes.paymentMethod,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Upload Photo",
    route: Routes.uploadPhoto,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Set Location",
    route: Routes.setLocation,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Signup Success Notification",
    route: Routes.signupSuccessNotification,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Success Notification",
    route: Routes.successNotification,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Verification Code",
    route: Routes.verificationCode,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Method Resset Password",
    route: Routes.methodRessetPassword,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Password",
    route: Routes.password,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
  const PageModel(
    title: "Home",
    route: Routes.home,
    mobile: true,
    tablet: true,
    landscape: false,
    locale: true,
    controller: false,
  ),
];

// MainPage
class Screens extends StatelessWidget {
  const Screens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextCustom(LocaleKeys.screens)),
      body: SizedBox(
        width: 390.w(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceAround,
                  // mainAxisAlignment: MainAxisAlignment aceAround,
                  children: [
                    IconButton(
                        onPressed: () => FunScreen.clear(context),
                        icon: const Column(
                          children: [
                            CustomIcon(icon: Icons.clear_all),
                            TextCustom(LocaleKeys.clearAll),
                          ],
                        )),
                    IconButton(
                        onPressed: () => FunScreen.removeOnboardingKey(context),
                        icon: const Column(
                          children: [
                            CustomIcon(icon: Icons.logout),
                            TextCustom(LocaleKeys.logout),
                          ],
                        )),
                    IconButton(
                        onPressed: () => FunScreen.refresh(context),
                        icon: Column(
                          children: [
                            const CustomIcon(icon: Icons.refresh),
                            TextCustom(LocaleKeys.refresh),
                          ],
                        )),
                    IconButton(
                      onPressed: () => FunScreen.languageAr(context),
                      icon: const IconButton(
                          onPressed: null,
                          icon: Column(
                            children: [
                              CustomIcon(icon: Icons.language),
                              TextCustom("AR"),
                            ],
                          )),
                    ),
                    IconButton(
                        onPressed: () => FunScreen.languageEn(context),
                        icon: const Column(
                          children: [
                            CustomIcon(icon: Icons.language),
                            TextCustom("EN"),
                          ],
                        )),
                    IconButton(
                        onPressed: () async => await FunScreen.portrait(),
                        icon: Column(
                          children: [
                            const CustomIcon(icon: Icons.portrait),
                            TextCustom(LocaleKeys.portrait),
                          ],
                        )),
                    IconButton(
                      onPressed: () {
                        // Trigger an exception
                        throw Exception('Test Crash');
                      },
                      icon: Column(
                        children: [
                          const CustomIcon(icon: Icons.error),
                          TextCustom(LocaleKeys.error),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () async => await FunScreen.landscape(),
                        icon: Column(
                          children: [
                            const CustomIcon(icon: Icons.landscape),
                            TextCustom(LocaleKeys.landscape),
                          ],
                        )),
                    IconButton(
                        onPressed: () async => await FunScreen.theme(context),
                        icon: const Column(
                          children: [
                            CustomIcon(icon: Icons.dark_mode),
                            TextCustom(LocaleKeys.theme),
                          ],
                        )),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(width: 100),
                  TextCustom(
                    LocaleKeys.mobile,
                    fontSize: 10.0,
                  ),
                  const SizedBox(width: AppSize.s20),
                  TextCustom(
                    LocaleKeys.tablet,
                    fontSize: 10.0,
                  ),
                  const SizedBox(width: AppSize.s20),
                  TextCustom(
                    LocaleKeys.landscape,
                    fontSize: 10.0,
                  ),
                  const SizedBox(width: AppSize.s20),
                  TextCustom(
                    LocaleKeys.locale,
                    fontSize: 10.0,
                  ),
                  const SizedBox(width: AppSize.s20),
                  const TextCustom(
                    "Contr",
                    fontSize: 10.0,
                  ),
                  const SizedBox(width: AppSize.s20),
                ],
              ),
              SizedBox(
                height: 670,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  itemCount: listScreens.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, i) => Page(
                    title: listScreens[i].title,
                    route: listScreens[i].route,
                    mobile: listScreens[i].mobile,
                    tablet: listScreens[i].tablet,
                    landscape: listScreens[i].landscape,
                    locale: listScreens[i].locale,
                    controller: listScreens[i].controller,
                    type: listScreens[i].type,
                    child: listScreens[i].child,
                  ),
                ),
              ),
              // SizedBox(height: 100 ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageModel {
  final String title;
  final String? route;
  final bool mobile;
  final bool tablet;
  final bool landscape;
  final bool locale;
  final bool controller;
  final Type? type;

  final Widget? child;

  const PageModel({
    required this.title,
    required this.route,
    required this.mobile,
    required this.tablet,
    required this.landscape,
    required this.locale,
    required this.controller,
    this.child,
    this.type,
  });
}

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.title,
    required this.route,
    this.mobile = false,
    this.tablet = false,
    this.landscape = false,
    this.locale = false,
    this.type,
    required this.child,
    required this.controller,
  });

  final String title;
  final String? route;
  final bool mobile;
  final bool tablet;
  final bool landscape;
  final bool locale;
  final bool controller;
  final Type? type;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // scrollDirection: Axis orizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 120.sp(context),
            child: ElevatedButton(
              onPressed: (route == null && type == Type.dialog && child != null)
                  ? () =>
                      showDialog(context: context, builder: (context) => child!)
                  : (route == null && type == Type.bottomSheet && child != null)
                      ? () => showModalBottomSheet(
                          context: context, builder: (context) => child!)
                      : (route == null)
                          ? null
                          : () {
                              Go.navigator(context, route!);
                            },
              // width: AppSize.s100 * 1,
              child: Text(title),
            ),
          ),
          const Spacer(),
          StateOfScreen(state: mobile),
          const Spacer(),
          StateOfScreen(state: tablet),
          const Spacer(),
          StateOfScreen(state: landscape),
          const Spacer(),
          StateOfScreen(state: locale),
          const Spacer(),
          StateOfScreen(state: controller),
          const Spacer(),
        ],
      ),
    );
  }
}

enum Type { dialog, bottomSheet }

class StateOfScreen extends StatelessWidget {
  const StateOfScreen({
    super.key,
    required this.state,
  });

  final bool state;

  @override
  Widget build(BuildContext context) {
    return state ? const TextCustom("YES") : const TextCustom("NO");
  }
}

class FunScreen {
  static refresh(BuildContext context) async {
    RestartWidget.restartApp(context);
  }

  static removeOnboardingKey(BuildContext context) async {
    // CacheHelper.removeData(key: AppStrings.cachedOnBoarding);
    refresh(context);
  }

  static clear(BuildContext context) async {
    CacheHelper.clearData();
    refresh(context);
  }

  static languageEn(BuildContext context) async {
    Locale locale = const Locale('en', 'US');
    await language(context, locale: locale);
  }

  static languageAr(BuildContext context) async {
    Locale locale = const Locale('ar', 'EG');
    await language(context, locale: locale);
  }

  static language(BuildContext context, {required Locale locale}) async {
    // log(
    //   locale.toString(),
    //   //  name: toString()
    // );
    // SharedPreferences.getInstance().then((val) =>
    //     val.setBool('ARABIC', locale.languageCode == 'ar' ? true : false));
    // await CacheHelper.put(
    //         key: 'ARABIC', value: locale.languageCode == 'ar' ? true : false)
    //     .then((value) {
    //   AppConstants.language = CacheHelper.get(key: 'ARABIC') ?? false;
    //   context
    //       .setLocale(locale)
    //       .then((value) => RestartWidget.restartApp(context));
    //   debugPrint("${AppConstants.language}");
    // });
  }

  static Future<void> portrait() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  static Future<void> landscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  static Future<void> theme(BuildContext context) async {
    Provider.of<ThemeController>(context, listen: false).toggleTheme();
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    this.size = 20,
    this.fill,
    // this eight,
    this.grade,
    this.opticalSize,
    this.color,
    this.shadows,
    this.semanticLabel,
    // this.textDirection,
    this.applyTextScaling,
    this.icon,
    this.weight,
  });
  final IconData? icon;
  final double size;
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final Color? color;
  final List<Shadow>? shadows;
  final String? semanticLabel;
  // final TextDirection? ktextDirection;
  final bool? applyTextScaling;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      fill: fill,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      color: color ?? ColorResources.getTextBody(context),
      shadows: shadows,
      semanticLabel: semanticLabel,
      // textDirection: textDirection,
      applyTextScaling: applyTextScaling,
    );
  }
}
