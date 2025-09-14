import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    required this.boldTextColor,
    required this.buttonColor,
    required this.normalTextColor,
    required this.primaryColor,
  });

  final Color? normalTextColor;
  final Color? boldTextColor;
  final Color? primaryColor;
  final Color? buttonColor;

  ColorScheme getColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: primaryColor!,
      onPrimary: primaryColor!,
      secondary: primaryColor!,
      onSecondary: primaryColor!,
      error: primaryColor!,
      onError: primaryColor!,
      surface: Colors.red,
      onSurface: Colors.red,
    );
  }

  @override
  ThemeExtension<AppColors> copyWith({
    Color? normalTextColor,
    Color? boldTextColor,
    Color? primaryColor,
    Color? buttonColor,
  }) => AppColors(
    boldTextColor: boldTextColor ?? this.boldTextColor,
    buttonColor: buttonColor ?? this.buttonColor,
    normalTextColor: normalTextColor ?? this.normalTextColor,
    primaryColor: primaryColor ?? this.primaryColor,
  );

  @override
  ThemeExtension<AppColors> lerp(
    AppColors? other,
    double t,
  ) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      boldTextColor: Color.lerp(boldTextColor, other.boldTextColor, t),
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t),
      normalTextColor: Color.lerp(normalTextColor, other.normalTextColor, t),
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
    );
  }
}
