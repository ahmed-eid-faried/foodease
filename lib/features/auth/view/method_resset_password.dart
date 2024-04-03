import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/appbar/custom_app_bar.dart';
import 'package:foodease/core/widgets/custom_widgets/custom_scaffold.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/features/auth/view/signup.dart';
import 'package:foodease/features/onboarding/onboarding.dart';

class MethodRessetPassword extends StatelessWidget {
  const MethodRessetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    String phone = "+201555663045";
    String email = "ahmed.mohamed98@gmail.com";
    return CustomScaffold(
        appBar: const CustomAppBar(text: ""),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 264.w(context),
                    child: Text(
                      'Forgot password?',
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
                MethodRessetPasswordCard(
                  svg: AppSvg.sms,
                  title: 'Via sms:',
                  input: phone,
                  phone: true,
                ),
                const SizedBox().h(20, context),
                MethodRessetPasswordCard(
                  svg: AppSvg.message,
                  title: 'Via email:',
                  input: email,
                  phone: false,
                ),
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonGreen(
                      title: 'Next',
                    ),
                  ],
                ),
                const SizedBox().h(60, context),
              ],
            )));
  }
}

class MethodRessetPasswordCard extends StatelessWidget {
  const MethodRessetPasswordCard({
    super.key,
    required this.svg,
    required this.title,
    required this.input,
    this.phone = false,
  });

  final String svg;
  final String title;
  final String input;
  final bool phone;
  @override
  Widget build(BuildContext context) {
    return ButtonCustom(
      minWidth: 325.w(context),
      height: 90.h(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPictureCustom(
            svg,
            height: 40.r(context),
            width: 40.r(context),
          ),
          const SizedBox().w(16, context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF828282),
                  fontSize: 16.sp(context),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox().h(4, context),
              phone
                  ? InvisiblePhoneWidget(phone: input)
                  : InvisibleEmailWidget(email: input),
            ],
          )
        ],
      ),
    );
  }
}

class InvisiblePhoneWidget extends StatelessWidget {
  const InvisiblePhoneWidget({
    super.key,
    required this.phone,
  });

  final String phone;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(
            phone.length,
            (index) => Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.only(
                      right: ((index % 4) == 0 && index != 0) ? 12 : 4),
                  decoration: ShapeDecoration(
                    color: ColorResources.getChatIcon(context),
                    shape: const OvalBorder(),
                  ),
                )),
        const SizedBox().w(4, context),
        Text(
          phone.substring((phone.length - 4), phone.length),
          style: TextStyle(
            color: ColorResources.getTextTitle(context),
            fontSize: 16.sp(context),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class InvisibleEmailWidget extends StatelessWidget {
  const InvisibleEmailWidget({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(
            email.length > 10 ? 10 : email.length,
            (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: ShapeDecoration(
                    color: ColorResources.getChatIcon(context),
                    shape: const OvalBorder(),
                  ),
                )),
        const SizedBox().w(4, context),
        Text(
          "@${email.split("@")[1]}",
          style: TextStyle(
            color: ColorResources.getTextTitle(context),
            fontSize: 16.sp(context),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
