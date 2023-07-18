import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/cubit.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/state.dart';

class PublicApiListScreen extends StatelessWidget {
  const PublicApiListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PublicApiCubit>().getAllApi();
    return Scaffold(
      appBar: AppBar(
        title: const Text('All APIs'),
        centerTitle: true,
      ),
      body: BlocBuilder<PublicApiCubit, PublicApiState>(
        builder: (context, state) {
          return state.when(
            Container.new,
            apiFetchLoading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            apiFetchedLoaded: (publicApiModel) => ListView.separated(
              itemBuilder: (ctx, index) => ListTile(
                title: Text(publicApiModel[index].apiName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(publicApiModel[index].description),
                    Text(publicApiModel[index].link),
                  ],
                ),
              ),
              itemCount: publicApiModel.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
            apiFetchedError: (errorMsg) => Center(
              child: Text(errorMsg),
            ),
          );
        },
      ),
    );
  }
}
