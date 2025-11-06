import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsl_flutter_template/l10n/l10n.dart';
import 'package:tsl_flutter_template/presentation/route/app_router.dart';
import 'package:tsl_flutter_template/presentation/theme/base/theme_entity.dart';
import 'package:tsl_flutter_template/presentation/theme/cubit/app_theme_cubit.dart';
import 'package:tsl_flutter_template/presentation/theme/cubit/app_theme_state.dart';
import 'package:tsl_flutter_template/presentation/theme/dark/en_dark_mode.dart';
import 'package:tsl_flutter_template/presentation/theme/light/en_light_mode.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final availableThemes = [
      ThemeEntity(EnLightMode(), 'Light Mode'),
      ThemeEntity(EnDarkMode(), 'Dark Mode'),
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => AppThemeCubit(themeEntities: availableThemes),
        ),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            theme: state.currentTheme.theme.getAppTheme(
              orientation: MediaQuery.of(context).orientation,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
