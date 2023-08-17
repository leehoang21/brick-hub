import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_eglife_ecommerce_admin/common/utils/app_utils.dart';
import 'package:flutter_eglife_ecommerce_admin/core/presentation/bloc/dialog_bloc/dialog_bloc.dart';
import 'package:flutter_eglife_ecommerce_admin/core/presentation/widgets/not_auth_widget/not_auth_widget.dart';

import 'package:flutter_translate/flutter_translate.dart';

import '../di/di.dart';
import '../entity/base_response.dart';
import '../exception/api_error.dart';
import '../storage/local_storage.dart';

class RemoteDataContants {
  static final String unableConnectToServer =
      translate('Unable to connect to server');
  static final String identityVerificationFailed =
      translate('Identity verification failed');
  static final String requestCanceled = translate('Request canceled');
  static final String serverError =
      translate('Your request could not be completed. Please try again.');
  static final String unknownError = translate('Unknown error');
  static const String success = 'Success';
  static const String noData = 'No data';
  static const String message = 'message';
}

// mixin RemoteDataSource {
//   Future<BaseResponse> call(
//     Future<BaseResponse> Function() call,
//   ) async {
//     try {
//       final response = await call();
//       return _processResponse(response);
//     } catch (er) {
//       log("error unknow: $er");
//       throw ApiError(RemoteDataContants.serverError);
//     }
//   }

//   BaseResponse _processResponse(BaseResponse response) {
//     if (response.status == 0) {
//       if (response.errors != null && response.errors!.isNotEmpty) {
//         final error = response.errors!.join('\n');
//         throw ApiError(error);
//       }
//       throw ApiError(response.message ?? RemoteDataContants.serverError);
//     } else {
//       return response;
//     }
//   }
// }

mixin RemoteDataSource {
  Future<BaseResponse> call(
    Future<BaseResponse> Function() call,
  ) async {
    try {
      final response = await call();
      log("response: $response");
      return _processResponse(response);
    } on ApiError {
      rethrow;
    } on SocketException catch (se) {
      log("socket error: $se");
      throw ApiError(se.message);
    } on DioException catch (cl) {
      log("dio error: $cl");
      throw _handelDioError(cl);
    } on ServerError {
      rethrow;
    } catch (er) {
      log("error unknow: $er");
      throw ApiError(RemoteDataContants.serverError);
    }
  }

  Exception _handelDioError(DioException cl) {
    switch (cl.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiError(RemoteDataContants.unableConnectToServer);
      case DioExceptionType.badCertificate:
        return ApiError(RemoteDataContants.identityVerificationFailed);
      case DioExceptionType.cancel:
        return ApiError(RemoteDataContants.requestCanceled);
      default:
        final response = cl.response;

        if (!isNullEmpty(response) && !isNullEmpty(response!.data)) {
          if (response.data is Map<String, dynamic>) {
            final res = BaseResponse.fromJson(response.data);
            //Not authenticated
            if (res.status == 0 &&
                (res.message ?? '').contains('Not authenticated')) {
              final storage = getIt.get<LocalStorage>();
              storage.addToken('');

              getIt.get<DialogBloc>().showDialog(child: const NotAuthWidget());
              _processResponse(BaseResponse(
                0,
                response.statusMessage,
                '',
                [],
                null,
              ));
            }
            _processResponse(res);
          }
          final res = BaseResponse(
            0,
            response.statusMessage,
            '',
            [],
            null,
          );

          _processResponse(res);
        } else {
          return ApiError(cl.message ?? RemoteDataContants.serverError);
        }
        return ServerError(
            ((cl.response?.data['message'] ?? cl.response?.statusMessage) ??
                    RemoteDataContants.serverError)
                .toString());
    }
  }

  BaseResponse _processResponse(BaseResponse response) {
    if (response.status == 1) {
      return response;
    } else {
      String message = '';
      if (!isNullEmptyList(response.errors)) {
        message = response.errors!.join('\n');
      } else {
        message = response.message ?? RemoteDataContants.unknownError;
      }
      throw ApiError(message);
    }
  }
}
