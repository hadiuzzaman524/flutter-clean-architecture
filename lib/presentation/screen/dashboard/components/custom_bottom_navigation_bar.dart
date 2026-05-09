import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tsl_flutter_template/core/constants/app_constant.dart';
import 'package:tsl_flutter_template/gen/assets.gen.dart';
import 'package:tsl_flutter_template/presentation/screen/dashboard/components/bottom_nav_item.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';

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
    final theme = context.colors;
    
    return Container(
      decoration: BoxDecoration(
        color: theme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.shadow.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConstant.borderRadius20),
          topRight: Radius.circular(AppConstant.borderRadius20),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstant.horizontalGap16,
            vertical: AppConstant.verticalGap8,
          ),
          child: Row(
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
                  title: "Widgets",
                  group: group,
                  onTap: () => widget.onTap(1),
                  isSelected: widget.currentIndex == 1,
                  image: Assets.images.settingsIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
