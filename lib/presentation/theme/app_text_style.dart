import 'package:flutter/material.dart';

class AppTextStyle extends ThemeExtension<AppTextStyle> {
  AppTextStyle({
    required this.displayD1,
    required this.displayD2,
    required this.displayD3,
    required this.titleT1,
    required this.titleT2,
  });

  final TextStyle displayD1;

  final TextStyle displayD2;

  final TextStyle displayD3;

  final TextStyle titleT1;

  final TextStyle titleT2;

  TextTheme getTextTheme() {
    return TextTheme(
      displayLarge: displayD1,
      displayMedium: displayD2,
      displaySmall: displayD3,
      headlineLarge: titleT1,
      headlineMedium: titleT2,
    );
  }

  @override
  ThemeExtension<AppTextStyle> copyWith({
    TextStyle? displayD1,
    TextStyle? displayD2,
    TextStyle? displayD3,
    TextStyle? titleT1,
    TextStyle? titleT2,
  }) => AppTextStyle(
    displayD1: displayD1 ?? this.displayD1,
    displayD2: displayD2 ?? this.displayD2,
    displayD3: displayD3 ?? this.displayD3,
    titleT1: titleT1 ?? this.titleT1,
    titleT2: titleT2 ?? this.titleT2,
  );

  @override
  ThemeExtension<AppTextStyle> lerp(
    covariant ThemeExtension<AppTextStyle>? other,
    double t,
  ) {
    if (other is! AppTextStyle) {
      return this;
    }

    return AppTextStyle(
      displayD1: TextStyle.lerp(displayD1, other.displayD1, t)!,
      displayD2: TextStyle.lerp(displayD2, other.displayD2, t)!,
      displayD3: TextStyle.lerp(displayD3, other.displayD3, t)!,
      titleT1: TextStyle.lerp(titleT1, other.titleT1, t)!,
      titleT2: TextStyle.lerp(titleT2, other.titleT2, t)!,
    );
  }
}
