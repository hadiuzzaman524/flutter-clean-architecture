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

class _SplashPortraitViewState extends State<SplashPortraitView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.bounceIn),
      ),
    );

    _controller.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigate());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    final theme = context.colors;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.primary,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [theme.primary, theme.primary.withBlue(100)],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Decorative background patterns
            Positioned(
              top: -50,
              left: -50,
              child: _CircularDecorative(
                color: Colors.white.withOpacity(0.05),
                size: 200,
              ),
            ),
            Positioned(
              bottom: -100,
              right: -100,
              child: _CircularDecorative(
                color: Colors.white.withOpacity(0.05),
                size: 300,
              ),
            ),

            FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.rocket_launch_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    Gap(AppConstant.verticalGap20),
                    AppText.displayLargeBold(
                      "TSL Template",
                      color: Colors.white,
                    ),
                    Gap(AppConstant.verticalGap8),
                    AppText.bodyMedium(
                      "Elevating your mobile experience",
                      color: Colors.white.withOpacity(0.8),
                    ),
                    Gap(AppConstant.verticalGap20 * 3),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 40,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: AppText.labelMedium(
                  "Version 1.0.0",
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircularDecorative extends StatelessWidget {
  const _CircularDecorative({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
