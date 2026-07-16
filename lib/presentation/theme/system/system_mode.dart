import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/base/base_color_theme.dart';
import 'package:flutter_template/presentation/theme/base/base_text_theme.dart';
import 'package:flutter_template/presentation/theme/dark/en_dark_mode.dart';
import 'package:flutter_template/presentation/theme/light/en_light_mode.dart';

import '../base/base_theme_info.dart';

class SystemMode extends BaseThemeInfo {
  factory SystemMode() => _instance;

  SystemMode._internal();

  static final SystemMode _instance = SystemMode._internal();

  @override
  ThemeData getAppTheme({required Orientation orientation}) {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    if (brightness == Brightness.dark) {
      return EnDarkMode().getAppTheme(orientation: orientation);
    } else {
      return EnLightMode().getAppTheme(orientation: orientation);
    }
  }

  @override
  BaseColorTheme getBaseColorTheme({required Orientation orientation}) {
    throw UnimplementedError('SystemMode does not use getBaseColorTheme');
  }

  @override
  BaseTextTheme getBaseTextTheme({required Orientation orientation}) {
    throw UnimplementedError('SystemMode does not use getBaseTextTheme');
  }
}
