import 'package:flutter/cupertino.dart';
import 'package:tsl_flutter_template/presentation/theme/app_text_style.dart';
import 'package:tsl_flutter_template/presentation/theme/base_text_theme.dart';

class PortraitTextStyle extends BaseTextTheme {
  @override
  AppTextStyle get appTextStyle => AppTextStyle(
    displayD1: _displayD1,
    displayD2: _displayD2,
    displayD3: _displayD3,
    titleT1: _titleT1,
    titleT2: _titleT2,
  );

  TextStyle get _displayD1 => const TextStyle(fontSize: 12);

  TextStyle get _displayD2 => const TextStyle(fontSize: 13);

  TextStyle get _displayD3 => const TextStyle(fontSize: 14);

  TextStyle get _titleT1 => const TextStyle(fontSize: 15);

  TextStyle get _titleT2 => const TextStyle(fontSize: 16);
}
