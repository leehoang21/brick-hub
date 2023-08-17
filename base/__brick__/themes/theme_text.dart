import 'package:flutter/material.dart';
import 'themes.dart';

class ThemeText {
  static TextStyle body1 = TextStyle(
    fontSize: 32,
    color: AppColor.textColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body2 = TextStyle(
    fontSize: 24,
    color: AppColor.textColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle button = const TextStyle(
    fontSize: 20,
    color: AppColor.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle caption = TextStyle(
    fontSize: 18,
    color: AppColor.textColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle caption2 = TextStyle(
    fontSize: 16,
    color: AppColor.textColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle caption3 = TextStyle(
    fontSize: 14,
    color: AppColor.textColor,
    fontWeight: FontWeight.w600,
  );
}
