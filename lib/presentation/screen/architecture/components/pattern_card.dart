import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';

/// Header separating a GoF category (e.g. "Structural") with a pattern count.
class PatternCategoryHeader extends StatelessWidget {
  const PatternCategoryHeader({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    return Row(
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: theme.primary,
          ),
        ),
        Gap(AppConstant.horizontalGap8),
        Expanded(child: Divider(color: theme.border, height: 1)),
        Gap(AppConstant.horizontalGap8),
        Text(
          '$count',
          style: TextStyle(
            fontFamily: 'monospace',
            fontSize: 11,
            color: theme.onSurface.withAlpha(130),
          ),
        ),
      ],
    );
  }
}

/// A card describing one design pattern used in this template, tied to the
/// concrete class in the repo that implements it.
class PatternCard extends StatelessWidget {
  const PatternCard({
    super.key,
    required this.icon,
    required this.name,
    required this.className,
    required this.description,
    required this.demonstratedIn,
  });

  final IconData icon;
  final String name;

  /// The concrete class in the repo (shown as a monospace chip).
  final String className;
  final String description;

  /// Where in the running app this pattern is visible.
  final String demonstratedIn;

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;

    return Container(
      padding: EdgeInsets.all(AppConstant.horizontalGap16),
      decoration: BoxDecoration(
        color: theme.surfaceElevated,
        borderRadius: BorderRadius.circular(AppConstant.borderRadius16),
        border: Border.all(color: theme.border),
        boxShadow: [
          BoxShadow(
            color: theme.shadow.withAlpha(20),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: theme.primary.withAlpha(28),
                  borderRadius: BorderRadius.circular(AppConstant.borderRadius8),
                ),
                child: Icon(icon, size: 19, color: theme.primary),
              ),
              Gap(AppConstant.horizontalGap12),
              Expanded(
                child: AppText.titleSmall(name, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Gap(AppConstant.verticalGap12),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstant.horizontalGap8,
              vertical: AppConstant.verticalGap4,
            ),
            decoration: BoxDecoration(
              color: theme.primary.withAlpha(20),
              borderRadius: BorderRadius.circular(AppConstant.borderRadius8),
            ),
            child: Text(
              className,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ).copyWith(color: theme.primary),
            ),
          ),
          Gap(AppConstant.verticalGap8),
          AppText.bodySmall(
            description,
            color: theme.onSurface.withAlpha(170),
            maxLines: 4,
          ),
          Gap(AppConstant.verticalGap8),
          Row(
            children: [
              Icon(
                Icons.visibility_outlined,
                size: 13,
                color: theme.onSurface.withAlpha(120),
              ),
              Gap(AppConstant.horizontalGap4),
              Expanded(
                child: AppText.bodySmall(
                  '${context.l10n.archSeenInLabel} $demonstratedIn',
                  color: theme.onSurface.withAlpha(120),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
