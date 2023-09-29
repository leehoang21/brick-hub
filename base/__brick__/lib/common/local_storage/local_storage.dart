import 'package:get_storage/get_storage.dart';

class StorageKey {
  static const String accessToken = 'access_token';
  static const String user = 'user';
}

// Pub: https://pub.dev/packages/get_storage

class LocalStorage {
  // Explain: Khi khai bao nhu phia duoi thi no se tu sinh ra : GetStorage de luu tru du lieu
  // mockup
  static final LocalStorage _localStorage = LocalStorage._internal();

  factory LocalStorage() {
    return _localStorage;
  }

  LocalStorage._internal();

  static final accessToken = ''.val(StorageKey.accessToken);
  static final user = "".val(StorageKey.user);
}
