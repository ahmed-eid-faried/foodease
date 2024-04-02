import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/media_query_values.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) => Page(
                svg: onboardingPages[index].svg,
                title: onboardingPages[index].title,
                body: onboardingPages[index].body,
              ),
            ),
          ),
          const SizedBox().h(42, context),
          const CustomButtonGreen(
            title: 'Next',
          ),
          const SizedBox().h(62, context),
        ],
      ),
    );
  }
}

class CustomButtonGreen extends StatelessWidget {
  const CustomButtonGreen({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 157.w(context),
        height: 57.h(context),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.99, -0.15),
            end: Alignment(-0.99, 0.15),
            colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp(context),
              fontFamily: 'BentonSans Bold',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.svg,
    required this.title,
    required this.body,
  });
  final String svg;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox().h(60, context),
        SvgPictureCustom(
          svg,
          width: context.width,
          height: 400.h(context),
        ),
        const SizedBox().h(40, context),
        SizedBox(
          width: 211.w(context),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.sp(context),
              fontFamily: 'BentonSans Bold',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox().h(20, context),
        SizedBox(
          width: 244.w(context),
          child: Text(
            body,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp(context),
              fontFamily: 'BentonSans Book',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardingModel {
  final String svg;
  final String title;
  final String body;

  OnboardingModel({required this.svg, required this.title, required this.body});
}

List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    svg: AppSvg.onboardinglight1,
    title: 'Find your  Comfort Food here',
    body: 'Here You Can find a chef or dish for every taste and color. Enjoy!',
  ),
  OnboardingModel(
    svg: AppSvg.onboardinglight2,
    title: 'Food Ninja is Where Your Comfort Food Lives',
    body: 'Enjoy a fast and smooth food delivery at your doorstep',
  ),
];
