import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../constants/language_constants.dart';

class StorageKey {
  static const String accessToken = 'access_token';
  static const String locale = 'locale';
}

// Pub: https://pub.dev/packages/get_storage

@lazySingleton
class LocalStorage {
  final storage = const FlutterSecureStorage(
    webOptions: WebOptions(
      publicKey: 'EgLifeEcommerceAdmin',
    ),
  );

// to save token in local storage
  Future<void> addToken(value) async =>
      await storage.write(key: StorageKey.accessToken, value: value);

// to get token from local storage
  Future<String> get token async =>
      await storage.read(key: StorageKey.accessToken) ?? '';

  //add locale
  Future<void> addLocale(value) async =>
      await storage.write(key: StorageKey.locale, value: value);

  //get locale
  Future<String> get locale async =>
      await storage.read(key: StorageKey.locale) ?? LanguageConstants.en;
}
