part of '{{name.snakeCase()}}_cubit.dart';



enum {{name.pascalCase()}}StateStatus {
  initial,
  loaded,
  loading,
  success,
  error,
}

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  factory {{name.pascalCase()}}State({
    @Default({{name.pascalCase()}}StateStatus.initial)
    {{name.pascalCase()}}StateStatus status,
   
  }) =  _${{name.pascalCase()}}State;

  
}
