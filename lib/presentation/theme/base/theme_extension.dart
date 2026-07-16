import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/base/app_colors.dart';
import 'package:flutter_template/presentation/theme/base/app_text_theme.dart';

extension ThemeContext on BuildContext {
  ThemeData get appThemeData => Theme.of(this);

  AppTextTheme get textStyle => appThemeData.extension<AppTextTheme>()!;

  AppColors get colors => appThemeData.extension<AppColors>()!;
}
