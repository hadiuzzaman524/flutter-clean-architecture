import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_calling/injectable/injectable_configuration.dart';
import 'package:network_calling/l10n/l10n.dart';
import 'package:network_calling/presentation/cubits/app_theme/app_theme_cubit.dart';
import 'package:network_calling/presentation/cubits/app_theme/app_theme_state.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/cubit.dart';
import 'package:network_calling/presentation/public_api/public_api_screen.dart';
import 'package:network_calling/resources/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PublicApiCubit>(create: (context) => getIt()),
        BlocProvider(create: (_) => AppThemeCubit()..getThemeMode()),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          final isDarkMode = state.isDarkMode;
          return MaterialApp(
            theme: ThemeData(
              colorScheme: isDarkMode
                  ? const ColorScheme.dark().copyWith(
                      primary: context.colors.primaryColor,
                    )
                  : const ColorScheme.light().copyWith(
                      primary: context.colors.primaryColor,
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
