import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/screen/dashboard/dashboard_landscape.dart';

import '../../widgets/widgets.dart';
import 'dashboard_portrait.dart';

@RoutePage()
class DashboardScreen extends Screen {
  const DashboardScreen({super.key});

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return DashboardPortrait();
  } @override
  Widget buildMobileLandscapeView(BuildContext context) {
    return DashboardLandscape();
  }
}
