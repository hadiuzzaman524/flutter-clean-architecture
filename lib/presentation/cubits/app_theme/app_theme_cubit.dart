import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:network_calling/presentation/cubits/app_theme/app_theme_state.dart';

@injectable
class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeState(isDarkMode: false));

  // ignore: avoid_positional_boolean_parameters
  void changeThemeMode(bool isDarkMode) {
    debugPrint('Theme Mode: $isDarkMode');
    // ignore: inference_failure_on_function_invocation
    final box = Hive.box('myAppData');
    // ignore: cascade_invocations
    box.put('isDarkMode', isDarkMode);
    emit(AppThemeState(isDarkMode: isDarkMode));
  }

  void getThemeMode() {
    try {
      // ignore: inference_failure_on_function_invocation
      final box = Hive.box('myAppData');
      final isDarkMode = box.get('isDarkMode') as bool;
      debugPrint('Theme Mode: $isDarkMode');
      emit(AppThemeState(isDarkMode: isDarkMode));
    } catch (e) {
      // initially,  when app open handle by this one
      emit(AppThemeState(isDarkMode: false));
    }
  }
}
