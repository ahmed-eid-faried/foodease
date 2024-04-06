import 'package:flutter/material.dart';
import 'package:foodease/core/theme/controllers/theme_controller.dart';
import 'package:foodease/main.dart';
import 'package:provider/provider.dart';

class ColorResources {
  static Color getColombiaBlue(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF678cb5)
        : const Color(0xFF92C6FF);
  }

  static Color getLightSkyBlue(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFc7c7c7)
        : const Color(0xFF8DBFF6);
  }

  static Color getHarlequin(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF257800)
        : const Color(0xFF3FCC01);
  }

  static Color getCheris(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF941546)
        : const Color(0xFFE2206B);
  }

  static Color getTextTitle(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF3FCC01);
  }

  static Color getTextTitleBlack(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF09051C);
  }

  static Color getTextBody(BuildContext context) {
    return (Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFF1F1F1)
        : const Color(0xFF808080));
  }

  static Color getTextBodyGrey(BuildContext context) {
    return (Provider.of<ThemeController>(context).darkTheme
        ? const Color.fromARGB(158, 22, 22, 22)
        : const Color(0xFFFFFFFF).withOpacity(0.30));
  }

//  const
  static Color getMenuIconColor(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFFFFFFF)
        : Theme.of(context).primaryColor;
  }

  static Color getGrey(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF808080)
        : const Color(0xFFF1F1F1);
  }

  static Color getRed(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF7a1c1c)
        : const Color(0xFFFF5555);
  }

  static Color getYellow(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF916129)
        : const Color(0xFFFE961C);
  }

  static Color getHint(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFc7c7c7)
        : const Color(0xFF9E9E9E);
  }

  static Color getGainsBoro(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF999999)
        : const Color(0xFFE6E6E6);
  }

  static Color getTextBg(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF414345)
        : const Color(0xFFF8FBFD);
  }

  static Color getIconBg(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF2e2e2e)
        : const Color(0xFFF9F9F9);
  }

  // static Color getIconBgGreen(BuildContext context) {
  //   return Provider.of<ThemeController>(context).darkTheme
  //       ? const Color(0xFF14BE77)
  //       : const Color(0xFF14BE77);
  // }

  static Color getHomeBg(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        // ? const Color(0xFF3d3d3d)
        ? const Color(0xFF000000)
        : const Color(0xFFFCFCFC);
  }

  static Color getImageBg(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF3f4347)
        : Theme.of(context).primaryColor;
  }

  static Color getSellerTxt(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF517091)
        : const Color(0xFF92C6FF);
  }

  static Color getChatIcon(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFFFFFFF)
        : const Color(0xFFD4D4D4);
  }

  static Color getLowGreen(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF7d8085)
        : const Color(0xFFEFF6FE);
  }

  static Color getGreen(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF167d3c)
        : const Color(0xFF23CB60);
  }

  static Color getFloatingBtn(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF49698c)
        : const Color(0xFF7DB6F5);
  }

  static Color getPurple(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF8B49CB)
        : const Color(0xFF6822AD);
  }

  static Color getPrimary(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFf0f0f0)
        : Theme.of(context).primaryColor;
  }

  static Color getSearchBg(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF585a5c)
        : const Color(0xFFF4F7FC);
  }

  static Color getArrowButtonColor(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFBE8551)
        : const Color(0xFFFE8551);
  }

  static Color getReviewRattingColor(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFF4F7FC)
        : const Color(0xFF66717C);
  }

  static Color visitShop(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF393939)
        : const Color(0xFFE9F3FF);
  }

  static Color whiteColor(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFF4F7FC)
        : const Color(0xFFF3F5F9);
  }

  static Color cartBgColor(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFF3F9FF)
        : const Color(0xFFF3F9FF);
  }

  static Color chattingSenderColor(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF646464)
        : const Color(0xFFE3EDFF);
  }

  static Color couponColor(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFC8E4FF)
        : const Color(0xFFC8E4FF);
  }

  static Color debitCreditColor(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFC8E4FF)
        : const Color(0xFFC8E4FF);
  }

  static Color iconBg() {
    return Provider.of<ThemeController>(Get.context!).darkTheme
        ? Theme.of(Get.context!).primaryColor.withOpacity(.05)
        : const Color(0xffF9F9F9);
  }
