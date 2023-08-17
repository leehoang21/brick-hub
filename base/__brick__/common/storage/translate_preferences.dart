import 'dart:ui';

import 'package:flutter_translate/flutter_translate.dart';

import 'local_storage.dart';

class TranslatePreferences extends ITranslatePreferences {
  @override
  Future<Locale?> getPreferredLocale() async {
    final storage = LocalStorage();
    final locale = await storage.locale;

    return Locale(locale);
  }

  @override
  Future savePreferredLocale(Locale locale) {
    final storage = LocalStorage();
    return storage.addLocale(locale.languageCode);
  }
}
