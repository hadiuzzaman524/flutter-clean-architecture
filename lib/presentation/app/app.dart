import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/l10n/l10n.dart';
import 'package:tsl_flutter_template/presentation/home/home_screen.dart';
import 'package:tsl_flutter_template/presentation/theme/light/en/en_light.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: EnLightTheme().getAppTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomeScreen(),
    );
  }
}
