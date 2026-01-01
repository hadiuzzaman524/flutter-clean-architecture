import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/route/app_router.gr.dart';
import 'package:tsl_flutter_template/presentation/screen/dashboard/dashboard_landscape.dart';
import 'package:tsl_flutter_template/presentation/screen/dashboard/dashboard_portrait.dart';
import 'package:tsl_flutter_template/presentation/widgets/widgets.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), WidgetsRoute()],
      builder: (context, child) {
        return _ResponsiveDashboard(child: child);
      },
    );
  }
}

class _ResponsiveDashboard extends Screen {
  final Widget child;

  const _ResponsiveDashboard({required this.child});

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return DashboardPortrait(child: child);
  }

  @override
  Widget buildMobileLandscapeView(BuildContext context) {
    return DashboardLandscape(child: child);
  }
}
