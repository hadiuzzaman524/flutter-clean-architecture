import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_calling/domain/common/app_localization.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/cubit.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/state.dart';

class PublicApiScreenBody extends StatelessWidget {
  const PublicApiScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PublicApiCubit, PublicApiState>(
      builder: (context, state) {
        return state.when(
          Container.new,
          apiFetchLoading: () => const Center(
            key: Key('loading-key'),
            child: CircularProgressIndicator(),
          ),
          apiFetchedLoaded: (publicApiModel) => Material(
            child: ListView.separated(
              key: const Key('api-loaded-list'),
              itemBuilder: (ctx, index) => ListTile(
                key: Key('$index'),
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
          ),
          apiFetchedError: (responseError) => Center(
            key: const Key('error-key'),

            /// convert error to text by context function
            child: Text(context.errorLocalization.responseError(responseError)),
          ),
        );
      },
    );
  }
}
