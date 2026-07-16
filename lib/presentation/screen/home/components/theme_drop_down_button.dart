import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/theme/cubit/app_theme_cubit.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';

class ThemeDropDownButton extends StatelessWidget {
  const ThemeDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((AppThemeCubit cubit) => cubit.state);

    return DropdownButton<String>(
      value: state.currentTheme.displayName,
      onChanged: (value) {
        if (value != null) {
          context.read<AppThemeCubit>().setThemeByName(value);
        }
      },
      items: state.themes.map((themeEntity) {
        return DropdownMenuItem<String>(
          value: themeEntity.displayName,
          child: AppText.bodyMedium(themeEntity.displayName),
        );
      }).toList(),
    );
  }
}
