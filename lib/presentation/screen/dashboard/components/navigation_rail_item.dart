import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:tsl_flutter_template/core/constants/app_constant.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';

class NavigationRailItem extends StatelessWidget {
  const NavigationRailItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
    required this.image,
    required this.group,
  });

  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  final String image;
  final AutoSizeGroup group;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 68,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      image,
                      colorFilter: ColorFilter.mode(
                        isSelected
                            ? context.colors.onSurface
                            : context.colors.disabled,
                        BlendMode.srcIn,
                      ),
                    ),
                    Gap(AppConstant.verticalGap4),
                    AppText.bodySmall(
                      title,
                      color: isSelected
                          ? context.colors.onSurface
                          : context.colors.disabled,
                    ),
                    Gap(AppConstant.verticalGap4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
