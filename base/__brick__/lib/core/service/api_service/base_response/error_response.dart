import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ErrorResponse {
  @JsonKey(name: 'status_code')
  String? statusCode;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'type_error')
  String? typeError;

  ErrorResponse({this.statusCode, this.message, this.typeError});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  @override
  String toString() {
    return 'status_code: $statusCode,  message: $message, type_error: $typeError';
  }
}
