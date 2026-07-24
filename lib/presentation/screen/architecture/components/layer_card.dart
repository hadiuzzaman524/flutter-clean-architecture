import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';

/// A single layer in the Clean Architecture diagram.
///
/// [depth] (0 = outermost) controls how strongly the primary tint is applied,
/// visually conveying the inward dependency rule.
class LayerCard extends StatelessWidget {
  const LayerCard({
    super.key,
    required this.title,
    required this.path,
    required this.description,
    required this.depth,
  });

  final String title;
  final String path;
  final String description;
  final int depth;

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    final tint = theme.primary.withAlpha(28 - (depth * 7));

    return Container(
      padding: EdgeInsets.all(AppConstant.horizontalGap16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [tint, theme.surfaceElevated]),
        borderRadius: BorderRadius.circular(AppConstant.borderRadius12),
        border: Border.all(color: theme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: theme.primary,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Gap(AppConstant.horizontalGap8),
              AppText.titleSmall(title, fontWeight: FontWeight.w700),
              const Spacer(),
              Text(
                path,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 10,
                ).copyWith(color: theme.onSurface.withAlpha(140)),
              ),
            ],
          ),
          Gap(AppConstant.verticalGap4),
          AppText.bodySmall(
            description,
            color: theme.onSurface.withAlpha(160),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

/// A small "depends on" connector drawn between two [LayerCard]s.
class LayerConnector extends StatelessWidget {
  const LayerConnector({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConstant.verticalGap4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_downward_rounded, size: 14, color: theme.primary),
          Gap(AppConstant.horizontalGap4),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 10,
            ).copyWith(color: theme.onSurface.withAlpha(140)),
          ),
        ],
      ),
    );
  }
}
