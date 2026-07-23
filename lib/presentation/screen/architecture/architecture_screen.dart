import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screen/architecture/architecture_landscape_view.dart';
import 'package:flutter_template/presentation/screen/architecture/architecture_portrait_view.dart';

import '../../widgets/widgets.dart';

@RoutePage()
class ArchitectureScreen extends Screen {
  const ArchitectureScreen({super.key});

  @override
  Widget buildViewWrapper({required Widget child}) {
    return child;
  }

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return const ArchitecturePortraitView();
  }

  @override
  Widget buildMobileLandscapeView(BuildContext context) {
    return const ArchitectureLandscapeView();
  }
}
