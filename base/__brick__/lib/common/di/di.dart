import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:idolise/core/presentation/routers/app_router.dart';
import 'package:injectable/injectable.dart';
import '../../core/service/api_service/api_service.dart';
import '../../core/service/app_service/app_service.dart';
import '../configs/dio_config.dart';
import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.registerLazySingleton<Options>(() => DioConfig.dioConfigOption());
  getIt.registerSingleton(() => AppService());
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => ApiService(getIt.get()));
  getIt.registerLazySingleton(() => AppRouter());
  getIt.init();
}
