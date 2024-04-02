import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/localization/locale_keys.g.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/values_manager.dart';
import 'package:foodease/core/widgets/custom_widgets/text_custom.dart';
import 'package:foodease/features/auth/view/otp.dart';

class OTPAlertDialog extends StatelessWidget {
  const OTPAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p32.w(context),
            vertical: AppPadding.p24.h(context)),
        decoration: ShapeDecoration(
          color: ColorResources.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s4)),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FittedBox(
                child: TextCustom(
                  LocaleKeys.pleaseTypeTheOtpSentTo,
                  maxLines: 1,
                  // style: AppFontStyle.black14w400()
                ),
              ),
              const TextCustom(
                '+2 1094814160',
                // style: AppFontStyle.black14w500()
              ),
              SizedBox(height: AppSize.s16.h(context)),
              const OTPWidget(),
            ]),
      ),
    );
  }
}
