import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/screen/widget_screen/widget_landscape_view.dart';
import 'package:tsl_flutter_template/presentation/screen/widget_screen/widget_portrait_view.dart';

import '../../widgets/widgets.dart';

@RoutePage()
class WidgetsScreen extends Screen {
  const WidgetsScreen({super.key});

  @override
  Widget buildViewWrapper({required Widget child}) {
    return child;
  }

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return WidgetsPortraitView();
  }
  @override
  Widget buildMobileLandscapeView(BuildContext context) {
    return WidgetsLandscapeView();
  }
}
