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
    onPrimaryColor: _onPrimaryColor,
    secondaryColor: _secondaryColor,
    onSecondaryColor: _onSecondaryColor,
    errorColor: _errorColor,
    onErrorColor: _onErrorColor,
    surfaceColor: _surfaceColor,
    onSurfaceColor: _onSurfaceColor,
    warningColor: _warningColor,
    shadowColor: _shadowColor,
  );

  @override
  ThemeData getTheme() {
    final appColors = getAppColors;
    final colorScheme = appColors.getColorScheme(Brightness.light);

    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[appColors],
      scaffoldBackgroundColor: colorScheme.surface,
      colorScheme: colorScheme,
    );
  }

  // 🎨 Primary and text colors
  Color get _boldTextColor => Colors.redAccent;

  Color get _buttonColor => Colors.red;

  Color get _normalTextColor => Colors.black87;

  Color get _primaryColor => Colors.blue;

  // 🎨 On-primary & secondary colors
  Color get _onPrimaryColor => Colors.white;

  Color get _secondaryColor => Colors.teal;

  Color get _onSecondaryColor => Colors.white;

  // 🎨 Error and warning colors
  Color get _errorColor => Colors.red;

  Color get _onErrorColor => Colors.white;

  Color get _warningColor => Colors.orange;

  // 🎨 Surface, on-surface, and shadow colors
  Color get _surfaceColor => Colors.grey.shade50;

  Color get _onSurfaceColor => Colors.black87;

  Color get _shadowColor => Colors.black26;
}
