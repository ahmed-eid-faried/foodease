import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodease/core/helper/alert_exit_app.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/core/widgets/custom_widgets/text_custom.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(65);

  final IconData? iconData;
  final String? text;
  final Function? onPressed;
  final List<Widget>? actions;
  final bool isNull;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? centerTitle;
  final Widget? widget;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final Brightness? brightness;
  final double elevation;
  final String? iconSvg;
  final bool isBack;

  const CustomAppBar({
    super.key,
    this.iconData = Icons.arrow_back_rounded,
    this.text = '',
    this.widget,
    this.onPressed,
    this.isNull = true,
    this.centerTitle = true,
    this.textAlign = TextAlign.center,
    this.fontSize = 12 * 2,
    this.fontWeight = FontWeight.w600,
    this.backgroundColor,
    this.brightness = Brightness.dark,
    this.textColor,
    //AppColor.black(context)
    this.iconColor,
    // AppColor.black(context)
    this.actions,
    this.elevation = 0,
    this.iconSvg,
    this.isBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor:
          (backgroundColor ?? ColorResources.getHomeBg(context)).withOpacity(0),
      centerTitle: centerTitle,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: brightness,
        statusBarColor: backgroundColor,
      ),
      leadingWidth: 95.w(context),
      leading: isBack
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w(context)),
              child: InkWell(
                onTap: () => Go.pop(context),
                child: Container(
                  width: 45.r(context),
                  height: 45.r(context),
                  padding: EdgeInsets.symmetric(
                      horizontal: 18.w(context), vertical: 14.h(context)),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF9012).withOpacity(0.10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const SvgPictureCustom(
                    AppSvg.back,
                  ),
                ),
              ),
            )
          : Container(),
      title: TextCustom(text!,
          style: TextStyle(
              color: ColorResources.getTextTitle(context),
              fontSize: 16.sp(context),
              fontWeight: FontWeight.w400)),
      actions: actions,
    );
  }
}
