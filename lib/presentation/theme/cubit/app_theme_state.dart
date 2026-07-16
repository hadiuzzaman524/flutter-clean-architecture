import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_template/presentation/theme/base/theme_entity.dart';
part 'app_theme_state.freezed.dart';

@freezed
sealed class AppThemeState with _$AppThemeState {
  const factory AppThemeState({
    required List<ThemeEntity> themes,
    required ThemeEntity currentTheme,
  }) = _AppThemeState;

  factory AppThemeState.initial(List<ThemeEntity> themes) =>
      AppThemeState(themes: themes, currentTheme: themes.first);
}
