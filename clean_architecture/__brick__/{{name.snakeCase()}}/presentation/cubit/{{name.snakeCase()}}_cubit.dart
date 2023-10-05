import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/mixins/bloc_mixin.dart';
part '{{name.snakeCase()}}_state.dart';
part '{{name.snakeCase()}}_cubit.freezed.dart';


@injectable
class {{name.pascalCase()}}Cubit extends BaseBloc<{{name.pascalCase()}}State> with BlocMixin {
  {{name.pascalCase()}}Cubit(this._useCase) : super(const {{name.pascalCase()}}State.initial());
  final {{name.pascalCase()}}UseCase _useCase;

  @override
  void onInit() {
    //getVideosTop20(1);
    super.onInit();
  }

  // void getVideosTop20(int page) async {
  //   final result = await _useCase.getVideos(
  //       {{name.pascalCase()}}GetVideosParams(typeVideo: 'top-20-video', page: page));
  //   result.fold((left) {
  //     emit({{name.pascalCase()}}State.error(left.message ?? ''));
  //     showSnackbar(translationKey: left.message ?? '');
  //   }, (right) {
  //     emit(
  //       state.when(
  //         loading: () => {{name.pascalCase()}}State.success(right),
  //         success: (videos) => {{name.pascalCase()}}State.success(videos + right),
  //         error: (message) => {{name.pascalCase()}}State.success(right),
  //       ),
  //     );
  //   });
  // }
}
