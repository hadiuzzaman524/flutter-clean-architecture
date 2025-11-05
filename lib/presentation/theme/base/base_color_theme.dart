import 'package:flutter/material.dart';

import 'package:tsl_flutter_template/presentation/theme/base/app_colors.dart';

abstract class BaseColorTheme {
  AppColors get getAppColors;

  ThemeData getTheme();
}
