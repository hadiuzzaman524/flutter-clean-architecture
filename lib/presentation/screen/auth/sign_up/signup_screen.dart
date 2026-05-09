import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsl_flutter_template/core/injector/injector.dart';
import 'package:tsl_flutter_template/presentation/screen/auth/sign_up/signup_portrait_view.dart';
import 'package:tsl_flutter_template/presentation/widgets/widgets.dart';

import 'cubit/signup_cubit.dart';

@RoutePage()
class SignupScreen extends Screen {
  const SignupScreen({super.key});

  @override
  Widget buildViewWrapper({required Widget child}) {
    return MultiBlocProvider(
      providers: [BlocProvider<SignupCubit>(create: (context) => injector())],
      child: child,
    );
  }

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return const SignupPortraitView();
  }
}
