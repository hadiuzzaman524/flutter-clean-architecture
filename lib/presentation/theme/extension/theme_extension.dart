import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/theme/app_colors.dart';
import 'package:tsl_flutter_template/presentation/theme/app_text_style.dart';

extension ThemeContext on BuildContext {
  ThemeData get _appThemeData => Theme.of(this);

  AppTextStyle get textStyle => _appThemeData.extension<AppTextStyle>()!;

  AppColors get colors => _appThemeData.extension<AppColors>()!;
}
