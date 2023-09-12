import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_calling/presentation/cubits/app_theme/app_theme_cubit.dart';
import 'package:network_calling/resources/app_colors.dart';

class ThemeChangingButton extends StatefulWidget {
  const ThemeChangingButton({super.key});

  @override
  State<ThemeChangingButton> createState() => _ThemeChangingButtonState();
}

class _ThemeChangingButtonState extends State<ThemeChangingButton> {
  late bool darkMode;
  bool isFirst = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirst) {
      try {
        darkMode = context.watch<AppThemeCubit>().state.isDarkMode;
      } catch (e) {
        darkMode = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: darkMode
          ? Icon(
              Icons.wb_sunny,
              color: context.colors.primaryColor,
            )
          : Icon(
              Icons.brightness_2_outlined,
              color: context.colors.iconColor,
            ),
      onPressed: () {
        setState(() {
          darkMode = !darkMode;
          context.read<AppThemeCubit>().changeThemeMode(darkMode);
        });
      },
    );
  }
}
