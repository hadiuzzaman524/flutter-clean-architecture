import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/theme/base_color_theme.dart';
import 'package:tsl_flutter_template/presentation/theme/base_text_theme.dart';
import 'package:tsl_flutter_template/presentation/theme/base_theme_info.dart';
import 'package:tsl_flutter_template/presentation/theme/light/light_theme.dart';
import 'package:tsl_flutter_template/presentation/theme/text/portrait_text_style.dart';

class EnLightTheme extends BaseThemeInfo {
  @override
  ThemeData getAppTheme(BuildContext context) {
    final theme = baseColorTheme.getTheme();
    final appTextStyle = baseTextTheme.appTextStyle;

    return theme.copyWith(
      textTheme: appTextStyle.getTextTheme(),
      extensions: [
        ...theme.extensions.values.cast<ThemeExtension>(),
        appTextStyle,
      ],
    );
  }

  @override
  BaseTextTheme get baseTextTheme => PortraitTextStyle();

  @override
  BaseColorTheme get baseColorTheme => LightTheme();
}
