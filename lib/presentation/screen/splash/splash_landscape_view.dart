import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/route/app_router.gr.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';

class SplashLandscapeView extends StatefulWidget {
  const SplashLandscapeView({super.key});

  @override
  State<SplashLandscapeView> createState() => _SplashLandscapeViewState();
}

class _SplashLandscapeViewState extends State<SplashLandscapeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigate());
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    context.replaceRoute(const DashboardRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppText.displayLargeBold("Splash Screen")),
    );
  }
}
