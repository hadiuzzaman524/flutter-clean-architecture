import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
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

    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Architecture"),
      body: ListView(
        padding: EdgeInsets.all(AppConstant.horizontalGap16),
        children: [
          const ArchitectureIntro(),
          Gap(AppConstant.verticalGap16),
          const LayerDiagram(),
          Gap(AppConstant.verticalGap16),
          const CoreStrip(),
          Gap(AppConstant.verticalGap20),
          AppText.titleMedium('Design patterns', fontWeight: FontWeight.w700),
          Gap(AppConstant.verticalGap4),
          AppText.bodySmall(
            'Every GoF pattern this template uses, grouped by kind — each tied '
            'to the real class that implements it.',
            color: theme.onSurface.withAlpha(150),
            maxLines: 2,
          ),
          Gap(AppConstant.verticalGap16),
          for (final category in architectureCategories) ...[
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
        AppText.titleLarge('Clean Architecture', fontWeight: FontWeight.w800),
        Gap(AppConstant.verticalGap4),
        AppText.bodyMedium(
          'Dependencies point inward. Outer layers know inner ones — never the '
          'reverse. This is the rule the whole template is built around.',
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
    return Column(
      children: [
        for (var i = 0; i < architectureLayers.length; i++) ...[
          LayerCard(
            title: architectureLayers[i].title,
            path: architectureLayers[i].path,
            description: architectureLayers[i].description,
            depth: i,
          ),
          if (i < architectureLayers.length - 1)
            LayerConnector(label: architectureLayers[i].connector),
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
        border: Border.all(
          color: theme.border,
          style: BorderStyle.solid,
        ),
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
                    text: 'cross-cutting · injector · env · error · helper',
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
