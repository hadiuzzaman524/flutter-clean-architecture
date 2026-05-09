import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tsl_flutter_template/core/constants/app_constant.dart';
import 'package:tsl_flutter_template/core/helper/secure_storage_helper.dart';
import 'package:tsl_flutter_template/l10n/l10n.dart';
import 'package:tsl_flutter_template/presentation/route/app_router.gr.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';
import 'package:tsl_flutter_template/presentation/screen/home/components/theme_drop_down_button.dart';
import 'package:tsl_flutter_template/presentation/screen/home/components/user_list.dart';
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
                await SecureStorageHelper.clearAccessToken();
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
            width: 200,
            color: theme.surface.withAlpha(128),
            child: Column(
              children: [
                Gap(AppConstant.verticalGap20),
                const Icon(Icons.analytics_outlined, size: 48),
                Gap(AppConstant.verticalGap12),
                AppText.titleMedium("Dashboard Overview"),
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
