import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/theme/base_color_theme.dart';
import 'package:tsl_flutter_template/presentation/theme/base_text_theme.dart';

abstract class BaseThemeInfo {
  BaseTextTheme get baseTextTheme;

  BaseColorTheme get baseColorTheme;

  ThemeData getAppTheme(BuildContext context);
}