//***************************************************************************\\
//***************************************************************************\\
//***************************************************************************\\
  // static const Color blackColor = Color(0xFF000000);
  // static const Color whiteColor = Color(0xFFFFFFFF);
  // static const Color greenColor = Color(0xFF6CB678);
  // static const Color white2Color = Color(0xFFEEEEEE);
  // static const Color redColor = Color(0xFFDE0000);
  // static const Color blueColor = Color(0xff1778F2);

  // static const Color red = Color(0xFFDE0000);
  // static const Color grey = Color(0xFF808080);
  // static const Color lightGrey = Color(0xFFB4B4B4);
  // static const Color rose = Color(0xFFD7B1F1);
  // static const Color rose2 = Color(0xFFECCACA);
  // static const Color white2 = Color(0xFFEEEEEE);
  // static const Color green = Color(0xFF6CB678);
  // static const Color green2 = Color(0xFF6CB778);
  // static const Color blue = Color(0xff1778F2);
  // static const Color redgoogle = Color(0xffEB4335);
  // static const Color white3 = Color(0xFFF6F6F6);
  // static const Color yellow = Color(0xFFFBBC05);
  // static const Color grey3 = Color(0xAA777777);
  // static const Color grey4 = Color(0xFF878A99);
  // static const Color grey5 = Color(0xFFD9D9D9);
  // static const Color black2 = Color(0x00F3F6F9);
  // static const Color shadowCardBlue = Color(0x21000000);
  // static const Color orange = Color(0xFFF28623);
  // static const Color darkBlue = Color(0xFF2B2B2B);
//***************************************************************************\\
  static Color background(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF2D2D2D)
        : const Color(0xFFFFFFFF);
  }

  static Color bgCard(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color.fromARGB(255, 30, 30, 30)
        : const Color(0xFFFFFFFF);
  }

  static Color text(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color.fromARGB(238, 153, 153, 153)
        : const Color(0xFFFFFFFF);
  }

  static Color getBlack(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF2D2D2D);
  }

  static Color getWhite(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF2D2D2D)
        : const Color(0xFFFFFFFF);
  }

  static Color red(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFDE0000)
        : const Color(0xFFDE0000);
  }

  static Color grey6(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color.fromARGB(255, 172, 170, 170)
        : const Color(0xFF808080);
  }

  static Color lightGrey(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFB4B4B4)
        : const Color(0xFFB4B4B4);
  }

  static Color rose(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFD7B1F1)
        : const Color(0xFFD7B1F1);
  }

  static Color rose2(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFECCACA)
        : const Color(0xFFECCACA);
  }

  static Color white2(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color.fromARGB(255, 86, 86, 86)
        : const Color(0xFFEEEEEE);
  }

  static Color white4(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color.fromARGB(255, 50, 50, 50)
        : const Color(0xFFECECEC);
  }

  static Color getGreen1(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF6CB678)
        : const Color(0xFF6CB678);
  }

  static Color green2(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF6CB778)
        : const Color(0xFF6CB778);
  }

  static Color blue(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF1778F2)
        : const Color(0xFF1778F2);
  }

  static Color redgoogle(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFEB4335)
        : const Color(0xFFEB4335);
  }

  static Color white3(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFF6F6F6)
        : const Color(0xFF000000);
  }

  static Color yellow(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFFBBC05)
        : const Color(0xFFFBBC05);
  }

  static Color grey3(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xAA777777)
        : const Color(0xAA777777);
  }

  static Color grey4(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFF878A99)
        : const Color(0xFF000000);
  }

  static Color grey5(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFD9D9D9)
        : const Color(0xFFD9D9D9);
  }

  static Color black2(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0x00F3F6F9)
        : const Color(0xFF000000);
  }

  static Color shadowCardBlue(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0x21000000)
        : const Color(0x21000000);
  }

  static Color orange(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFF28623)
        : const Color(0xFFF28623);
  }

  static Color darkBlue(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xFFF6F6F6)
        : const Color(0xFF2B2B2B);
  }

