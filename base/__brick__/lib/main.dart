import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get_storage/get_storage.dart';

import 'common/constants/language_constants.dart';
import 'common/initializer/init.dart';
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
  );
  runApp(
    LocalizedApp(
      delegate,
      const App(),
    ),
  );
}
