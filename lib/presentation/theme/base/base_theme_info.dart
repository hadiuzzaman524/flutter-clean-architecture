import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/base/base_color_theme.dart';
import 'package:flutter_template/presentation/theme/base/base_text_theme.dart';

abstract class BaseThemeInfo {
  BaseTextTheme getBaseTextTheme({required Orientation orientation});

  BaseColorTheme getBaseColorTheme({required Orientation orientation});

  ThemeData getAppTheme({required Orientation orientation});
}
