import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/core/helper/secure_storage_helper.dart';
import 'package:tsl_flutter_template/l10n/l10n.dart';
import 'package:tsl_flutter_template/presentation/route/app_router.gr.dart';
import 'package:tsl_flutter_template/presentation/screen/home/components/theme_drop_down_button.dart';
import 'package:tsl_flutter_template/presentation/screen/home/components/user_list.dart';

class HomePortraitView extends StatelessWidget {
  const HomePortraitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Template'),
        actions: [
          ThemeDropDownButton(),
          IconButton(
            onPressed: () async {
              await SecureStorageHelper.clearAccessToken();
              context.router.replace(const LogInRoute());
            },
            icon: const Icon(Icons.logout),
            tooltip: context.l10n.logout,
          ),
        ],
      ),
      body: const UserList(),
    );
  }
}
