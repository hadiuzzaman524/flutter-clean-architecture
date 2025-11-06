import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsl_flutter_template/core/injector/injector.dart';
import 'package:tsl_flutter_template/presentation/screen/home/cubits/user_cubit.dart';
import 'package:tsl_flutter_template/presentation/screen/home/widgets/theme_drop_down_button.dart';
import 'package:tsl_flutter_template/presentation/screen/home/widgets/user_list.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Template'),
        actions: [ThemeDropDownButton()],
      ),
      body: BlocProvider<UserCubit>(
        create: (ctx) => injector()..getUserList(),
        child: const UserList(),
      ),
    );
  }
}
