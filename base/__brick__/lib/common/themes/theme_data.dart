import 'package:flutter/material.dart';
import '../constants/app_dimens.dart';
import 'themes.dart';

class AppThemes {
  AppThemes._();

  static final _lightTextTheme = TextTheme(
    headlineLarge: ThemeText.headline1,
    headlineMedium: ThemeText.headline2,
    headlineSmall: ThemeText.headline3,
    bodyMedium: ThemeText.body,
    bodySmall: ThemeText.caption,
    bodyLarge: ThemeText.bodyLarge,
    labelMedium: ThemeText.label,
  );

  static final _darkTextTheme = TextTheme(
    headlineLarge: ThemeText.headline1.copyWith(color: AppColor.white),
    headlineMedium: ThemeText.headline2.copyWith(color: AppColor.white),
    headlineSmall: ThemeText.headline3.copyWith(color: AppColor.grey100),
    bodyLarge: ThemeText.bodyLarge.copyWith(color: AppColor.white),
    bodyMedium: ThemeText.body.copyWith(color: AppColor.white),
    bodySmall: ThemeText.caption.copyWith(color: AppColor.white),
    labelMedium: ThemeText.label.copyWith(color: AppColor.white),
  );

  static ThemeData lightTheme = ThemeData(
    fontFamily: FontFamily.adobeClean,
    primaryColor: AppColor.primaryColor,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.roundedRadius),
      ),
    ),
    appBarTheme: const AppBarTheme(color: AppColor.white, elevation: 0.0),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColor.textColor),
      unselectedIconTheme: IconThemeData(color: AppColor.grey800),
      unselectedLabelStyle: TextStyle(color: AppColor.grey800),
      selectedLabelStyle: TextStyle(color: AppColor.textColor),
      unselectedItemColor: AppColor.white,
      selectedItemColor: AppColor.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.white,
      foregroundColor: Colors.white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColor.primaryColor,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
        }),
    iconTheme: const IconThemeData(color: AppColor.grey800),
    scaffoldBackgroundColor: AppColor.white,
    highlightColor: AppColor.grey900,
    cardColor: AppColor.white,
    textTheme: _lightTextTheme,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColor.white,
      contentTextStyle: ThemeText.caption,
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      elevation: 0,
      backgroundColor: AppColor.white,
      labelTextStyle: MaterialStatePropertyAll<TextStyle>(
        ThemeText.navigatorBar,
      ),
    ),
  );

  static ThemeData darkTheme = lightTheme.copyWith(
    textTheme: _darkTextTheme,
    scaffoldBackgroundColor: AppColor.grey900,
    cardColor: AppColor.grey1000,
    highlightColor: AppColor.white,
    appBarTheme: const AppBarTheme(color: AppColor.grey1000, elevation: 0.0),
    iconTheme: const IconThemeData(color: AppColor.grey100),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColor.grey900,
      contentTextStyle: ThemeText.caption.copyWith(
        color: AppColor.white,
      ),
    ),
  );
}
