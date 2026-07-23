import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template/presentation/theme/base/app_colors.dart';
import 'package:flutter_template/presentation/theme/base/base_color_theme.dart';

class LightColorTheme extends BaseColorTheme {
  @override
  ThemeData getTheme() {
    final appColors = getAppColors;
    final colorScheme = appColors.getColorScheme(Brightness.light);

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: appColors.background,
      colorScheme: colorScheme,
      extensions: [appColors],
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: appColors.primary,
        unselectedItemColor: appColors.onSurface.withValues(alpha: 0.6),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        type: BottomNavigationBarType.fixed,
      ),
      textTheme: GoogleFonts.robotoTextTheme(
        ThemeData(brightness: Brightness.light).textTheme,
      ),
    );
  }

  @override
  AppColors get getAppColors => AppColors(
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    background: background,
    onBackground: onBackground,
    surface: surface,
    onSurface: onSurface,
    error: error,
    onError: onError,
    success: success,
    warning: warning,
    info: info,
    premium: premium,
    border: border,
    shadow: shadow,
    disabled: disabled,
    surfaceElevated: surfaceElevated,
  );

  // Brand Colors
  Color get primary => const Color(0xFF3A19D8);

  Color get onPrimary => Colors.white;

  Color get secondary => const Color(0xFF5E4CF5);

  Color get onSecondary => Colors.white;

  // Backgrounds & Surfaces
  Color get background => const Color(0xFFF9F9FB);

  Color get onBackground => const Color(0xFF1A1A1A);

  Color get surface => const Color(0xFFFFFFFF);

  Color get onSurface => const Color(0xFF1E1E1E);

  // Status Colors
  Color get error => const Color(0xFFD32F2F);

  Color get onError => Colors.white;

  Color get success => const Color(0xFF12B76A);

  Color get warning => const Color(0xFFFDB022);

  Color get info => const Color(0xFF007AFF);

  /// Premium / "PRO" accent (replaces hardcoded Colors.amber).
  Color get premium => const Color(0xFFE0A800);

  // Neutrals
  Color get border => const Color(0xFFE9E9F1);

  Color get shadow => const Color(0x10000000); // 6% opacity
  Color get disabled => const Color(0xFFBDBDBD);

  /// One step above [surface] for layered cards / sheets.
  Color get surfaceElevated => const Color(0xFFFFFFFF);
}
