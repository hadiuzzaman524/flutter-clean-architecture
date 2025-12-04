import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tsl_flutter_template/gen/assets.gen.dart';
import 'package:tsl_flutter_template/l10n/l10n.dart';
import 'package:tsl_flutter_template/presentation/screen/dashboard/components/bottom_nav_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final void Function(int index) onTap;
  final int currentIndex;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final AutoSizeGroup group = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: BottomNavItem(
                title: "Home",
                group: group,
                onTap: () => widget.onTap(0),
                isSelected: widget.currentIndex == 0,
                image: Assets.images.exploreIcon,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                title: "Settings",
                group: group,
                onTap: () => widget.onTap(1),
                isSelected: widget.currentIndex == 1,
                image: Assets.images.settingsIcon,
              ),
            ),
          ],
        ),
        Gap(MediaQuery.paddingOf(context).bottom),
      ],
    );
  }
}
