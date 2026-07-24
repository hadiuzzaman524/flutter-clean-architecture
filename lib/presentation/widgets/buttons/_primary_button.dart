import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';
import 'package:flutter_template/presentation/widgets/buttons/_time_lapse_button.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    this.title,
    required this.onPressed,
    this.internetRequired = false,
    this.expanded = true,
    this.showRightArrow = false,
    this.showBackGradient = true,
    this.size,
    this.elevation = 0,
    this.loadingColor,
    this.titleStyle,
    this.borderRadius = 12,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.border,
    this.gradient,
    this.padding,
    this.child,
    this.titleColor,
  });

  final String? title;
  final FutureOr<void> Function() onPressed;
  final bool internetRequired;
  final bool expanded;
  final bool showRightArrow;
  final bool showBackGradient;
  final Size? size;
  final double elevation;
  final Color? loadingColor;
  final Color? titleColor;
  final TextStyle? titleStyle;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final BoxBorder? border;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: TimeLapseButton(
        onPressed: () async {
          if (isLoading) {
            return;
          }
          if (mounted) {
            setState(() {
              isLoading = true;
            });
          }
          try {
            await widget.onPressed.call();
          } catch (e) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
            return;
          }
          if (mounted) {
            setState(() {
              isLoading = false;
            });
          }
        },
        internetRequired: widget.internetRequired,
        enabled: !isLoading,
        expanded: widget.expanded,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? AppConstant.borderRadius12,
            ),
            side: widget.borderColor != null
                ? BorderSide(color: widget.borderColor ?? Colors.transparent)
                : widget.border != null && widget.border is Border
                ? (widget.border as Border).top
                : BorderSide.none,
          ),
          fixedSize: widget.size ?? const Size.fromHeight(48),
          backgroundColor: widget.backgroundColor ?? context.colors.primary,
          foregroundColor: widget.foregroundColor ?? context.colors.onPrimary,
          elevation: widget.elevation,
          splashFactory: InkRipple.splashFactory,
        ),

        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: isLoading
              ? SizedBox(
                  height: AppConstant.horizontalGap20,
                  width: AppConstant.horizontalGap20,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor:
                        widget.loadingColor ?? context.colors.onPrimary,
                  ),
                )
              : widget.child ??
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstant.horizontalGap16,
                      ),
                      child: AppText.bodyMedium(
                        widget.title ?? '',
                        style: TextStyle(
                          color: widget.titleColor ?? context.colors.onPrimary,
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
