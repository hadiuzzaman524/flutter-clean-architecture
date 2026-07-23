import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/core/helper/secure_storage_service.dart';
import 'package:flutter_template/core/injector/injector.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/route/app_router.gr.dart';
import 'package:flutter_template/presentation/screen/home/components/subscribe_dialog.dart';
import 'package:flutter_template/presentation/screen/home/components/theme_drop_down_button.dart';
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
          'Flutter Template',
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
                label: const Text(
                  'PRO',
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.amber,
                offset: const Offset(-4, 4),
                child: IconButton(
                  onPressed: () => state.isSubscribed
                      ? context.read<UserCubit>().toggleSubscription(false)
                      : SubscribeDialog.show(context),
                  icon: Icon(
                    state.isSubscribed
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: state.isSubscribed ? Colors.amber : theme.onSurface,
                  ),
                  tooltip:
                      state.isSubscribed ? 'Subscription Active' : 'Subscribe',
                ),
              );
            },
          ),
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
      body: const UserList(),
    );
  }
}
