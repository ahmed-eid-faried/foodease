import 'package:flutter/material.dart';
import 'package:foodease/core/extensions/double_arabic_font_extension.dart';
import 'package:foodease/core/localization/language_constrants.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final double? fontSize;

  final double? letterSpacing;
  final bool? softWrap;
  final Color? color;

  final Color? decorationColor;

  final FontWeight? fontWeight;

  final TextDecoration decoration;

  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign textAlign;
  final TextStyle? style;
  final bool? arabic;
  final TextWidthBasis? textWidthBasis;
  final bool remoteState;
  final String? fontFamily;
  const TextCustom(
    this.text, {
    super.key,
    this.fontSize = 12.0,
    this.color,
    this.decorationColor,
    this.fontWeight = FontWeight.w400,
    this.decoration = TextDecoration.none,
    this.overflow,
    this.style,
    this.maxLines,
    this.textWidthBasis = TextWidthBasis.parent,
    this.softWrap = true,
    this.letterSpacing = 0.0,
    this.textAlign = TextAlign.start,
    this.arabic = false,
    this.remoteState = false,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      //  context.locale.languageCode == 'ar'

      // textDirection:
      //     Provider.of<LocalizationController>(context).getCurrentLanguage() ==
      //             'AR'
      //         ? TextDirection.rtl
      //         : TextDirection.ltr,
      remoteState ? text : getTranslated(text, context)!,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softWrap,
      textWidthBasis: textWidthBasis,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: fontSize!.ar(),
            color: color,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            decoration: decoration,
            decorationColor: decorationColor,
            fontFamily: fontFamily ?? "BentonSans",
          ),
    );
  }
}
