import 'package:flutter/material.dart';
import 'package:foodease/core/localization/language_constrants.dart';
import 'package:foodease/core/utill/custom_themes.dart';
import 'package:foodease/core/utill/dimensions.dart';
import 'package:foodease/core//widgets/common/custom_button_widget.dart';
import 'package:foodease/core/utill/images.dart';
import 'package:foodease/features/screens/screens.dart';

class NotLoggedInWidget extends StatelessWidget {
  const NotLoggedInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeDefault),
          child: SizedBox(width: 60, child: Image.asset(AppImage.loginIcon)),
        ),
        Text(
          getTranslated('please_login', context)!,
          style: textBold.copyWith(fontSize: Dimensions.fontSizeLarge),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.paddingSizeSmall,
              bottom: Dimensions.paddingSizeLarge),
          child: Text('${getTranslated('need_to_login', context)}'),
        ),
        Center(
            child: SizedBox(
                width: 120,
                child: CustomButton(
                    buttonText: '${getTranslated('login', context)}',
                    backgroundColor: Theme.of(context).primaryColor,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Screens()
                            // const AuthScreen()
                            ))))),
        InkWell(
          onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const Screens()
                  //  const DashBoardScreen()
                  ),
              (route) => false),
          child: Padding(
              padding: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
              child: Text(
                getTranslated('back_to_home', context)!,
                style: textRegular.copyWith(
                    fontSize: Dimensions.fontSizeLarge,
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline),
              )),
        ),
      ],
    );
  }
}
