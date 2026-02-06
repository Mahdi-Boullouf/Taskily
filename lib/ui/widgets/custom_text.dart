import 'package:flutter/material.dart';
import 'package:tasks_app/ui/common/app_colors.dart';
import 'package:tasks_app/ui/common/app_strings.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {super.key,
      this.overflow,
      this.textStyle,
      this.textColor,
      this.maxLines,
      this.fontSize,
      this.fontWeight,
      this.fontFamily,
      this.textDecoration,
      this.textAlign,
      this.height});
  final String text;
  final TextStyle? textStyle;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      // textHeightBehavior: const TextHeightBehavior(
      //     applyHeightToLastDescent: false, applyHeightToFirstAscent: false),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      style: (textStyle ??
              TextStyle(
                  fontSize: 14,
                  color: AppColors.textColor,
                  fontFamily: fontFamily ?? AppStrings.fontName))
          .copyWith(
        color: textColor,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        decoration: textDecoration,
        overflow: overflow,
      ),
    );
  }

  factory CustomText.headlineLarge(
      {required String text,
      Color? textColor,
      TextAlign? textAlign,
      String? fontFamily,
      FontWeight? fontWeight}) {
    return CustomText(
      text,
      fontSize: 24,
      fontWeight: fontWeight ?? FontWeight.bold,
      textColor: textColor,
      fontFamily: fontFamily ?? AppStrings.fontName,
      textAlign: textAlign,
    );
  }

  factory CustomText.titleLarge(
      {required String text,
      Color? textColor,
      TextAlign? textAlign,
      String? fontFamily,
      FontWeight? fontWeight}) {
    return CustomText(
      text,
      fontSize: 22,
      fontWeight: fontWeight ?? FontWeight.bold,
      textColor: textColor,
      fontFamily: fontFamily ?? AppStrings.fontName,
      textAlign: textAlign,
    );
  }
  factory CustomText.titleMedium(
      {required String text,
      Color? textColor,
      TextAlign? textAlign,
      String? fontFamily,
      FontWeight? fontWeight}) {
    return CustomText(
      text,
      fontSize: 20,
      fontWeight: fontWeight ?? FontWeight.bold,
      textColor: textColor,
      fontFamily: fontFamily ?? AppStrings.fontName,
      textAlign: textAlign,
    );
  }

  factory CustomText.titleSmall(
      {required String text,
      Color? textColor,
      TextAlign? textAlign,
      String? fontFamily,
      FontWeight? fontWeight,
      int? maxLines}) {
    return CustomText(
      text,
      fontSize: 18,
      fontWeight: fontWeight ?? FontWeight.bold,
      textColor: textColor,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      fontFamily: fontFamily ?? AppStrings.fontName,
      maxLines: maxLines,
    );
  }

  factory CustomText.bodyLarge(
      {required String text,
      Color? textColor,
      TextAlign? textAlign,
      String? fontFamily,
      FontWeight? fontWeight}) {
    return CustomText(
      text,
      fontSize: 16,
      fontWeight: fontWeight ?? FontWeight.bold,
      textColor: textColor,
      textAlign: textAlign,
      fontFamily: fontFamily ?? AppStrings.fontName,
    );
  }

  factory CustomText.bodyMedium(
      {required String text,
      Color? textColor,
      String? fontFamily,
      TextAlign? textAlign,
      FontWeight? fontWeight}) {
    return CustomText(
      text,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      textColor: textColor,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      fontFamily: fontFamily ?? AppStrings.fontName,
    );
  }
  factory CustomText.bodyMediumBold(
      {required String text,
      Color? textColor,
      String? fontFamily,
      TextAlign? textAlign}) {
    return CustomText(
      text,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      textColor: textColor,
      textAlign: textAlign,
      fontFamily: fontFamily ?? AppStrings.fontName,
    );
  }
  factory CustomText.bodySmall(
      {required String text,
      Color? textColor,
      String? fontFamily,
      TextAlign? textAlign}) {
    return CustomText(
      text,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      textColor: textColor,
      textAlign: textAlign,
      fontFamily: fontFamily ?? AppStrings.fontName,
    );
  }

  factory CustomText.bodySmallBold(
      {required String text,
      Color? textColor,
      String? fontFamily,
      TextAlign? textAlign}) {
    return CustomText(
      text,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      textColor: textColor,
      textAlign: textAlign,
      fontFamily: fontFamily ?? AppStrings.fontName,
    );
  }
}
