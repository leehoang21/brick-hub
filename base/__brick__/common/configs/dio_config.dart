import 'package:dio/dio.dart';
import 'package:flutter_eglife_ecommerce_admin/common/constants/strings/string_constants.dart';
import 'package:flutter_eglife_ecommerce_admin/common/di/di.dart';
import 'package:flutter_eglife_ecommerce_admin/common/entity/base_response.dart';
import 'package:flutter_eglife_ecommerce_admin/common/service/app_service.dart';

class DioConfig {
  final Dio dio;

  DioConfig(this.dio) {
    dio.options.baseUrl = StringConstants.baseUrl;
  }

  Future<Options> get _dioConfigOption async {
    final token = getIt.get<AppService>().token;

    int timeRequest = 60;
    return Options(
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      receiveTimeout: Duration(seconds: timeRequest),
      sendTimeout: Duration(seconds: timeRequest),
      responseType: ResponseType.json,
    );
  }

  Future<BaseResponse> get(String path, Map<String, dynamic> params) async {
    final option = await _dioConfigOption;
    final result = await dio.get(
      path,
      options: option,
      queryParameters: params,
    );

    return BaseResponse.fromJson(result.data);
  }

  Future<BaseResponse> post(String path, Map<String, dynamic> params) async {
    final option = await _dioConfigOption;
    final result = await dio.post(
      path,
      options: option,
      data: params,
    );

    return BaseResponse.fromJson(result.data);
  }

  Future<BaseResponse> put(String path, Map<String, dynamic> params) async {
    final option = await _dioConfigOption;
    final result = await dio.put(
      path,
      options: option,
      data: params,
    );

    return BaseResponse.fromJson(result.data);
  }

  Future<BaseResponse> delete(String path) async {
    final option = await _dioConfigOption;
    final result = await dio.delete(
      path,
      options: option,
    );

    return BaseResponse.fromJson(result.data);
  }

  Future<BaseResponse> patch(String path, Map<String, dynamic> params) async {
    final option = await _dioConfigOption;
    final result = await dio.patch(
      path,
      options: option,
      data: params,
    );

    return BaseResponse.fromJson(result.data);
  }

  Future<BaseResponse> uploadImage(
      String path, Map<String, dynamic> params) async {
    final option = await _dioConfigOption;
    final body = FormData.fromMap(params);
    final result = await dio.post(
      path,
      options: option,
      data: body,
    );

    return BaseResponse.fromJson(result.data);
  }
}
