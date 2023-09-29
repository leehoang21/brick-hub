// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../core/service/api_service/base_response/error_response.dart';

class BaseError implements Exception {
  final String? message;
  final List<ErrorResponse>? errors;

  BaseError({this.message, this.errors});

  factory BaseError.unknowError(Object er) => BaseError(message: er.toString());
}
