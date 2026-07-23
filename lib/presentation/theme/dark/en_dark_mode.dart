import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template/presentation/theme/base/base_color_theme.dart';
import 'package:flutter_template/presentation/theme/base/base_text_theme.dart';
import 'package:flutter_template/presentation/theme/base/base_theme_info.dart';
import 'package:flutter_template/presentation/theme/dark/dark_color_theme.dart';
import 'package:flutter_template/presentation/theme/text/landscape_text_style.dart';
import 'package:flutter_template/presentation/theme/text/portrait_text_style.dart';

class EnDarkMode extends BaseThemeInfo {
  factory EnDarkMode() => _lightMode;

  EnDarkMode._initial();

  static final EnDarkMode _lightMode = EnDarkMode._initial();

  @override
  ThemeData getAppTheme({required Orientation orientation}) {
    final theme = getBaseColorTheme(orientation: orientation).getTheme();
    final baseTextTheme = getBaseTextTheme(orientation: orientation);

    return theme.copyWith(
      textTheme: GoogleFonts.plusJakartaSansTextTheme(
        baseTextTheme.appTextStyle.getTextTheme(),
      ),
      extensions: [
        ...theme.extensions.values.cast<ThemeExtension>(),
        baseTextTheme.appTextStyle,
      ],
    );
  }

  @override
  BaseColorTheme getBaseColorTheme({required Orientation orientation}) =>
      DarkColorTheme();

  @override
  BaseTextTheme getBaseTextTheme({required Orientation orientation}) {
    final textColor = getBaseColorTheme(
      orientation: orientation,
    ).getAppColors.onSurface;

    return orientation == Orientation.portrait
        ? PortraitTextStyle(textColor: textColor)
        : LandscapeTextStyle(textColor: textColor);
  }
}
