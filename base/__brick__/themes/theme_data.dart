import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'themes.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'SFD',
    useMaterial3: true,
    primaryColor: AppColor.primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
    scaffoldBackgroundColor: AppColor.backgroundColor,
    iconTheme: ThemeIcon.getDefaultIconTheme(),
    appBarTheme: const AppBarTheme(
      color: AppColor.backgroundColor,
      elevation: 15,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColor.primaryColor,
    ),
  );
}
