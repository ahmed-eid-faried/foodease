import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/images.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/core/widgets/custom_widgets/text_form_field_custom.dart';
import 'package:foodease/features/auth/view/background.dart';
import 'package:foodease/features/onboarding/onboarding.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImage.logo,
          // width: 175.w(context),
          // height: 175.w(context),
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
        ),
        const SizedBox().h(60, context),
        Text(
          'Login To Your Account',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorResources.getTextTitleBlack(context),
            fontSize: 20.sp(context),
            fontFamily: 'BentonSans Bold',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox().h(40, context),
        TextFormFieldCustom(
          title: "Email",
          fontSize: 14.sp(context),
        ),
        const SizedBox().h(12, context),
        TextFormFieldCustom(
          title: "Password",
          fontSize: 14.sp(context),
        ),
        const SizedBox().h(20, context),
        Text(
          'Or Continue With',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorResources.getTextTitleBlack(context),
            fontSize: 12.sp(context),
            fontFamily: 'BentonSans Bold',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox().h(20, context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox().w(20, context),
            const Expanded(
              child: ButtonCustom(
                text: "Facebook",
                icon: SvgPictureCustom(AppSvg.facebook),
              ),
            ),
            const SizedBox().w(20, context),
            const Expanded(
              child: ButtonCustom(
                text: "Google",
                icon: SvgPictureCustom(AppSvg.google),
              ),
            ),
            const SizedBox().w(20, context),
          ],
        ),
        const SizedBox().h(20, context),
        Text(
          'Forgot Your Password?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF53E78B),
            fontSize: 12.sp(context),
            fontFamily: 'BentonSans Medium',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            decorationColor: const Color(0xFF53E78B),
          ),
        ),
        const SizedBox().h(36, context),
        const CustomButtonGreen(
          title: 'Login',
        ),
      ],
    ));
  }
}

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    this.icon,
    this.child,
    this.text,
    this.color,
    this.onPressed,
    this.minWidth,
    this.height,
    this.padding = 22,
  });

  final Widget? icon;
  final Widget? child;
  final double? minWidth;
  final double? height;
  final String? text;
  final Color? color;
  final void Function()? onPressed;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ColorResources.getIconBg(context),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.grey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(padding),
        // minimumSize: Size(minWidth ?? 0, 0),
        fixedSize: (minWidth == null || height == null)
            ? Size(375.w(context), 60.w(context))
            : Size(minWidth!, height!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: icon != null,
            child: icon ?? Container(),
          ),
          Visibility(
            visible: icon != null,
            child: const SizedBox(width: 12),
          ),
          child ??
              Text(
                text ?? "",
                style: TextStyle(
                  color: ColorResources.getTextTitleBlack(context),
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w400,
                ),
              ),
        ],
      ),
    );
  }
}
