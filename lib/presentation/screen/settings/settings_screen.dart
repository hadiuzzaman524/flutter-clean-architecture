import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screen/settings/settings_portrait_view.dart';

import '../../widgets/widgets.dart';

@RoutePage()
class SettingsScreen extends Screen {
  const SettingsScreen({super.key});

  @override
  Widget buildViewWrapper({required Widget child}) {
    return child;
  }

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return const SettingsPortraitView();
  }
}