//***************************************************************************\\
//***************************************************************************\\
  // static const Color lightSkyBlue = Color(0xff8DBFF6);
  // static const Color harlequin = Color(0xff3FCC01);
  // static const Color cris = Color(0xffE2206B);
  // static const Color hintTextColor = Color(0xff9E9E9E);
  // static const Color gainsBg = Color(0xffE6E6E6);
  // static const Color textBg = Color(0xffF3F9FF);
  // static const Color homeBg = Color(0xffF0F0F0);
  // static const Color imageBg = Color(0xffE2F0FF);
  // static const Color sellerText = Color(0xff92C6FF);
  // static const Color chatIconColor = Color(0xffD4D4D4);
  // static const Color lowGreen = Color(0xffEFF6FE);
  ///
  // static const Color green = Color(0xff23CB60);
  // static const Color iconBg = Color(0xffF9F9F9);
  // static const Color grey = Color(0xffF1F1F1);
  // static const Color red = Color(0xFFD32F2F);
  // static const Color yellow = Color(0xFFFFAA47);
  // static const Color black = Color(0xff000000);
  // static const Color white = Color(0xFFE9EEF4);
//***************************************************************************\\
//***************************************************************************\\
//***************************************************************************\\
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xFFE9EEF4);
  static const Color lightSkyBlue = Color(0xff8DBFF6);
  static const Color harlequin = Color(0xff3FCC01);
  static const Color cris = Color(0xffE2206B);
  static const Color grey = Color(0xffF1F1F1);
  // static const Color red = Color(0xFFD32F2F);
  // static const Color yellow = Color(0xFFFFAA47);
  static const Color yellow2 = Color(0xFFFFE14D);
  static const Color hintTextColor = Color(0xff9E9E9E);
  static const Color gainsBg = Color(0xffE6E6E6);
  static const Color textBg = Color(0xffF3F9FF);
  // static const Color iconBg = Color(0xffF9F9F9);
  static const Color homeBg = Color(0xffF0F0F0);
  static const Color imageBg = Color(0xffE2F0FF);
  static const Color sellerText = Color(0xff92C6FF);
  static const Color chatIconColor = Color(0xffD4D4D4);
  static const Color lowGreen = Color(0xffEFF6FE);
  static const Color green = Color(0xff23CB60);
//***************************************************************************\\
//***************************************************************************\\
//***************************************************************************\\
  // static const Color blackColor = Color(0xFF000000);
  // static const Color whiteColor = Color(0xFFFFFFFF);
  // static const Color greenColor = Color(0xFF6CB678);
  // static const Color white2Color = Color(0xFFEEEEEE);
  // static const Color redColor = Color(0xFFDE0000);
  // static const Color blueColor = Color(0xff1778F2);
  static const Map<int, Color> colorMap = {
    50: Color(0x101455AC),
    100: Color(0x201455AC),
    200: Color(0x301455AC),
    300: Color(0x401455AC),
    400: Color(0x501455AC),
    500: Color(0x601455AC),
    600: Color(0x701455AC),
    700: Color(0x801455AC),
    800: Color(0x901455AC),
    900: Color(0xff1455AC),
  };

  static const MaterialColor primaryMaterial =
      MaterialColor(0xFF53E78B, colorMap);
//  const Color(0xFF53E78B)
  static getSecondary(BuildContext context) {
    return Provider.of<ThemeController>(context).darkTheme
        ? const Color(0xffF3F9FF)
        : const Color(0xFF09051C);
  }
}
