import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_calling/presentation/cubits/app_theme/app_theme_cubit.dart';

class AppColor {
  AppColor({
    required this.primaryColor,
    required this.buttonColor,
    required this.textColor,
    required this.iconColor,
  });

  final Color primaryColor;
  final Color buttonColor;
  final Color textColor;
  final Color iconColor;
}

extension BuildContextExtension on BuildContext {
  AppColor get colors {
    final lightThemeColor = AppColor(
      primaryColor: Colors.blue,
      buttonColor: const Color(0xff5faeef),
      textColor: Colors.black54,
      iconColor: Colors.white,
    );

    final darkThemeColor = AppColor(
      primaryColor: Colors.blue,
      buttonColor: const Color(0xff3dacf3),
      textColor: Colors.white70,
      iconColor: Colors.white,
    );
    return isDarkMode ? darkThemeColor : lightThemeColor;
  }

  bool get isDarkMode {
    return watch<AppThemeCubit>().state.isDarkMode;
  }
}
