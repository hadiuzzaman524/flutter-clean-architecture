import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'components/custom_navigation_rail.dart';

class DashboardLandscape extends StatelessWidget {
  final Widget child;

  const DashboardLandscape({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          CustomNavigationRail(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
