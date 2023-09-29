import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:idolise/core/presentation/bloc/auth_bloc/auth_cubit.dart';

import 'package:idolise/core/presentation/bloc/theme_bloc/theme_bloc.dart';
import '../../../common/constants/app_dimens.dart';
import '../../../common/constants/string_constants.dart';
import '../../../common/di/di.dart';
import '../bloc/loading_bloc/loading_bloc.dart';

import '../routers/app_router.dart';
import '../widgets/loading_widget/loading_container_widget.dart';
import 'dart:developer' as developer;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  late final AppRouter _appRouter;
  @override
  void initState() {
    super.initState();
    _appRouter = getIt.get<AppRouter>();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        developer.log("app in resume");
        getIt.get<ThemeCubit>().checkModeSystem();
        break;
      case AppLifecycleState.inactive:
        developer.log("app in inactive");
        break;
      case AppLifecycleState.hidden:
        developer.log("app in hidden");
        break;
      case AppLifecycleState.paused:
        developer.log("app in paused");
        break;
      case AppLifecycleState.detached:
        developer.log("app in detached");
        break;
      default:
        developer.log("app in hidden");
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    return ScreenUtilInit(
        designSize: const Size(
          AppDimens.widthDefault,
          AppDimens.heightDefault,
        ),
        builder: (context, child) => GestureDetector(
              onTap: () {
                final currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus!.unfocus();
                }
              },
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (_) => getIt.get<ThemeCubit>(),
                  ),
                  BlocProvider(
                    create: (_) => getIt.get<LoadingBloc>(),
                  ),
                  BlocProvider(
                    create: (_) => getIt.get<AuthenticationCubit>(),
                  ),
                ],
                child: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return MaterialApp.router(
                      title: StringConstants.appTitle,
                      locale: localizationDelegate.currentLocale,
                      routerConfig: _appRouter.config(),
                      theme: state.themeData,
                      builder: (context, widget) {
                        return LoadingContainerWidget(
                          child: _buildBlocListener(widget ?? const SizedBox(), context),
                        );
                      },
                    );
                  },
                ),
              ),
            ));
  }

  MultiBlocListener _buildBlocListener(Widget widget, BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if (state.status == AuthenticationStatus.unAuthenticated) {
              // (_appRouter.navigatorKey.currentState?.context ?? NavigatorState().context)
              //     .router
              //     .replaceAll([const BoardingPageRoute()]);
            } else if (state.status == AuthenticationStatus.authenticated) {
              // (_appRouter.navigatorKey.currentState?.context ?? NavigatorState().context)
              //     .router
              //     .replaceAll([const HomePageRoute()]);
            }
          },
        ),
      ],
      child: widget,
    );
  }
}
