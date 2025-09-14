import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/theme/app_colors.dart';
import 'package:tsl_flutter_template/presentation/theme/base_color_theme.dart';

class LightTheme extends BaseColorTheme {
  @override
  AppColors get getAppColors => AppColors(
    boldTextColor: _boldTextColor,
    buttonColor: _buttonColor,
    normalTextColor: _normalTextColor,
    primaryColor: _primaryColor,
  );

  @override
  ThemeData getTheme() {
    final appColors = getAppColors;
    final colorScheme = appColors.getColorScheme(Brightness.dark);

    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[appColors],
      scaffoldBackgroundColor: colorScheme.onSurface,
      colorScheme: colorScheme,
    );
  }

  Color get _boldTextColor => Colors.redAccent;

  Color get _buttonColor => Colors.red;

  Color get _normalTextColor => Colors.black12;

  Color get _primaryColor => Colors.blue;
}
