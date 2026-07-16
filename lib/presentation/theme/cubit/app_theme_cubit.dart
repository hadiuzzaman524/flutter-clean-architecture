import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_template/presentation/theme/base/theme_entity.dart';
import 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  static const _prefKey = 'selected_theme';

  AppThemeCubit({required List<ThemeEntity> themeEntities})
    : super(AppThemeState.initial(themeEntities)) {
    _loadThemeFromPrefs();
  }

  /// Load saved theme from SharedPreferences
  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString(_prefKey);
    if (savedName != null) {
      final entity = state.themes.firstWhere(
        (t) => t.displayName == savedName,
        orElse: () => state.currentTheme,
      );
      emit(state.copyWith(currentTheme: entity));
    }
  }

  /// Set theme and save to SharedPreferences
  Future<void> setTheme(ThemeEntity entity) async {
    emit(state.copyWith(currentTheme: entity));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, entity.displayName);
  }

  /// Set theme by name and save
  Future<void> setThemeByName(String displayName) async {
    final entity = state.themes.firstWhere(
      (t) => t.displayName == displayName,
      orElse: () => state.currentTheme,
    );
    emit(state.copyWith(currentTheme: entity));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, entity.displayName);
  }

  /// Toggle theme in list and save
  Future<void> toggleTheme() async {
    final currentIndex = state.themes.indexOf(state.currentTheme);
    final nextIndex = (currentIndex + 1) % state.themes.length;
    final nextTheme = state.themes[nextIndex];
    emit(state.copyWith(currentTheme: nextTheme));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, nextTheme.displayName);
  }
}
