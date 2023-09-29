import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'themes.dart';

class FontFamily {
  static const String adobeClean = 'AdobeClean';
  static const String nordiquePro = 'NordiquePro';
}

class FontType {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight black = FontWeight.w900;
}

class ThemeText {
  ///theme - headlineLarge,32
  static TextStyle headline1 = TextStyle(
    fontSize: 32.sp,
    color: AppColor.textColor,
    fontWeight: FontType.bold,
    fontFamily: FontFamily.adobeClean,
  );

  ///theme - headlineMedium,25
  static TextStyle headline2 = TextStyle(
    fontSize: 25.sp,
    color: AppColor.textColor,
    fontWeight: FontType.regular,
    fontFamily: FontFamily.adobeClean,
    height: 1.12,
  );

  ///theme - headlineSmall,20

  static TextStyle headline3 = TextStyle(
    fontSize: 20.sp,
    color: AppColor.textColor,
    fontWeight: FontType.bold,
    fontFamily: FontFamily.adobeClean,
    letterSpacing: 0.15.sp,
    height: 1.2,
  );

  ///theme - body large, 16

  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    color: AppColor.textColor,
    fontWeight: FontType.bold,
    fontFamily: FontFamily.adobeClean,
    height: 1.25,
  );

  ///theme - bodyMedium, 16

  static TextStyle body = TextStyle(
    fontSize: 16.sp,
    color: AppColor.textColor,
    fontWeight: FontType.regular,
    fontFamily: FontFamily.adobeClean,
    height: 1.5,
  );

  static TextStyle button = TextStyle(
    fontSize: 15.sp,
    color: AppColor.white,
    fontWeight: FontType.bold,
    fontFamily: FontFamily.nordiquePro,
    letterSpacing: 1.25,
    // fontFamily: FontFamily.adobeClean,
  );

  ///theme - bodySmall, 14
  static TextStyle caption = TextStyle(
    fontSize: 14.sp,
    color: AppColor.textColor,
    fontWeight: FontType.regular,
    fontFamily: FontFamily.adobeClean,
  );

  ///theme - labelMedium, 12

  static TextStyle label = TextStyle(
    fontSize: 12.sp,
    color: AppColor.textColor,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.adobeClean,
  );

  ///theme - labelMedium, 12

  static TextStyle navigatorBar = TextStyle(
    fontSize: 9.sp,
    color: AppColor.textColor,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamily.adobeClean,
    height: 1.5,
  );
}
