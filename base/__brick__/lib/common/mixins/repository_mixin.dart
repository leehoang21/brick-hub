// ignore_for_file: avoid_print

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import '../exception/error.dart';

mixin Repository {
  Future<Either<BaseError, T>> call<T>(
    Future<T> Function() call, {
    bool isShowLoading = false,
  }) async {
    try {
      final response = await call();
      return Right(response);
    } on ApiError catch (er) {
      print("ApiError$er");
      return Left(er);
    } catch (er) {
      print("er$er");
      if (kDebugMode) rethrow;
      return Left(BaseError.unknowError(er));
    }
  }
}
