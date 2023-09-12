import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/cubit.dart';
import 'package:network_calling/presentation/public_api/widgets/public_api_screen_body.dart';
import 'package:network_calling/presentation/public_api/widgets/theme_changing_button.dart';

class PublicApiListScreen extends StatelessWidget {
  const PublicApiListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PublicApiCubit>().getAllApi();
    return Scaffold(
      appBar: AppBar(
        title: const Text('All APIs'),
        centerTitle: true,
        actions: const [ThemeChangingButton()],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<PublicApiCubit>().getAllApi();
        },
        child: const PublicApiScreenBody(),
      ),
    );
  }
}
