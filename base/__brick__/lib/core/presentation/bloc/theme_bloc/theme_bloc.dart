import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:idolise/common/themes/themes.dart';
import 'package:injectable/injectable.dart';

import '../base_bloc/base_bloc.dart';

part 'theme_state.dart';

@lazySingleton
class ThemeCubit extends BaseBloc<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  @override
  void onInit() {
    checkModeSystem();
  }

  void checkModeSystem() {
    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      emit(state.copyWith(themeData: AppThemes.darkTheme));
    } else {
      emit(state.copyWith(themeData: AppThemes.lightTheme));
    }
  }

  bool isDark() {
    return state.themeData == AppThemes.darkTheme;
  }
}
