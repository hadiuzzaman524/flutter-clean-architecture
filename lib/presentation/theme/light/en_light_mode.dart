
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/theme/base/base_color_theme.dart';
import 'package:tsl_flutter_template/presentation/theme/base/base_text_theme.dart';
import 'package:tsl_flutter_template/presentation/theme/base/base_theme_info.dart';
import 'package:tsl_flutter_template/presentation/theme/light/light_color_theme.dart';
import 'package:tsl_flutter_template/presentation/theme/text/landscape_text_style.dart';
import 'package:tsl_flutter_template/presentation/theme/text/portrait_text_style.dart';

class EnLightMode extends BaseThemeInfo {

  factory EnLightMode() => _lightMode;
  EnLightMode._initial();

  static final EnLightMode _lightMode = EnLightMode._initial();

  @override
  ThemeData getAppTheme({required Orientation orientation}) {
    final theme = getBaseColorTheme(orientation: orientation).getTheme();
    final appTextStyle =
        getBaseTextTheme(orientation: orientation).appTextStyle;

    return theme.copyWith(
      textTheme: appTextStyle.getTextTheme(),
      extensions: [
        ...theme.extensions.values.cast<ThemeExtension>(),
        appTextStyle,
      ],
    );
  }

  @override
  BaseColorTheme getBaseColorTheme({required Orientation orientation}) =>
      LightColorTheme();

  @override
  BaseTextTheme getBaseTextTheme({required Orientation orientation}) {
    final textColor =
        getBaseColorTheme(orientation: orientation).getAppColors.onSurface;

    return orientation == Orientation.portrait
        ? PortraitTextStyle(textColor: textColor)
        : LandscapeTextStyle(textColor: textColor);
  }
}
