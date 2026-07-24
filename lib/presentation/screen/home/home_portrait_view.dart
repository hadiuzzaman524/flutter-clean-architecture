import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/screen/home/components/subscribe_dialog.dart';
import 'package:flutter_template/presentation/screen/home/components/user_list.dart';
import 'package:flutter_template/presentation/screen/home/cubits/user_cubit.dart';
import 'package:flutter_template/presentation/screen/home/cubits/user_state.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';

class HomePortraitView extends StatelessWidget {
  const HomePortraitView({super.key});

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
        centerTitle: false,
        elevation: 0,
        backgroundColor: theme.surface,
        actions: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return Badge(
                isLabelVisible: state.isSubscribed,
                label: Text(
                  context.l10n.pro,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: theme.premium,
                offset: const Offset(-4, 4),
                child: IconButton(
                  onPressed: () => state.isSubscribed
                      ? context.read<UserCubit>().toggleSubscription(false)
                      : SubscribeDialog.show(context),
                  icon: Icon(
                    state.isSubscribed
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: state.isSubscribed ? theme.premium : theme.onSurface,
                  ),
                  tooltip: state.isSubscribed
                      ? context.l10n.subscriptionActive
                      : context.l10n.subscribe,
                ),
              );
            },
          ),
          Gap(AppConstant.horizontalGap8),
        ],
      ),
      body: const UserList(),
    );
  }
}
