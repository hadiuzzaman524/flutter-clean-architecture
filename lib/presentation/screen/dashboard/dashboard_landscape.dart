import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/route/app_router.gr.dart';

import 'components/custom_navigation_rail.dart';

class DashboardLandscape extends StatelessWidget {
  const DashboardLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), WidgetsRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Row(
                children: [
                  CustomNavigationRail(
                    currentIndex: tabsRouter.activeIndex,
                    onTap: (index) => tabsRouter.setActiveIndex(index),
                  ),
                  Expanded(child: child),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
