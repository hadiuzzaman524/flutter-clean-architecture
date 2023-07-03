import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'app_theme_state.dart';

@injectable
class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeState(isDarkMode: false));

  void changeThemeMode(bool isDarkMode) {
    debugPrint("Theme Mode: $isDarkMode");
    final box = Hive.box("myAppData");
    box.put("isDarkMode", isDarkMode);
    emit(AppThemeState(isDarkMode: isDarkMode));
  }

  void getThemeMode() {
    try {
      final box = Hive.box("myAppData");
      final isDarkMode = box.get("isDarkMode") as bool;
      debugPrint("Theme Mode: $isDarkMode");
      emit(AppThemeState(isDarkMode: isDarkMode));
    } catch (e) {
      // initially,  when app open handle by this one
      emit(AppThemeState(isDarkMode: false));
    }
  }
}
