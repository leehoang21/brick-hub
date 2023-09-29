import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:idolise/common/extension/show_extension.dart';
import 'package:idolise/core/presentation/bloc/loading_bloc/loading_bloc.dart';
import '../../core/presentation/routers/app_router.dart';
import '../../core/presentation/widgets/dialog_widget/dialogs_wiget.dart';
import '../../core/presentation/widgets/widgets.dart';
import '../di/di.dart';

mixin BlocMixin {
  final _appRouter = getIt.get<AppRouter>();
  final LoadingBloc _loadingBloc = getIt.get<LoadingBloc>();

  AppRouter get appRouter => _appRouter;

  void showLoading() {
    _loadingBloc.startLoading();
  }

  void hideLoading() {
    _loadingBloc.finishLoading();
  }

  Future<T?> navigateTo<T>(PageRouteInfo<dynamic> route) async {
    return _appRouter.push<T>(route);
  }

  Future<T?> navigateToAndRemoveUntil<T>(PageRouteInfo<dynamic> route) {
    return _appRouter.pushAndPopUntil<T>(route, predicate: (_) => false);
  }

  void showDialog(Widget widget) {
    _appRouter.navigatorKey.currentContext!.showDialog(child: widget);
  }

  Future<T?> showAlertDialog<T>({
    DialogType type = DialogType.announce,
    String? title,
    String? message,
    String? buttonTitle,
    VoidCallback? acceptAction,
    VoidCallback? denyAction,
  }) async {
    return DialogWidget(
      context: _appRouter.navigatorKey.currentContext!,
      type: type,
      title: title,
      message: message,
      buttonTitle: buttonTitle,
      acceptAction: acceptAction,
      denyAction: denyAction,
    ).showAlertDialog<T>();
  }

  void showSnackbar({
    SnackBarType type = SnackBarType.error,
    String? translationKey,
  }) {
    _appRouter.navigatorKey.currentContext!.showSnackbar(
      type: type,
      translationKey: translationKey,
    );
  }
}
