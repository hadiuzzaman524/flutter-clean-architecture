import 'package:flutter/material.dart';
import 'package:network_calling/resources/app_colors.dart';

enum AppTextStyle {
  bodySmall,
  bodyLarge,
  bodyNormal,
  bodyBold,
  bodyLargeBold,
  headLine1,
  headLine2,
}

class AppText extends StatelessWidget {
  const AppText._(
    this.text, {
    required this.appTextStyle,
    this.textAlign,
    this.textOverflow,
    this.maxLine,
    this.color,
  });

  factory AppText.normal(
    String text, {
    TextOverflow? textOverflow,
    int? maxLine,
    TextAlign? textAlign,
    Color? color,
  }) {
    return AppText._(
      text,
      appTextStyle: AppTextStyle.bodyNormal,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
    );
  }

  factory AppText.normalBold(
    String text, {
    TextOverflow? textOverflow,
    int? maxLine,
    TextAlign? textAlign,
    Color? color,
  }) {
    return AppText._(
      text,
      appTextStyle: AppTextStyle.bodyBold,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
    );
  }

  factory AppText.largeBold(
    String text, {
    TextOverflow? textOverflow,
    int? maxLine,
    TextAlign? textAlign,
    Color? color,
  }) {
    return AppText._(
      text,
      appTextStyle: AppTextStyle.bodyLargeBold,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
    );
  }

  factory AppText.small(
    String text, {
    TextOverflow? textOverflow,
    int? maxLine,
    TextAlign? textAlign,
    Color? color,
  }) {
    return AppText._(
      appTextStyle: AppTextStyle.bodySmall,
      text,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
    );
  }

  factory AppText.large(
    String text, {
    TextOverflow? textOverflow,
    int? maxLine,
    TextAlign? textAlign,
    Color? color,
  }) {
    return AppText._(
      appTextStyle: AppTextStyle.bodyLarge,
      text,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
    );
  }

  factory AppText.headLine1(
    String text, {
    TextOverflow? textOverflow,
    int? maxLine,
    TextAlign? textAlign,
    Color? color,
  }) {
    return AppText._(
      appTextStyle: AppTextStyle.headLine1,
      text,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
    );
  }

  factory AppText.headLine2(
    String text, {
    TextOverflow? textOverflow,
    int? maxLine,
    TextAlign? textAlign,
    Color? color,
  }) {
    return AppText._(
      appTextStyle: AppTextStyle.headLine2,
      text,
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLine: maxLine,
      color: color,
    );
  }

  final String text;
  final AppTextStyle appTextStyle;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final TextAlign? textAlign;
  final Color? color;

  TextStyle? getTextStyle(BuildContext context) {
    TextStyle? textStyle;
    switch (appTextStyle) {
      case AppTextStyle.bodySmall:
        textStyle = TextStyle(
          color: context.colors.textColor,
          fontSize: 13,
        );
        break;

      case AppTextStyle.bodyNormal:
        textStyle = TextStyle(
          color: context.colors.textColor,
          fontWeight: FontWeight.normal,
        );
        break;
      case AppTextStyle.bodyBold:
        textStyle = TextStyle(
          color: context.colors.textColor,
          fontWeight: FontWeight.bold,
        );
        break;
      case AppTextStyle.bodyLargeBold:
        textStyle = TextStyle(
          color: context.colors.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        );
        break;
      case AppTextStyle.bodyLarge:
        textStyle = TextStyle(
          color: context.colors.textColor,
          fontSize: 20,
        );
        break;

      case AppTextStyle.headLine1:
        textStyle = TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: context.colors.textColor,
        );
        break;

      case AppTextStyle.headLine2:
        textStyle = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: context.colors.textColor,
        );
        break;
    }

    return textStyle;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = getTextStyle(context);
    return Text(
      text,
      style: color != null ? textStyle!.copyWith(color: color) : textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
    );
  }
}
