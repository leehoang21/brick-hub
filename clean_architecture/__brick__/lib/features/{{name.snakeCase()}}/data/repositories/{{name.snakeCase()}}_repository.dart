

// ignore_for_file: unused_import

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/Mixins/repository.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../datasources/remote/{{name.snakeCase()}}_remote_data_source.dart';
import '../datasources/local/{{name.snakeCase()}}_local_data_source.dart';
import '../mapper/{{name.snakeCase()}}_mapper.dart';

@Injectable(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl extends {{name.pascalCase()}}Repository with Repository {
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
 // final {{name.pascalCase()}}LocalDataSource localDataSource;

  {{name.pascalCase()}}RepositoryImpl(this.remoteDataSource
  //, this.localDataSource
  );

  @override
  Future<Either<dynamic, String>> getData()async {
     return call(() async {
      final result = await _loginRemoteDataSource.getData();
      return {{name.pascalCase()}}Mapper.convert({{name.pascalCase()}}Model.fromJson(result));
    });

  }

}
