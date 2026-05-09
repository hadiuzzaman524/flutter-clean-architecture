import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tsl_flutter_template/core/constants/app_constant.dart';
import 'package:tsl_flutter_template/core/helper/secure_storage_helper.dart';
import 'package:tsl_flutter_template/presentation/route/app_router.gr.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';

class SplashPortraitView extends StatefulWidget {
  const SplashPortraitView({super.key});

  @override
  State<SplashPortraitView> createState() => _SplashPortraitViewState();
}

class _SplashPortraitViewState extends State<SplashPortraitView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigate());
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    final hasToken = await SecureStorageHelper.hasAccessToken();

    if (hasToken) {
      context.replaceRoute(const HomeRoute());
    } else {
      context.replaceRoute(const LogInRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                color: context.colors.onPrimary.withAlpha(50),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_balance_wallet_rounded,
                size: 48,
                color: context.colors.onPrimary,
              ),
            ),

            Gap(AppConstant.verticalGap12),

            AppText.displayLargeBold(
              "TSL Template",
              color: context.colors.onPrimary,
            ),

            Gap(AppConstant.verticalGap12),

            AppText.bodyMedium(
              "Secure • Fast • Reliable",
              color: Colors.white70,
            ),

            Gap(AppConstant.verticalGap20 * 2),

            CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                context.colors.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
