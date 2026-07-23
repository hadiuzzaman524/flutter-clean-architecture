import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/core/error/error_localization.dart';
import 'package:flutter_template/core/error/response_error.dart';
import 'package:flutter_template/core/state_status/base_status.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/screen/home/components/subscribe_dialog.dart';
import 'package:flutter_template/presentation/screen/home/cubits/user_cubit.dart';
import 'package:flutter_template/presentation/screen/home/cubits/user_state.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  /// Up to two uppercase initials from a display name (e.g. "Ada Rivera" → "AR").
  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty);
    if (parts.isEmpty) return '?';
    final letters = parts.take(2).map((p) => p[0].toUpperCase()).join();
    return letters;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;

    return BlocBuilder<UserCubit, UserState>(
      builder: (ctx, state) {
        if (state.isSubscriptionRequired) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstant.horizontalGap20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 96,
                    width: 96,
                    decoration: BoxDecoration(
                      color: theme.premium.withAlpha(30),
                      borderRadius: BorderRadius.circular(
                        AppConstant.borderRadius20,
                      ),
                    ),
                    child: Icon(
                      Icons.workspace_premium_rounded,
                      size: 48,
                      color: theme.premium,
                    ),
                  ),
                  Gap(AppConstant.verticalGap16),
                  AppText.titleLarge(
                    context.l10n.premiumFeatureTitle,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(AppConstant.verticalGap8),
                  AppText.bodyMedium(
                    context.l10n.premiumFeatureSubtitle,
                    textAlign: TextAlign.center,
                    color: theme.onSurface.withAlpha(153),
                  ),
                  Gap(AppConstant.verticalGap16),
                  FilledButton.icon(
                    onPressed: () => SubscribeDialog.show(context),
                    icon: const Icon(Icons.star_rounded),
                    label: Text(context.l10n.subscribe),
                  ),
                ],
              ),
            ),
          );
        }

        final userList = state.userList;
        return switch (state.status) {
          Loading() => const Center(child: CircularProgressIndicator()),
          Success() => ListView.separated(
              padding: EdgeInsets.fromLTRB(
                AppConstant.horizontalGap16,
                AppConstant.horizontalGap16,
                AppConstant.horizontalGap16,
                // Clear the extended-body bottom navigation bar so the last
                // card stays fully visible above it.
                MediaQuery.of(context).padding.bottom + 90,
              ),
              itemBuilder: (ctx, index) {
                final user = userList[index];
                return Container(
                  padding: EdgeInsets.all(AppConstant.horizontalGap16),
                  decoration: BoxDecoration(
                    color: theme.surfaceElevated,
                    borderRadius: BorderRadius.circular(AppConstant.borderRadius16),
                    border: Border.all(color: theme.border),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadow.withAlpha(20),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [theme.primary, theme.secondary],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: AppText.titleMedium(
                          _initials(user.name),
                          color: theme.onPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gap(AppConstant.horizontalGap16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.titleLarge(
                              user.name,
                              style: context.textStyle.titleLarge.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gap(AppConstant.verticalGap4),
                            Row(
                              children: [
                                Icon(Icons.email_outlined, size: 14, color: theme.onSurface.withAlpha(128)),
                                Gap(AppConstant.horizontalGap4),
                                Expanded(
                                  child: AppText.bodySmall(
                                    user.email,
                                    color: theme.onSurface.withAlpha(153),
                                  ),
                                ),
                              ],
                            ),
                            Gap(AppConstant.verticalGap4),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, size: 14, color: theme.onSurface.withAlpha(128)),
                                Gap(AppConstant.horizontalGap4),
                                Expanded(
                                  child: AppText.bodySmall(
                                    "${user.city}, ${user.address}",
                                    color: theme.onSurface.withAlpha(153),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: theme.onSurface.withAlpha(77),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (ctx, index) => Gap(AppConstant.verticalGap12),
              itemCount: userList.length,
            ),
          Failure(:final ResponseError responseError) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline_rounded, size: 64, color: theme.error.withAlpha(128)),
                  Gap(AppConstant.verticalGap16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppConstant.horizontalGap20),
                    child: AppText.bodyLarge(
                      context.errorLocalization.responseError(responseError),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gap(AppConstant.verticalGap16),
                  TextButton.icon(
                    onPressed: () => context.read<UserCubit>().getUserList(),
                    icon: const Icon(Icons.refresh_rounded),
                    label: Text(context.l10n.retry),
                  ),
                ],
              ),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
