import 'package:idolise/common/constants/string_constants.dart';
import 'package:idolise/common/extension/translate_extension.dart';
import 'package:idolise/common/utils/utils_src.dart';
import 'package:idolise/core/service/api_service/base_response/base_response.dart';
import 'package:idolise/core/service/api_service/base_response/error_response.dart';

import 'base_error.dart';

class ApiError extends BaseError {
  ApiError({message, errors}) : super(message: message, errors: errors);

  factory ApiError.handleData(BaseResponse baseResponse) {
    if (baseResponse.code == 'VAL_VALIDATE') {
      final errors = baseResponse.data?.map((e) => ErrorResponse.fromJson(e)).toList();
      return isNullEmptyList(errors)
          ? ApiError.serverError()
          : ApiError(
              message: errors!.length == 1 ? errors.first.message : errors.map((e) => "⚠ ${e.message}\n").join());
    } else {
      return ApiError(message: ErrorMapper.converErrorFromCode(baseResponse.code));
    }
  }

  factory ApiError.apiUnknowError(Object er) => ApiError(message: er.toString());

  factory ApiError.serverError() => ApiError(message: "Server Error");

  @override
  String toString() {
    return message ?? StringConstants.msgErrorUnknown;
  }
}

class ErrorMapper {
  static String converErrorFromCode(String? errorCode) {
    switch (errorCode) {
      case "SIN_02":
        return "Login failed".tr;
      default:
        return StringConstants.msgErrorUnknown;
    }
  }
}
