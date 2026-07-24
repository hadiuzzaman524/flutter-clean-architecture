import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/core/helper/secure_storage_service.dart';
import 'package:flutter_template/core/injector/injector.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/route/app_router.gr.dart';
import 'package:flutter_template/presentation/screen/home/components/theme_drop_down_button.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';
import 'package:flutter_template/presentation/widgets/app_bar/widgets.dart';

class SettingsPortraitView extends StatelessWidget {
  const SettingsPortraitView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: CustomAppBar(title: l10n.settingsTitle),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          AppConstant.horizontalGap16,
          AppConstant.horizontalGap16,
          AppConstant.horizontalGap16,
          // Clear the extended-body bottom navigation bar so the last row
          // stays fully visible above it.
          MediaQuery.of(context).padding.bottom + 90,
        ),
        children: [
          _SettingsSection(
            title: l10n.settingsAppearance,
            children: [
              _SettingsTile(
                icon: Icons.palette_outlined,
                title: l10n.settingsTheme,
                trailing: const ThemeDropDownButton(),
              ),
            ],
          ),
          Gap(AppConstant.verticalGap20),
          _SettingsSection(
            title: l10n.settingsAccount,
            children: [
              _SettingsTile(
                icon: Icons.logout_rounded,
                iconColor: theme.error,
                title: l10n.logout,
                subtitle: l10n.logoutSubtitle,
                onTap: () async {
                  await injector<SecureStorageService>().clearAccessToken();
                  if (context.mounted) {
                    context.router.replace(const LogInRoute());
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A titled group of setting rows wrapped in a bordered card.
class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppConstant.horizontalGap4,
            bottom: AppConstant.verticalGap8,
          ),
          child: AppText.titleSmall(
            title,
            color: theme.onSurface.withAlpha(150),
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.surface,
            borderRadius: BorderRadius.circular(AppConstant.borderRadius12),
            border: Border.all(color: theme.border.withAlpha(128)),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

/// A single settings row: leading icon, title/subtitle, optional trailing
/// widget or tap handler.
class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstant.borderRadius12),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalGap16,
          vertical: AppConstant.verticalGap12,
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? theme.primary, size: 22),
            Gap(AppConstant.horizontalGap16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodyLarge(title, fontWeight: FontWeight.w600),
                  if (subtitle != null) ...[
                    Gap(AppConstant.verticalGap4),
                    AppText.bodySmall(
                      subtitle!,
                      color: theme.onSurface.withAlpha(150),
                    ),
                  ],
                ],
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}
