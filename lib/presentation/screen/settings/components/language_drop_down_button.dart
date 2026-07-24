import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/locale/cubit/app_locale_cubit.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';

class LanguageDropDownButton extends StatelessWidget {
  const LanguageDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((AppLocaleCubit cubit) => cubit.state);

    return DropdownButton<String?>(
      value: state.currentLocale?.languageCode,
      onChanged: (value) {
        context.read<AppLocaleCubit>().setLocale(
          value == null ? null : Locale(value),
        );
      },
      items: [
        DropdownMenuItem<String?>(
          child: AppText.bodyMedium(context.l10n.languageSystem),
        ),
        ...state.supportedLocales.map(
          (locale) => DropdownMenuItem<String?>(
            value: locale.languageCode,
            child: AppText.bodyMedium(_localizedLanguageName(context, locale)),
          ),
        ),
      ],
    );
  }

  String _localizedLanguageName(BuildContext context, Locale locale) {
    return switch (locale.languageCode) {
      'en' => context.l10n.languageEnglish,
      'es' => context.l10n.languageSpanish,
      _ => locale.languageCode,
    };
  }
}
