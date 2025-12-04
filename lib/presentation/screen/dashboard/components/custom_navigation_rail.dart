import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tsl_flutter_template/gen/assets.gen.dart';
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
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: NavigationRailItem(
              title: "Home",
              group: group,
              onTap: () => widget.onTap(0),
              isSelected: widget.currentIndex == 0,
              image: Assets.images.exploreIcon,
            ),
          ),
          Expanded(
            child: NavigationRailItem(
              title: "Settings",
              group: group,
              onTap: () => widget.onTap(1),
              isSelected: widget.currentIndex == 1,
              image: Assets.images.settingsIcon,
            ),
          ),
          Gap(MediaQuery.paddingOf(context).bottom),
        ],
      ),
    );
  }
}
