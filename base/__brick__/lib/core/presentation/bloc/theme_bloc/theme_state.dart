// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  const ThemeState({
    required this.themeData,
  });

  factory ThemeState.initial() => ThemeState(themeData: AppThemes.lightTheme);

  @override
  List<Object> get props => [themeData];

  ThemeState copyWith({
    ThemeData? themeData,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
    );
  }
}
