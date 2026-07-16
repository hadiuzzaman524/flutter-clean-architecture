import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';

enum AppTextStyle {
  // Display
  displayLarge,
  displayLargeBold,
  displayMedium,
  displayMediumBold,
  displaySmall,
  displaySmallBold,

  // Headlines / Titles
  headlineLarge,
  headlineLargeBold,
  headlineMedium,
  headlineMediumBold,
  headlineSmall,
  headlineSmallBold,

  // Titles / Labels
  titleLarge,
  titleLargeBold,
  titleMedium,
  titleMediumBold,
  titleSmall,
  titleSmallBold,
  labelLarge,
  labelLargeBold,
  labelMedium,
  labelMediumBold,
  labelSmall,
  labelSmallBold,

  // Body
  bodyLarge,
  bodyLargeBold,
  bodyMedium,
  bodyMediumBold,
  bodySmall,
  bodySmallBold,
}

class AppText extends StatelessWidget {
  // Rich text factory constructor
  factory AppText.rich(
    InlineSpan textSpan, {
    AppTextStyle appTextStyle = AppTextStyle.bodyMedium,
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    StrutStyle? strutStyle,
    Locale? locale,
    bool? softWrap,
  }) => AppText._(
    null,
    textSpan: textSpan,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: appTextStyle,
    style: style,
    fontWeight: fontWeight,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
    strutStyle: strutStyle,
    locale: locale,
    softWrap: softWrap,
  );

