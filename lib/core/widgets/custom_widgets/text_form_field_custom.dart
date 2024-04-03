import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/utill/color_resources.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom(
      {super.key,
      required this.title,
      this.fontSize,
      this.height,
      this.width,
      this.suffixIcon,
      this.prefixIcon});
  final String title;
  final double? fontSize;
  final double? height;
  final double? width;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 325.w(context),
      // height: height ?? 57.h(context),
      decoration: ShapeDecoration(
        color: ColorResources.getIconBg(context),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: ColorResources.getIconBg(context)),
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
      child: TextFormField(
        decoration: InputDecoration(
          // suffixIcon: Padding(
          //   padding: prefixIcon == null
          //       ? EdgeInsets.zero
          //       : const EdgeInsets.all(16.0),
          //   child: suffixIcon,
          // ),
          prefixIcon: prefixIcon == null
              ? null
              : Padding(
                  padding: prefixIcon == null
                      ? EdgeInsets.zero
                      : const EdgeInsets.all(16.0),
                  child: prefixIcon,
                ),
          suffixIcon: suffixIcon == null
              ? null
              : Padding(
                  padding: suffixIcon == null
                      ? EdgeInsets.zero
                      : const EdgeInsets.all(16.0),
                  child: suffixIcon,
                ),
          border: InputBorder.none,
          hintText: title,
          contentPadding: EdgeInsets.symmetric(
              vertical: 16.h(context), horizontal: 16.w(context)),
          hintStyle: TextStyle(
            color: ColorResources.getTextTitle(context).withOpacity(0.4),
            fontSize: fontSize ?? 14.sp(context),
            fontFamily: 'BentonSans',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
