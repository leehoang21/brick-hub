import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../core/presentation/bloc/bloc_observer.dart';
import '../di/di.dart';
import '../utils/utils_src.dart';

class AppInitializer {
  static Future<void> init() async {
    configureDependencies();
    await GetStorage.init();
    Bloc.observer = MyBlocObserver();
  }
}
