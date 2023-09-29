import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:idolise/common/di/di.dart';
import 'package:idolise/core/presentation/bloc/loading_bloc/loading_bloc.dart';
import 'package:idolise/core/service/api_service/base_response/base_response.dart';

import '../exception/error.dart';

class RemoteDataContants {
  static const int successStatus = 1;
  static const int errorStatus = 0;
}

mixin RemoteDataSource {
  Future<dynamic> call(
    Future<dynamic> Function() call, {
    bool isShowLoading = false,
  }) async {
    try {
      if (isShowLoading) {
        getIt.get<LoadingBloc>().startLoading();
      }
      final response = await call();
      return response;
      //
    } on ApiError {
      rethrow;
    } on DioException catch (cl) {
      log("server error: $cl");
      throw _handelDioError(cl);
    } catch (er) {
      log("error unknow: $er");
      throw ApiError.apiUnknowError(er);
    } finally {
      //  getIt.get<LoadingBloc>().finishLoading();
    }
  }

  ApiError _handelDioError(DioException cl) {
    switch (cl.type) {
      case DioExceptionType.receiveTimeout:
      default:
        log("Server Error: status - ${cl.message}, response: ${cl.response}");
        return ApiError.serverError();
    }
  }

  T process<T>(BaseResponse result) {
    if (result.status == RemoteDataContants.successStatus) {
      return result.data;
    } else {
      throw ApiError.handleData(result);
    }
  }
}
