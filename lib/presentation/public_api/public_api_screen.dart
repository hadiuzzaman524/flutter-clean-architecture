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
          if (state is ApiFetchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ApiFetchError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          if (state is ApiFetchLoaded) {
            return ListView.separated(
              itemBuilder: (ctx, index) => ListTile(
                title: Text(state.publicApiModel.apiList[index].api),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.publicApiModel.apiList[index].description),
                    Text(state.publicApiModel.apiList[index].link ?? "null"),
                  ],
                ),
              ),
              itemCount: state.publicApiModel.apiList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
