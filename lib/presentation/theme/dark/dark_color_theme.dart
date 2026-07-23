import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template/presentation/theme/base/app_colors.dart';
import 'package:flutter_template/presentation/theme/base/base_color_theme.dart';

class DarkColorTheme extends BaseColorTheme {
  @override
  ThemeData getTheme() {
    final appColors = getAppColors;
    final colorScheme = appColors.getColorScheme(Brightness.dark);

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
        ThemeData(brightness: Brightness.dark).textTheme,
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

  // === Brand Colors ===
  Color get primary => const Color(0xFF5C3AFF);

  Color get onPrimary => Colors.white;

  Color get secondary => const Color(0xFFA89BFF);

  Color get onSecondary => const Color(0xFF1A1A1A);

  // === Background & Surfaces ===
  Color get background => const Color(0xFF0D0D14);

  Color get onBackground => const Color(0xFFEAEAEA);

  Color get surface => const Color(0xFF17171F);

  Color get onSurface => const Color(0xFFE6E6E6);

  // === Status Colors ===
  Color get error => const Color(0xFFFF6B6B);

  Color get onError => const Color(0xFF1A1A1A);

  Color get success => const Color(0xFF00E676);

  Color get warning => const Color(0xFFFFB74D);

  Color get info => const Color(0xFF64B5F6);

  /// Premium / "PRO" accent (replaces hardcoded Colors.amber).
  Color get premium => const Color(0xFFFFCA55);

  // === Neutrals ===
  Color get border => const Color(0xFF2A2A3A);

  Color get shadow => const Color(0x99000000); // 60% opacity
  Color get disabled => const Color(0xFF5A5A5A);

  /// One step above [surface] for layered cards / sheets (surfaces[2]).
  Color get surfaceElevated => surfaces[2]!;

  // === Supporting Colors ===
  Color get scaffoldBackgroundColor => background;

  Color get textPrimary => onSurface;

  // === Surface Variants ===
  final Map<int, Color> surfaces = const {
    1: Color(0xFF17171F), // base surface
    2: Color(0xFF20202C), // elevated
    3: Color(0xFF2A2A38), // higher elevation
    4: Color(0xFF363648), // variant
  };
}
