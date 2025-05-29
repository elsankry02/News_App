part of 'change_theme_cubit.dart';

abstract class ChangeThemeState {}

final class ChangeThemeInitial extends ChangeThemeState {}

final class ChangeThemeSuccess extends ChangeThemeState {
  final bool isDark;

  ChangeThemeSuccess(this.isDark);
}
