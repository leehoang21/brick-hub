import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

class BaseResponse {
  int? status;
  String? message;
  dynamic data;
  List<String>? errors;
  Paginate? paginate;

  BaseResponse(
      this.status, this.message, this.data, this.errors, this.paginate);

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      json['status'] as int?,
      json['message'].toString(),
      json['data'],
      json['errors']?.cast<String>(),
      json['paginate'] == null
          ? null
          : Paginate.fromJson(json['paginate'] as Map<String, dynamic>),
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class Paginate {
  final int? total;
  final int? limit;
  final int? currentPage;
  final int? totalPage;

  Paginate({
    this.total,
    this.limit,
    this.currentPage,
    this.totalPage,
  });

  factory Paginate.fromJson(Map<String, dynamic> json) =>
      _$PaginateFromJson(json);
}
