import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/core/helper/secure_storage_service.dart';
import 'package:flutter_template/core/injector/injector.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/route/app_router.gr.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';
import 'package:flutter_template/presentation/screen/home/components/theme_drop_down_button.dart';
import 'package:flutter_template/presentation/screen/home/components/user_list.dart';
import 'package:auto_route/auto_route.dart';

class HomeLandscapeView extends StatelessWidget {
  const HomeLandscapeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        title: AppText.titleLarge(
          'Flutter Template',
          style: context.textStyle.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.primary,
          ),
        ),
        elevation: 0,
        backgroundColor: theme.surface,
        actions: [
          const ThemeDropDownButton(),
          Padding(
            padding: EdgeInsets.only(right: AppConstant.horizontalGap8),
            child: IconButton(
              onPressed: () async {
                await injector<SecureStorageService>().clearAccessToken();
                if (context.mounted) {
                  context.router.replace(const LogInRoute());
                }
              },
              icon: Icon(Icons.logout_rounded, color: theme.error),
              tooltip: context.l10n.logout,
            ),
          ),
        ],
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
                  'User Directory',
                  fontWeight: FontWeight.w700,
                ),
                Gap(AppConstant.verticalGap4),
                AppText.bodySmall(
                  'Browse the team roster served through the repository layer.',
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
                        'Premium unlocks the full list',
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
