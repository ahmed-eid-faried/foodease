import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/custom_scaffold.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/features/onboarding/onboarding.dart';

class SuccessNotification extends StatelessWidget {
  const SuccessNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        // appBar: const CustomAppBar(text: ""),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox().h(228, context),
                const Spacer(),
                SvgPictureCustom(
                  AppSvg.congrats,
                  width: 172.w(context),
                  height: 162.h(context),
                ),
                const SizedBox().h(33, context),
                const Text(
                  'Congrats!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF53E78B),
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox().h(12, context),
                const Text(
                  'Password reset succesful',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButtonGreen(
                      title: 'Back',
                    ),
                  ],
                ),
                const SizedBox().h(60, context),
              ],
            )));
  }
}
