import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_calling/injectable/injectable_configuration.dart';
import 'package:network_calling/l10n/l10n.dart';
import 'package:network_calling/presentation/cubits/app_theme/app_theme_cubit.dart';
import 'package:network_calling/presentation/cubits/app_theme/app_theme_state.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/cubit.dart';
import 'package:network_calling/presentation/public_api/public_api_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PublicApiCubit>(create: (context) => getIt()),
        BlocProvider<AppThemeCubit>(
          create: (context) => AppThemeCubit()..getThemeMode(),
        ),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
              colorScheme: ColorScheme.fromSwatch(
                accentColor: const Color(0xFF13B9FF),
              ),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const PublicApiListScreen(),
          );
        },
      ),
    );
  }
}
