import 'package:injectable/injectable.dart';

import '../../../../../../common/Mixins/local_data_source.dart';
import '../../../../../../common/api/api_service.dart';
import '../../../../../../common/entity/base_response.dart';
// ignore: unused_import
import '{{name.snakeCase()}}_local_data_source.dart';

@Injectable(as: {{name.pascalCase()}}LocalDataSource)
class {{name.pascalCase()}}LocalDataSourceImpl extends {{name.pascalCase()}}LocalDataSource
    with LocalDataSource {
  final CacheService service;

  {{name.pascalCase()}}LocalDataSourceImpl(this.service);
}
