import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/theme/app_colors.dart';

abstract class BaseColorTheme {
  AppColors get getAppColors;

  ThemeData getTheme();
}
