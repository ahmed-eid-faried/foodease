import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/core/widgets/custom_widgets/text_form_field_custom.dart';
import 'package:foodease/features/auth/view/background.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPictureCustom(
          AppSvg.logo2,
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
        ),
        const Text(
          'Login To Your Account',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF09041B),
            fontSize: 20,
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
            color: const Color(0xFF09051C),
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
        const Text(
          'Forgot Your Password?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF53E78B),
            fontSize: 12,
            fontFamily: 'BentonSans Medium',
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            decorationColor: Color(0xFF53E78B),
            height: 0.14,
          ),
        ),
        const SizedBox().h(36, context),
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
  });
  final Widget? icon;
  final Widget? child;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      // minWidth: 152.w(context),
      // height: 57.h(context),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFF4F4F4)),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(22),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(visible: icon != null, child: icon ?? Container()),
          Visibility(
              visible: icon != null, child: const SizedBox().w(12, context)),
          child ??
              Text(
                text ?? "",
                style: TextStyle(
                  color: const Color(0xFF09051C),
                  fontSize: 14.sp(context),
                  fontFamily: 'BentonSans Medium',
                  fontWeight: FontWeight.w400,
                ),
              ),
        ],
      ),
    );
  }
}
