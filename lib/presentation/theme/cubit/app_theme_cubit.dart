import 'package:bloc/bloc.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_entity.dart';
import 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit({required List<ThemeEntity> themeEntities})
    : super(AppThemeState.initial(themeEntities));

  void setTheme(ThemeEntity entity) {
    emit(state.copyWith(currentTheme: entity));
  }

  void setThemeByName(String displayName) {
    final entity = state.themes.firstWhere(
      (t) => t.displayName == displayName,
      orElse: () => state.currentTheme,
    );
    emit(state.copyWith(currentTheme: entity));
  }

  void toggleTheme() {
    final currentIndex = state.themes.indexOf(state.currentTheme);
    final nextIndex = (currentIndex + 1) % state.themes.length;
    emit(state.copyWith(currentTheme: state.themes[nextIndex]));
  }
}
