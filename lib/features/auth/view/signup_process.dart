import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/widgets/custom_widgets/appbar/custom_app_bar.dart';
import 'package:foodease/core/widgets/custom_widgets/custom_scaffold.dart';
import 'package:foodease/core/widgets/custom_widgets/text_form_field_custom.dart';
import 'package:foodease/features/onboarding/onboarding.dart';

class SignupProcess extends StatelessWidget {
  const SignupProcess({super.key});

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
                      'Fill in your bio to get started',
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
                TextFormFieldCustom(
                  title: "First Name",
                  fontSize: 14.sp(context),
                ),
                const SizedBox().h(20, context),
                TextFormFieldCustom(
                  title: "Last Name",
                  fontSize: 14.sp(context),
                ),
                const SizedBox().h(20, context),
                TextFormFieldCustom(
                  title: "Mobile Number",
                  fontSize: 14.sp(context),
                ),
                // const SizedBox().h(20, context),
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
