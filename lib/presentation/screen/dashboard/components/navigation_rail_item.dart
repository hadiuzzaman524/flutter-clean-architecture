import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';

class NavigationRailItem extends StatelessWidget {
  const NavigationRailItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
    required this.group,
    this.image,
    this.icon,
  }) : assert(
         image != null || icon != null,
         'Provide either an SVG [image] or an [icon].',
       );

  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  /// SVG asset path. Mutually exclusive with [icon].
  final String? image;

  /// Material icon. Mutually exclusive with [image].
  final IconData? icon;
  final AutoSizeGroup group;

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    final color = isSelected ? theme.primary : theme.disabled;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstant.borderRadius16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          width: 60,
          padding: EdgeInsets.symmetric(vertical: AppConstant.verticalGap8),
          decoration: BoxDecoration(
            color: isSelected
                ? theme.primary.withAlpha(23)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppConstant.borderRadius16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (image != null)
                SvgPicture.asset(
                  image!,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                )
              else
                Icon(icon, size: 24, color: color),
              Gap(AppConstant.verticalGap4),
              AppText.bodySmall(
                title,
                color: color,
                textAlign: TextAlign.center,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
