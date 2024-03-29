

import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom(
      {super.key, required this.title, this.fontSize, this.height, this.width});
  final String title;
  final double? fontSize;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 325.w(context),
      height: height ?? 57.h(context),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF4F4F4)),
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
          border: InputBorder.none,
          hintText: title,
          contentPadding: const EdgeInsets.all(22),
          hintStyle: TextStyle(
            color: const Color(0xFF3B3B3B).withOpacity(0.30),
            fontSize: fontSize ?? 14.sp(context),
            fontFamily: 'BentonSans Regular',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
