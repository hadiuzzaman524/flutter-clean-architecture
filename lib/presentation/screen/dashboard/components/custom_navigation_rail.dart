import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'navigation_rail_item.dart';

class CustomNavigationRail extends StatefulWidget {
  const CustomNavigationRail({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final void Function(int index) onTap;
  final int currentIndex;

  @override
  State<CustomNavigationRail> createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  final AutoSizeGroup group = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: theme.surface,
        border: Border(
          right: BorderSide(color: theme.border.withAlpha(128)),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadow.withAlpha(13),
            blurRadius: 10,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Gap(AppConstant.verticalGap20),
            // Logo or Brand Icon
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: theme.primary,
                borderRadius: BorderRadius.circular(AppConstant.borderRadius12),
              ),
              child: const Icon(Icons.bolt_rounded, color: Colors.white),
            ),
            Gap(AppConstant.verticalGap20 * 2),
            Expanded(
              child: Column(
                children: [
                  NavigationRailItem(
                    title: context.l10n.navHome,
                    group: group,
                    onTap: () => widget.onTap(0),
                    isSelected: widget.currentIndex == 0,
                    icon: Icons.home_rounded,
                  ),
                  Gap(AppConstant.verticalGap12),
                  NavigationRailItem(
                    title: context.l10n.navWidgets,
                    group: group,
                    onTap: () => widget.onTap(1),
                    isSelected: widget.currentIndex == 1,
                    icon: Icons.widgets_rounded,
                  ),
                  Gap(AppConstant.verticalGap12),
                  NavigationRailItem(
                    title: context.l10n.navArchitecture,
                    group: group,
                    onTap: () => widget.onTap(2),
                    isSelected: widget.currentIndex == 2,
                    icon: Icons.account_tree_rounded,
                  ),
                  Gap(AppConstant.verticalGap12),
                  NavigationRailItem(
                    title: context.l10n.navSettings,
                    group: group,
                    onTap: () => widget.onTap(3),
                    isSelected: widget.currentIndex == 3,
                    icon: Icons.settings_rounded,
                  ),
                ],
              ),
            ),
            Gap(AppConstant.verticalGap20),
          ],
        ),
      ),
    );
  }
}
