

// ignore_for_file: unused_import
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../models/{{name.snakeCase()}}_model.dart';

class {{name.pascalCase()}}Mapper {
  static {{name.pascalCase()}}Entity convert({{name.pascalCase()}}Model model) {
    return {{name.pascalCase()}}Entity(
         );
  }
}
