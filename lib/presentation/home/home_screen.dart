import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsl_flutter_template/l10n/l10n.dart';
import 'package:tsl_flutter_template/presentation/home/cubits/user_cubit.dart';
import 'package:tsl_flutter_template/presentation/home/widgets/user_list.dart';
import 'package:tsl_flutter_template/presentation/injector/injector.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Template'),
      ),
      body: BlocProvider<UserCubit>(
        create: (ctx) => injector()..getUserList(),
        child: const UserList(),
      ),
    );
  }
}