  factory AppText.bodyLarge(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.bodyLarge,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.displayLarge(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.displayLarge,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.displayLargeBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.displayLargeBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.displayMedium(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.displayMedium,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.displayMediumBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.displayMediumBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.displaySmall(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.displaySmall,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.displaySmallBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.displaySmallBold,
    style: style,
    fontWeight: fontWeight,
  );

  // Headlines / Titles
  factory AppText.headlineLarge(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.headlineLarge,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.headlineLargeBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.headlineLargeBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.headlineMedium(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.headlineMedium,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.headlineMediumBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.headlineMediumBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.headlineSmall(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.headlineSmall,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.headlineSmallBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.headlineSmallBold,
    style: style,
    fontWeight: fontWeight,
  );

  // Titles / Labels
  factory AppText.titleLarge(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.titleLarge,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.titleLargeBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.titleLargeBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.titleMedium(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.titleMedium,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.titleMediumBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.titleMediumBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.titleSmall(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.titleSmall,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.titleSmallBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.titleSmallBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.labelLarge(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.labelLarge,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.labelLargeBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.labelLargeBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.labelMedium(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.labelMedium,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.labelMediumBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.labelMediumBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.labelSmall(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.labelSmall,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.labelSmallBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.labelSmallBold,
    style: style,
    fontWeight: fontWeight,
  );

  // Body
  factory AppText.bodyLargeBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.bodyLargeBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.bodyMedium(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.bodyMedium,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.bodyMediumBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.bodyMediumBold,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.bodySmall(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.bodySmall,
    style: style,
    fontWeight: fontWeight,
  );

  factory AppText.bodySmallBold(
    String text, {
    TextOverflow? overflow,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextStyle? style,
    FontWeight? fontWeight,
  }) => AppText._(
    text,
    textAlign: textAlign,
    color: color,
    maxLines: maxLines,
    overflow: overflow,
    appTextStyle: AppTextStyle.bodySmallBold,
    style: style,
    fontWeight: fontWeight,
  );

  const AppText._(
    this.text, {
    required this.appTextStyle,
    this.textAlign,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.style,
    this.fontWeight,
    this.textSpan,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.strutStyle,
    this.locale,
    this.softWrap,
  });

  final String? text;
  final InlineSpan? textSpan;
  final AppTextStyle appTextStyle;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  final TextStyle? style;
  final FontWeight? fontWeight;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final StrutStyle? strutStyle;
  final Locale? locale;
  final bool? softWrap;

  TextStyle? getTextStyle(BuildContext context) {
    final textTheme = context.appThemeData.textTheme;

    TextStyle? defaultStyle;
    switch (appTextStyle) {
      // Display
      case AppTextStyle.displayLarge:
        defaultStyle = textTheme.displayLarge;
      case AppTextStyle.displayLargeBold:
        defaultStyle = textTheme.displayLarge?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.displayMedium:
        defaultStyle = textTheme.displayMedium;
      case AppTextStyle.displayMediumBold:
        defaultStyle = textTheme.displayMedium?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.displaySmall:
        defaultStyle = textTheme.displaySmall;
      case AppTextStyle.displaySmallBold:
        defaultStyle = textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w700,
        );

      // Headlines
      case AppTextStyle.headlineLarge:
        defaultStyle = textTheme.headlineLarge;
      case AppTextStyle.headlineLargeBold:
        defaultStyle = textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.headlineMedium:
        defaultStyle = textTheme.headlineMedium;
      case AppTextStyle.headlineMediumBold:
        defaultStyle = textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.headlineSmall:
        defaultStyle = textTheme.headlineSmall;
      case AppTextStyle.headlineSmallBold:
        defaultStyle = textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w700,
        );

      // Titles / Labels
      case AppTextStyle.titleLarge:
        defaultStyle = textTheme.titleLarge;
      case AppTextStyle.titleLargeBold:
        defaultStyle = textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.titleMedium:
        defaultStyle = textTheme.titleMedium;
      case AppTextStyle.titleMediumBold:
        defaultStyle = textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.titleSmall:
        defaultStyle = textTheme.titleSmall;
      case AppTextStyle.titleSmallBold:
        defaultStyle = textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w700,
        );

      case AppTextStyle.labelLarge:
        defaultStyle = textTheme.labelLarge;
      case AppTextStyle.labelLargeBold:
        defaultStyle = textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.labelMedium:
        defaultStyle = textTheme.labelMedium;
      case AppTextStyle.labelMediumBold:
        defaultStyle = textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.labelSmall:
        defaultStyle = textTheme.labelSmall;
      case AppTextStyle.labelSmallBold:
        defaultStyle = textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w700,
        );

      // Body
      case AppTextStyle.bodyLarge:
        defaultStyle = textTheme.bodyLarge;
      case AppTextStyle.bodyLargeBold:
        defaultStyle = textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.bodyMedium:
        defaultStyle = textTheme.bodyMedium;
      case AppTextStyle.bodyMediumBold:
        defaultStyle = textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w700,
        );
      case AppTextStyle.bodySmall:
        defaultStyle = textTheme.bodySmall;
      case AppTextStyle.bodySmallBold:
        defaultStyle = textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w700,
        );
    }

    // Merge custom style if provided
    if (style != null) {
      return defaultStyle?.merge(style) ?? style;
    }

    return defaultStyle;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = getTextStyle(context);
    var finalStyle = textStyle;

    if (color != null || fontWeight != null) {
      finalStyle =
          finalStyle?.copyWith(color: color, fontWeight: fontWeight) ??
          textStyle;
    }

    // If textSpan is provided, use Text.rich
    if (textSpan != null) {
      return Text.rich(
        textSpan!,
        style: finalStyle,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        strutStyle: strutStyle,
        locale: locale,
        softWrap: softWrap,
      );
    }

    // Otherwise use regular Text
    return Text(
      text ?? '',
      style: finalStyle,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      strutStyle: strutStyle,
      locale: locale,
      softWrap: softWrap,
    );
  }
}

// Helper extension to create styled TextSpans with AppTextStyle
extension AppTextSpanExtension on BuildContext {
  TextStyle? getAppTextStyle(AppTextStyle appTextStyle) {
    final textTheme = appThemeData.textTheme;

    switch (appTextStyle) {
      case AppTextStyle.displayLarge:
        return textTheme.displayLarge;
      case AppTextStyle.displayLargeBold:
        return textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.displayMedium:
        return textTheme.displayMedium;
      case AppTextStyle.displayMediumBold:
        return textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.displaySmall:
        return textTheme.displaySmall;
      case AppTextStyle.displaySmallBold:
        return textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.headlineLarge:
        return textTheme.headlineLarge;
      case AppTextStyle.headlineLargeBold:
        return textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.headlineMedium:
        return textTheme.headlineMedium;
      case AppTextStyle.headlineMediumBold:
        return textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.headlineSmall:
        return textTheme.headlineSmall;
      case AppTextStyle.headlineSmallBold:
        return textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.titleLarge:
        return textTheme.titleLarge;
      case AppTextStyle.titleLargeBold:
        return textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.titleMedium:
        return textTheme.titleMedium;
      case AppTextStyle.titleMediumBold:
        return textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.titleSmall:
        return textTheme.titleSmall;
      case AppTextStyle.titleSmallBold:
        return textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.labelLarge:
        return textTheme.labelLarge;
      case AppTextStyle.labelLargeBold:
        return textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.labelMedium:
        return textTheme.labelMedium;
      case AppTextStyle.labelMediumBold:
        return textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.labelSmall:
        return textTheme.labelSmall;
      case AppTextStyle.labelSmallBold:
        return textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.bodyLarge:
        return textTheme.bodyLarge;
      case AppTextStyle.bodyLargeBold:
        return textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.bodyMedium:
        return textTheme.bodyMedium;
      case AppTextStyle.bodyMediumBold:
        return textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700);
      case AppTextStyle.bodySmall:
        return textTheme.bodySmall;
      case AppTextStyle.bodySmallBold:
        return textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700);
    }
  }
}
