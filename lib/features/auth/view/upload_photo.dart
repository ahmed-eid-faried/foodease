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

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({super.key});

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
                      'Upload Your Photo Profile',
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
                if (true) ...[
                  const SizedBox().h(20, context),
                  const ImageButton(
                    title: 'From Gallery',
                    svg: AppSvg.gallery,
                  ),
                  const SizedBox().h(20, context),
                  const ImageButton(
                    title: 'Take Photo',
                    svg: AppSvg.camera,
                  ),
                ],
                Visibility(
                    visible: false, child: const SizedBox().h(60, context)),
                Visibility(
                  visible: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 245.w(context),
                        height: 238.h(context),
                        decoration: ShapeDecoration(
                          // color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://as1.ftcdn.net/v2/jpg/02/23/61/36/1000_F_223613686_2LXNahDJdD6i7TBGi8qKWxNhbaJKD116.jpg"),
                            fit: BoxFit.fill,
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x115A6CEA),
                              blurRadius: 50,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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

class ImageButton extends StatelessWidget {
  const ImageButton({
    super.key,
    required this.title,
    this.onPressed,
    required this.svg,
  });
  final String title;
  final void Function()? onPressed;
  final String svg;
  @override
  Widget build(BuildContext context) {
    return ButtonCustom(
      onPressed: onPressed,
      minWidth: 325.h(context),
      height: 129.h(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPictureCustom(
            svg,
            height: 50.r(context),
            width: 50.r(context),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'BentonSans Bold',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
