import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/appbar/custom_app_bar.dart';
import 'package:foodease/core/widgets/custom_widgets/custom_scaffold.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/features/onboarding/onboarding.dart';

class SetLocation extends StatelessWidget {
  const SetLocation({super.key});

  @override
  Widget build(BuildContext context) {
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
                      'Set Your Location ',
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
                    'This data will be displayed in your account profile for security',
                    style: TextStyle(
                      color: ColorResources.getTextBody(context),
                      fontSize: 12.sp(context),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox().h(20, context),
                const SetLocationCard(),
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

class SetLocationCard extends StatelessWidget {
  const SetLocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w(context),
      padding: EdgeInsets.all(12.sp(context)),
      decoration: ShapeDecoration(
        color: ColorResources.getIconBg(context).withOpacity(0.6),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: ColorResources.black),
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
      child: Column(
        children: [
          const SizedBox().h(10, context),
          Row(
            children: [
              Container(
                  width: 33.sp(context),
                  height: 33.sp(context),
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.all(6.sp(context)),
                  decoration: const ShapeDecoration(
                    color: ColorResources.yellow2,
                    shape: OvalBorder(),
                  ),
                  child: const SvgPictureCustom(AppSvg.location)),
              const SizedBox().w(14, context),
              const Text(
                'Your Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'BentonSans Medium',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const SizedBox().h(30, context),
          Container(
            width: 322.w(context),
            padding: EdgeInsets.symmetric(vertical: 20.h(context)),
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1, color: ColorResources.getGrey(context)),
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
            child: const Center(
              child: Text(
                'Set Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
