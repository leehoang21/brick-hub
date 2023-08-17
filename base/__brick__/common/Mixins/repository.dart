import 'package:either_dart/either.dart';

import '../exception/api_error.dart';
import '../exception/cache_exception.dart';

mixin Repository {
  Future<Either<T, String>> call<T>({
    required Future<T> Function() call,
  }) async {
    try {
      final response = await call();
      return Right(response);
    } on ServerError catch (e) {
      return Left(e);
    } on ApiError catch (e) {
      return Left(e);
    } on CacheException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
