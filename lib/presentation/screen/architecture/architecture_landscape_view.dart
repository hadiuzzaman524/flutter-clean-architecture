import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/screen/architecture/architecture_content.dart';
import 'package:flutter_template/presentation/screen/architecture/architecture_portrait_view.dart';
import 'package:flutter_template/presentation/screen/architecture/components/pattern_card.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';
import 'package:flutter_template/presentation/widgets/app_bar/widgets.dart';

class ArchitectureLandscapeView extends StatelessWidget {
  const ArchitectureLandscapeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: CustomAppBar(title: l10n.navArchitecture),
      body: Padding(
        padding: EdgeInsets.all(AppConstant.horizontalGap16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left: the layer diagram.
            Expanded(
              child: ListView(
                children: [
                  const ArchitectureIntro(),
                  Gap(AppConstant.verticalGap16),
                  const LayerDiagram(),
                  Gap(AppConstant.verticalGap16),
                  const CoreStrip(),
                ],
              ),
            ),
            Gap(AppConstant.horizontalGap20),
            // Right: the pattern cards.
            Expanded(
              child: ListView(
                children: [
                  AppText.titleMedium(
                    l10n.archPatternsTitle,
                    fontWeight: FontWeight.w700,
                  ),
                  Gap(AppConstant.verticalGap12),
                  for (final category in architectureCategories(l10n)) ...[
                    PatternCategoryHeader(
                      title: category.title,
                      count: category.patterns.length,
                    ),
                    Gap(AppConstant.verticalGap12),
                    for (final p in category.patterns) ...[
                      PatternCard(
                        icon: p.icon,
                        name: p.name,
                        className: p.className,
                        description: p.description,
                        demonstratedIn: p.demonstratedIn,
                      ),
                      Gap(AppConstant.verticalGap12),
                    ],
                    Gap(AppConstant.verticalGap8),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
