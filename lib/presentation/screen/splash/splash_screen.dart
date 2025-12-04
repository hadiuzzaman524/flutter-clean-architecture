import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/screen/splash/splash_landscape_view.dart';
import 'package:tsl_flutter_template/presentation/screen/splash/splash_portrat_view.dart';

import '../../widgets/widgets.dart';

@RoutePage()
class SplashScreen extends Screen {
  const SplashScreen({super.key});

  @override
  Widget buildViewWrapper({required Widget child}) {
    return child;
  }

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return SplashPortraitView();
  }

  @override
  Widget buildMobileLandscapeView(BuildContext context) {
    return SplashLandscapeView();
  }
}
