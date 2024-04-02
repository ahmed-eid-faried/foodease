import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/localization/locale_keys.g.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/values_manager.dart';
import 'package:foodease/core/widgets/custom_widgets/text_custom.dart';
import 'package:foodease/features/onboarding/onboarding.dart';
import 'package:pinput/pinput.dart';

class OTPWidget extends StatefulWidget {
  const OTPWidget({super.key});

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color focusedBorderColor = ColorResources.getIconBg(context);
    Color fillColor = ColorResources.getIconBg(context);
    Color borderColor = ColorResources.getHomeBg(context);

    final defaultPinTheme = PinTheme(
      width: AppSize.s100.r(context),
      height: AppSize.s100.r(context),
      // textStyle: AppFontStyle.black14w400(),
      decoration: BoxDecoration(
        color: fillColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(AppSize.s22),
        border: Border.all(width: 1, color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Pinput(
            controller: pinController,
            focusNode: focusNode,
            androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
            listenForMultipleSmsOnAndroid: true,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: AppSize.s8),
            validator: (value) {
              return value == '2222' ? null : 'Pin is incorrect';
            },
            // onClipboardFound: (value) {
            //   printf('onClipboardFound: $value');
            //   pinController.setTextCustom(text:value);
            // },
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              print('onCompleted: $pin');
            },
            onChanged: (value) {
              print('onChanged: $value');
            },
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: AppMargin.m8),
                  width: AppSize.s22,
                  height: AppSize.s1,
                  color: focusedBorderColor,
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(AppSize.s8),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: fillColor,
                borderRadius: BorderRadius.circular(AppSize.s20),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
          SizedBox(height: AppSize.s16.h(context)),
          TextButton(
              onPressed: () {},
              child: TextCustom(
                LocaleKeys.resendCode,
                style: TextStyle(
                  color: ColorResources.getTextTitle(context),
                  fontSize: 25.sp(context),
                  fontWeight: FontWeight.w400,
                ),
              )),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonGreen(
                  title: 'Next',
                  onTap: () {
                    focusNode.unfocus();
                    // formKey.currentState!.validate();
                    if (formKey.currentState!.validate()) {
                      // Navigator.pop(context);
                      // if (Navigator.canPop(context)) {
                      //   Navigator.pop(context);
                      // }
                      // showDialog(
                      //     context: context,
                      //     builder: (context) => const RateDialogWidget());
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
