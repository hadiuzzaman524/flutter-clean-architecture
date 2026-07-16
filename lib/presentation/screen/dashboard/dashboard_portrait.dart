import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screen/dashboard/components/custom_bottom_navigation_bar.dart';

class DashboardPortrait extends StatelessWidget {
  final Widget child;

  const DashboardPortrait({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: child,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: (index) {
          tabsRouter.setActiveIndex(index);
        },
      ),
    );
  }
}
