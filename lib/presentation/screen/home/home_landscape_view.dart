import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';
import 'package:flutter_template/presentation/screen/home/components/user_list.dart';

class HomeLandscapeView extends StatelessWidget {
  const HomeLandscapeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        title: AppText.titleLarge(
          context.l10n.appName,
          style: context.textStyle.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primary,
          ),
        ),
        elevation: 0,
        backgroundColor: theme.surface,
      ),
      body: Row(
        children: [
          Container(
            width: 220,
            color: theme.surface,
            padding: EdgeInsets.all(AppConstant.horizontalGap20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(AppConstant.verticalGap12),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.primary, theme.secondary],
                    ),
                    borderRadius: BorderRadius.circular(
                      AppConstant.borderRadius12,
                    ),
                  ),
                  child: const Icon(
                    Icons.rocket_launch_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Gap(AppConstant.verticalGap16),
                AppText.titleMedium(
                  context.l10n.userDirectoryTitle,
                  fontWeight: FontWeight.w700,
                ),
                Gap(AppConstant.verticalGap4),
                AppText.bodySmall(
                  context.l10n.userDirectorySubtitle,
                  color: theme.onSurface.withAlpha(150),
                  maxLines: 3,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.workspace_premium_rounded,
                      size: 16,
                      color: theme.premium,
                    ),
                    Gap(AppConstant.horizontalGap8),
                    Expanded(
                      child: AppText.bodySmall(
                        context.l10n.premiumUnlockHint,
                        color: theme.onSurface.withAlpha(150),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          VerticalDivider(width: 1, color: theme.border.withAlpha(128)),
          const Expanded(child: UserList()),
        ],
      ),
    );
  }
}
