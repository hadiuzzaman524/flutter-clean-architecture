import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/screen/architecture/architecture_content.dart';
import 'package:flutter_template/presentation/screen/architecture/components/layer_card.dart';
import 'package:flutter_template/presentation/screen/architecture/components/pattern_card.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';
import 'package:flutter_template/presentation/widgets/app_bar/widgets.dart';

class ArchitecturePortraitView extends StatelessWidget {
  const ArchitecturePortraitView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: CustomAppBar(title: l10n.navArchitecture),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          AppConstant.horizontalGap16,
          AppConstant.horizontalGap16,
          AppConstant.horizontalGap16,
          // Clear the extended-body bottom navigation bar so the last card
          // stays fully visible above it.
          MediaQuery.of(context).padding.bottom + 90,
        ),
        children: [
          const ArchitectureIntro(),
          Gap(AppConstant.verticalGap16),
          const LayerDiagram(),
          Gap(AppConstant.verticalGap16),
          const CoreStrip(),
          Gap(AppConstant.verticalGap20),
          AppText.titleMedium(
            l10n.archPatternsTitle,
            fontWeight: FontWeight.w700,
          ),
          Gap(AppConstant.verticalGap4),
          AppText.bodySmall(
            l10n.archPatternsSubtitle,
            color: theme.onSurface.withAlpha(150),
            maxLines: 2,
          ),
          Gap(AppConstant.verticalGap16),
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
    );
  }
}

/// Intro block: title + the dependency-rule one-liner.
class ArchitectureIntro extends StatelessWidget {
  const ArchitectureIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.titleLarge(
          context.l10n.archCleanTitle,
          fontWeight: FontWeight.w800,
        ),
        Gap(AppConstant.verticalGap4),
        AppText.bodyMedium(
          context.l10n.archIntro,
          color: theme.onSurface.withAlpha(165),
          maxLines: 4,
        ),
      ],
    );
  }
}

/// The three-layer stack with inward-dependency connectors.
class LayerDiagram extends StatelessWidget {
  const LayerDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    final layers = architectureLayers(context.l10n);
    return Column(
      children: [
        for (var i = 0; i < layers.length; i++) ...[
          LayerCard(
            title: layers[i].title,
            path: layers[i].path,
            description: layers[i].description,
            depth: i,
          ),
          if (i < layers.length - 1) LayerConnector(label: layers[i].connector),
        ],
      ],
    );
  }
}

/// The cross-cutting `core/` strip shown beneath the layer stack.
class CoreStrip extends StatelessWidget {
  const CoreStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstant.horizontalGap16,
        vertical: AppConstant.verticalGap12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstant.borderRadius12),
        border: Border.all(color: theme.border),
      ),
      child: Row(
        children: [
          Icon(Icons.hub_outlined, size: 16, color: theme.primary),
          Gap(AppConstant.horizontalGap8),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'core/ ',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: theme.onSurface,
                    ),
                  ),
                  TextSpan(
                    text:
                        '${context.l10n.archCoreCrossCutting} · injector · '
                        'env · error · helper',
                    style: TextStyle(
                      fontSize: 11.5,
                      color: theme.onSurface.withAlpha(150),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
