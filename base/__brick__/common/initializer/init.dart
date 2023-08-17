//fvm flutter packages pub run build_runner build --delete-conflicting-outputs
//fvm flutter packages pub run build_runner watch --delete-conflicting-outputs
import 'package:get_storage/get_storage.dart';

import '../di/di.dart';
import '../service/app_service.dart';

class AppInitializer {
  static Future<void> init() async {
    configureDependencies();
    await GetStorage.init();
    getIt.get<AppService>().onInit();
  }
}
