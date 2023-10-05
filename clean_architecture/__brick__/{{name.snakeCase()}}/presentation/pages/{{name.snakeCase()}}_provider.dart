import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/di/di.dart';
import '../cubit/{{name.snakeCase()}}_cubit.dart';
part '{{name.snakeCase()}}_screen.dart';

@RoutePage()
class {{name.pascalCase()}}Provider extends StatelessWidget {
  const {{name.pascalCase()}}Provider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<{{name.pascalCase()}}Cubit>(),
        ),
       
      ],
      child: const {{name.pascalCase()}}Screen(),
    );
  }
}
