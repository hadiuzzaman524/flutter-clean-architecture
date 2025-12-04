import 'package:flutter/material.dart';

import 'base_theme_info.dart';

@immutable
class ThemeEntity {
  final BaseThemeInfo theme;
  final String displayName;

  const ThemeEntity(this.theme, this.displayName);
}
