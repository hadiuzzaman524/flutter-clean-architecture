import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/presentation/theme/base/app_text_theme.dart';
import 'package:flutter_template/presentation/theme/base/base_text_theme.dart';

class LandscapeTextStyle extends BaseTextTheme {
  LandscapeTextStyle({required this.textColor});
  final Color textColor;

  // Display
  TextStyle get displayLarge => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 28, // slightly smaller than portrait
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get displayLargeBold => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 28,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get displayMedium => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: AppConstant.iconSize,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get displayMediumBold => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: AppConstant.iconSize,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get displaySmall => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    letterSpacing: 0.25,
    color: textColor,
  );

  TextStyle get displaySmallBold => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 0.25,
    color: textColor,
  );

  // Headlines / Titles
  TextStyle get headlineLarge => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get headlineLargeBold => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get headlineMedium => TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get headlineMediumBold => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get headlineSmall => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.2,
    color: textColor,
  );

  TextStyle get headlineSmallBold => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    letterSpacing: 0.2,
    color: textColor,
  );

  // Titles / Subtitles
  TextStyle get titleLarge => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get titleLargeBold => TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get titleMedium => TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get titleMediumBold => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get titleSmall => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get titleSmallBold => TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 12,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get labelLarge => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get labelLargeBold => TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 12,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get labelMedium => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get labelMediumBold => TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 11,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get labelSmall => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 10,
    letterSpacing: 0,
    color: textColor,
  );

  TextStyle get labelSmallBold => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 10,
    letterSpacing: 0,
    color: textColor,
  );

  // Body / Paragraph
  TextStyle get bodyLarge => TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.25,
    color: textColor,
  );

  TextStyle get bodyLargeBold => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.25,
    color: textColor,
  );

  TextStyle get bodyMedium => TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    letterSpacing: 0.25,
    color: textColor,
  );

  TextStyle get bodyMediumBold => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 11,
    letterSpacing: 0.25,
    color: textColor,
  );

  TextStyle get bodySmall => TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    letterSpacing: 0.2,
    color: textColor,
  );

  TextStyle get bodySmallBold => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 10,
    letterSpacing: 0.2,
    color: textColor,
  );

  @override
  AppTextTheme get appTextStyle => AppTextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
  );
}
