import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/presentation/bloc/base_bloc/base_bloc.dart';
part '{{name.snakeCase()}}_state.dart';
part '{{name.snakeCase()}}.freezed.dart';

class {{name.pascalCase()}}Cubit extends BaseBloc<{{name.snakeCase()}}State> {
  {{name.pascalCase()}}Cubit() : super({{name.pascalCase()}}State());
}
