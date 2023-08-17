// ignore_for_file: unused_import

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../entities/{{name.snakeCase()}}_entity.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';

@injectable
class {{name.pascalCase()}}UseCase {
  final {{name.pascalCase()}}Repository repository;

  {{name.pascalCase()}}UseCase(this._repository);

  // Future<Either<dynamic, String>> save({{name.pascalCase()}}Entity data, int? id) {
  //   return repository.save(data, id);
  // }
}
