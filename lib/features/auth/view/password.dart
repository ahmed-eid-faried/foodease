import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/images.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/appbar/custom_app_bar.dart';
import 'package:foodease/core/widgets/custom_widgets/custom_scaffold.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/core/widgets/custom_widgets/text_custom.dart';
import 'package:foodease/core/widgets/custom_widgets/text_form_field_custom.dart';
import 'package:foodease/features/auth/view/background.dart';
import 'package:foodease/features/onboarding/onboarding.dart';

class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 264.w(context),
                  child: Text(
                    'Reset your password here',
                    style: TextStyle(
                      color: ColorResources.getTextTitle(context),
                      fontSize: 25.sp(context),
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              const SizedBox().h(20, context),
              SizedBox(
                width: 239.w(context),
                child: Text(
                  'Select which contact details should we use to reset your password',
                  style: TextStyle(
                    color: ColorResources.getTextBody(context),
                    fontSize: 12.sp(context),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox().h(20, context),
              TextFormFieldCustom(
                title: 'New Password',
                // prefixIcon: const SvgPictureCustom(AppSvg.password),
                suffixIcon: const SvgPictureCustom(
                  AppSvg.visible,
                  color: ColorResources.green,
                ),
                fontSize: 14.sp(context),
              ),
              const SizedBox().h(20, context),
              TextFormFieldCustom(
                title: 'Confirm Password',
                // prefixIcon: const SvgPictureCustom(AppSvg.password),
                suffixIcon: const SvgPictureCustom(AppSvg.visible),
                fontSize: 14.sp(context),
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.center,
                child: CustomButtonGreen(
                  title: 'Next',
                ),
              ),
              const SizedBox().h(60, context),
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
