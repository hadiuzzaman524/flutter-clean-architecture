import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_locale_state.dart';

class AppLocaleCubit extends Cubit<AppLocaleState> {
  static const _prefKey = 'selected_locale';

  AppLocaleCubit({required List<Locale> supportedLocales})
    : super(AppLocaleState.initial(supportedLocales)) {
    _loadLocaleFromPrefs();
  }

  /// Load saved locale from SharedPreferences
  Future<void> _loadLocaleFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString(_prefKey);
    if (savedCode == null) return;

    for (final locale in state.supportedLocales) {
      if (locale.languageCode == savedCode) {
        emit(state.copyWith(currentLocale: locale));
        break;
      }
    }
  }

  /// Set locale and save to SharedPreferences. Pass `null` to follow the
  /// system locale.
  Future<void> setLocale(Locale? locale) async {
    emit(state.copyWith(currentLocale: locale));

    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_prefKey);
    } else {
      await prefs.setString(_prefKey, locale.languageCode);
    }
  }
}
