import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsl_flutter_template/core/injector/injector.dart';
import 'package:tsl_flutter_template/presentation/screen/home/cubits/user_cubit.dart';
import 'package:tsl_flutter_template/presentation/screen/home/home_landscape_view.dart';

import '../../widgets/widgets.dart';
import 'home_portrait_view.dart';

@RoutePage()
class HomeScreen extends Screen {
  const HomeScreen({super.key});

  @override
  Widget buildViewWrapper({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => injector<UserCubit>()..getUserList()),
      ],
      child: child,
    );
  }

  @override
  Widget buildMobilePortraitView(BuildContext context) {
    return const HomePortraitView();
  }

  @override
  Widget buildMobileLandscapeView(BuildContext context) {
    return const HomeLandscapeView();
  }
}
