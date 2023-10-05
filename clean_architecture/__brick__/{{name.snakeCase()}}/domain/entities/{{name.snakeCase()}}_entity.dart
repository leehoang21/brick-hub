import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}_entity.freezed.dart';

@freezed
class {{name.pascalCase()}}Entity with _${{name.pascalCase()}}Entity {
  const factory {{name.pascalCase()}}Entity = _{{name.pascalCase()}}Entity;
 
}