import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/injector/injector.dart';
import 'package:flutter_template/presentation/widgets/widgets.dart';

import 'cubit/login_cubit.dart';
import 'login_portrait_view.dart';

@RoutePage()
class LogInScreen extends Screen {
  const LogInScreen({super.key});

  @override
  Widget buildViewWrapper({required Widget child}) {
    return MultiBlocProvider(
      providers: [BlocProvider<LoginCubit>(create: (context) => injector())],
      child: child,
    );
  }

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return const LogInPortraitView();
  }
}
