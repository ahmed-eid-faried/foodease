import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/images.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/core/widgets/custom_widgets/text_custom.dart';
import 'package:foodease/core/widgets/custom_widgets/text_form_field_custom.dart';
import 'package:foodease/features/auth/view/background.dart';
import 'package:foodease/features/onboarding/onboarding.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w(context)),
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
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'Deliever Favorite Food',
            style: TextStyle(
              color: ColorResources.getSecondary(context),
              fontSize: 13.sp(context),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Sign Up For Free ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF09041B),
              fontSize: 20.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox().h(40, context),
          TextFormFieldCustom(
            title: "Anamwp",
            prefixIcon: const SvgPictureCustom(AppSvg.man),
            fontSize: 14.sp(context),
          ),
          const SizedBox().h(12, context),
          TextFormFieldCustom(
            title: "Email",
            prefixIcon: const SvgPictureCustom(AppSvg.email),
            fontSize: 14.sp(context),
          ),
          const SizedBox().h(12, context),
          TextFormFieldCustom(
            title: "Password",
            prefixIcon: const SvgPictureCustom(AppSvg.password),
            suffixIcon: const SvgPictureCustom(AppSvg.visible),
            fontSize: 14.sp(context),
          ),
          const SizedBox().h(12, context),
          const FeatureItem(title: 'Keep Me Signed In'),
          const SizedBox().h(12, context),
          const FeatureItem(title: 'Email Me About Special Pricing'),
          const SizedBox().h(36, context),
          const CustomButtonGreen(
            title: 'Create Account',
          ),
          const SizedBox().h(20, context),
          Text(
            'already have an account?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF53E78B),
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: const Color(0xFF53E78B),
            ),
          ),
        ],
      ),
    ));
  }
}

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 22.sp(context),
            height: 22.sp(context),
            padding: EdgeInsets.all(4.sp(context)),
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.99, -0.15),
                end: Alignment(-0.99, 0.15),
                colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFF4F4F4)),
                borderRadius: BorderRadius.circular(15),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x115A6CEA),
                  blurRadius: 50,
                  offset: Offset(12, 26),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const SvgPictureCustom(AppSvg.check)),
        const SizedBox().w(8, context),
        Opacity(
          opacity: 0.50,
          child: TextCustom(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w600,
              height: 0.14,
            ),
          ),
        ),
      ],
    );
  }
}
