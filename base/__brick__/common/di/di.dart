import 'package:dio/dio.dart';
import 'package:flutter_eglife_ecommerce_admin/common/configs/dio_config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../core/presentation/routers/app_router.dart';
import '../api/api_service.dart';
import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // defaul
)
void configureDependencies() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton(() => DioConfig(getIt.get()));
  getIt.registerLazySingleton(() => ApiService(getIt.get()));

  getIt.registerLazySingleton(() => AppRouter());
  getIt.init();
}
