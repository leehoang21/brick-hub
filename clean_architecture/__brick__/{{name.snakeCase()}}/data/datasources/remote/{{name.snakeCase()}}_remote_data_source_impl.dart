import 'package:injectable/injectable.dart';

import '../../../../../../common/Mixins/remote_data_source.dart';
import '../../../../../../common/api/api_service.dart';
import '../../../../../../common/entity/base_response.dart';
// ignore: unused_import
import '{{name.snakeCase()}}_remote_data_source.dart';

@Injectable(as: {{name.pascalCase()}}RemoteDataSource)
class {{name.pascalCase()}}RemoteDataSourceImpl extends {{name.pascalCase()}}RemoteDataSource
    with RemoteDataSource {
  final ApiService service;

  {{name.pascalCase()}}RemoteDataSourceImpl(this.service);

  @override
  Future<dynamic> getData(Map<String, dynamic> params) {
     return await call(
      () async {
        final token = "Bearer ${AppService().accessToken}";

        final result = await apiService.get{{name.pascalCase()}}(params, token);
        return process(result);
      },
    );
    
  }


}
