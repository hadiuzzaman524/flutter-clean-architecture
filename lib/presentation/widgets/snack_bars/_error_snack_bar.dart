import 'package:common_sdk/common_sdk.dart';
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';

class ErrorSnackBar extends SnackBar {
  ErrorSnackBar({super.key, required String message, Duration? duration})
    : super(
        backgroundColor: ContextHolder.currentContext.colors.error,
        content: AppText.displayMedium(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        duration: duration ?? const Duration(seconds: 3),
      );
}
