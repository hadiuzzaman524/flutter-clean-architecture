import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    required this.normalTextColor,
    required this.boldTextColor,
    required this.primaryColor,
    required this.buttonColor,
    required this.onPrimaryColor,
    required this.secondaryColor,
    required this.onSecondaryColor,
    required this.errorColor,
    required this.onErrorColor,
    required this.surfaceColor,
    required this.onSurfaceColor,
    required this.warningColor,
    required this.shadowColor,
  });

  final Color? normalTextColor;
  final Color? boldTextColor;
  final Color? primaryColor;
  final Color? buttonColor;
  final Color? onPrimaryColor;
  final Color? secondaryColor;
  final Color? onSecondaryColor;
  final Color? errorColor;
  final Color? onErrorColor;
  final Color? surfaceColor;
  final Color? onSurfaceColor;
  final Color? warningColor;
  final Color? shadowColor;

  /// Converts to a [ColorScheme] for Material theming.
  ColorScheme getColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: primaryColor ?? Colors.blue,
      onPrimary: onPrimaryColor ?? Colors.white,
      secondary: secondaryColor ?? Colors.teal,
      onSecondary: onSecondaryColor ?? Colors.white,
      error: errorColor ?? Colors.red,
      onError: onErrorColor ?? Colors.white,
      surface: surfaceColor ?? Colors.grey.shade200,
      onSurface: onSurfaceColor ?? Colors.black87,
    );
  }

  @override
  AppColors copyWith({
    Color? normalTextColor,
    Color? boldTextColor,
    Color? primaryColor,
    Color? buttonColor,
    Color? onPrimaryColor,
    Color? secondaryColor,
    Color? onSecondaryColor,
    Color? errorColor,
    Color? onErrorColor,
    Color? surfaceColor,
    Color? onSurfaceColor,
    Color? warningColor,
    Color? shadowColor,
  }) {
    return AppColors(
      normalTextColor: normalTextColor ?? this.normalTextColor,
      boldTextColor: boldTextColor ?? this.boldTextColor,
      primaryColor: primaryColor ?? this.primaryColor,
      buttonColor: buttonColor ?? this.buttonColor,
      onPrimaryColor: onPrimaryColor ?? this.onPrimaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      onSecondaryColor: onSecondaryColor ?? this.onSecondaryColor,
      errorColor: errorColor ?? this.errorColor,
      onErrorColor: onErrorColor ?? this.onErrorColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      onSurfaceColor: onSurfaceColor ?? this.onSurfaceColor,
      warningColor: warningColor ?? this.warningColor,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      normalTextColor: Color.lerp(normalTextColor, other.normalTextColor, t),
      boldTextColor: Color.lerp(boldTextColor, other.boldTextColor, t),
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t),
      onPrimaryColor: Color.lerp(onPrimaryColor, other.onPrimaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      onSecondaryColor: Color.lerp(onSecondaryColor, other.onSecondaryColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      onErrorColor: Color.lerp(onErrorColor, other.onErrorColor, t),
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t),
      onSurfaceColor: Color.lerp(onSurfaceColor, other.onSurfaceColor, t),
      warningColor: Color.lerp(warningColor, other.warningColor, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
    );
  }
}
