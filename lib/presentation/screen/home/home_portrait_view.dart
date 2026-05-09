import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/core/constants/app_constant.dart';
import 'package:tsl_flutter_template/core/helper/secure_storage_helper.dart';
import 'package:tsl_flutter_template/l10n/l10n.dart';
import 'package:tsl_flutter_template/presentation/route/app_router.gr.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';
import 'package:tsl_flutter_template/presentation/screen/home/components/theme_drop_down_button.dart';
import 'package:tsl_flutter_template/presentation/screen/home/components/user_list.dart';

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
          const ThemeDropDownButton(),
          Padding(
            padding: EdgeInsets.only(right: AppConstant.horizontalGap8),
            child: IconButton(
              onPressed: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text('Logout', style: TextStyle(color: theme.error)),
                      ),
                    ],
                  ),
                );

                if (confirm == true) {
                  await SecureStorageHelper.clearAccessToken();
                  if (context.mounted) {
                    context.router.replace(const LogInRoute());
                  }
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
