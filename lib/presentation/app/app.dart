import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/locale/cubit/app_locale_cubit.dart';
import 'package:flutter_template/presentation/locale/cubit/app_locale_state.dart';
import 'package:flutter_template/presentation/route/app_router.dart';
import 'package:flutter_template/presentation/theme/base/theme_entity.dart';
import 'package:flutter_template/presentation/theme/cubit/app_theme_cubit.dart';
import 'package:flutter_template/presentation/theme/cubit/app_theme_state.dart';
import 'package:flutter_template/presentation/theme/dark/en_dark_mode.dart';
import 'package:flutter_template/presentation/theme/light/en_light_mode.dart';
import 'package:flutter_template/presentation/theme/system/system_mode.dart';
import '../widgets/widgets.dart';

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
      ThemeEntity(SystemMode(), 'System'),
      ThemeEntity(EnLightMode(), 'Light Mode'),
      ThemeEntity(EnDarkMode(), 'Dark Mode'),
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => AppThemeCubit(themeEntities: availableThemes),
        ),
        BlocProvider(
          create: (ctx) => AppLocaleCubit(
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Screen.screenSize(context),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<AppLocaleCubit, AppLocaleState>(
              builder: (context, localeState) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerDelegate: _appRouter.delegate(),
                  routeInformationParser: _appRouter.defaultRouteParser(),
                  theme: themeState.currentTheme.theme.getAppTheme(
                    orientation: MediaQuery.of(context).orientation,
                  ),
                  locale: localeState.currentLocale,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
