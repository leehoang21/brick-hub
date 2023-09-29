import 'dart:async';

import 'package:dio/dio.dart';

// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

import '../../../common/constants/app_constant.dart';
import 'base_response/base_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppConstant.BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // @POST('/api/v1/sign-up')
  // Future<BaseResponse> register(@Body() Map<String, dynamic> body);
}
