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
            return ListView.builder(
              itemBuilder: (ctx, index) => ListTile(
                title: Text(state.entry[index].api ?? "Test"),
                subtitle: Text(state.entry[index].description ?? "test"),
              ),
              itemCount: state.entry.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
