import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';

class SettingsLandscapeView extends StatelessWidget {
  const SettingsLandscapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppText.displayLargeBold("Settings Screen")),
    );
  }
}
