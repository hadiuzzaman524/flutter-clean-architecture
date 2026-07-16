import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';

class AppSnackBarHelper {
  static void show(
    BuildContext context, {
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText.titleSmall(message),
        backgroundColor: error ? context.colors.error : context.colors.success,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalGap8,
          vertical: AppConstant.verticalGap4,
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
