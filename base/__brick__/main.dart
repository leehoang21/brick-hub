import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import 'common/initializer/init.dart';
import 'common/storage/translate_preferences.dart';
import 'core/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  final delegate = await LocalizationDelegate.create(
    fallbackLocale: LanguageConstants.en,
    supportedLocales: [
      LanguageConstants.vi,
      LanguageConstants.en,
    ],
    preferences: TranslatePreferences(),
  );
  runApp(
    LocalizedApp(
      delegate,
      App(),
    ),
  );
}
