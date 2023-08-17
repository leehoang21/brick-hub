import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../../common/constants/layout_constants.dart';
import '../../../common/constants/strings/string_constants.dart';
import '../../../common/di/di.dart';
import '../../../common/extension/translate_extension.dart';
import '../../../themes/theme_data.dart';
import '../bloc/dialog_bloc/dialog_bloc.dart';
import '../bloc/loading_bloc/loading_bloc.dart';
import '../bloc/snackbar_bloc/snackbar_bloc.dart';
import '../routers/app_router.dart';
import '../widgets/dialog/show_dialog.dart';
import '../widgets/dialog/snackbar_widget.dart';
import '../widgets/loading_widget/loading_container_widget.dart';
import '../widgets/snackbar_widget/snackbar_widget.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = getIt.get<AppRouter>();
  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: ScreenUtilInit(
        rebuildFactor: (old, data) {
          if (data.size.height < 400 && data.size.width < 1000) {
            return false;
          }

          return old != data;
        },
        useInheritedMediaQuery: true,
        designSize: const Size(
          LayoutConstants.widthDefault,
          LayoutConstants.heightDefault,
        ),
        builder: (context, child) => GestureDetector(
          onTap: () {
            final currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt.get<LoadingBloc>(),
              ),
              BlocProvider(
                create: (_) => getIt.get<DialogBloc>(),
              )
            ],
            child: GestureDetector(
              onTap: () {
                final currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus!.unfocus();
                }
              },
              child: MaterialApp.router(
                title: StringConstants.appTitle,
                supportedLocales: localizationDelegate.supportedLocales,
                localizationsDelegates: [
                  localizationDelegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: localizationDelegate.currentLocale,
                routerConfig: _appRouter.config(
                //   deepLinkBuilder: (link) async {
                //     logger(link.path);

                //     if (link.path == '\\' || link.path == '/') {
                //       final initialRoute = await AppRouter.initialRoute;

                //       return DeepLink.path(initialRoute);
                //     }
                //     if (getIt.get<AppService>().token.isEmpty) {
                //       return const DeepLink.path(Routes.login);
                //     }

                //     return DeepLink.path(link.path);
                //   },
                //   rebuildStackOnDeepLink: true,
                //   //includePrefixMatches: true,
                // ),
                theme: appTheme(),
                builder: (context, widget) {
                  return LoadingContainerWidget(
                    child:
                        _buildBlocListener(widget ?? const SizedBox(), context),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  BlocListener<SnackbarBloc, SnackbarState> _buildBlocListener(
      Widget widget, BuildContext context) {
    return BlocListener<DialogBloc, DialogState>(
      listener: (context, state) {
        if (state is ShowSnackBarState) {
          TopSnackBar(
            title: (state.translationKey ?? '').tr,
            type: state.type ?? SnackBarType.success,
            key: state.key,
          ).show(
            _appRouter.navigatorKey.currentContext ?? context,
          );
        }
        if (state is ShowDialogState) {
          showDialogFuntion(_appRouter.navigatorKey.currentContext ?? context,
              builder: (_, c) {
            return state.child;
          });
        }
      },
      child: widget,
    );
  }
}
