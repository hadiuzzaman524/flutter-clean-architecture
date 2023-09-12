import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/cubit.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/state.dart';
import 'package:network_calling/presentation/public_api/widgets/api_info_card.dart';
import 'package:network_calling/presentation/widgets/error_widget.dart';

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
            child: Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    key: const Key('api-loaded-list'),
                    itemBuilder: (ctx, index) => ApiInfoCard(
                      apiName: publicApiModel[index].apiName,
                      description: publicApiModel[index].description,
                      url: publicApiModel[index].link,
                    ),
                    itemCount: publicApiModel.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                ),
              ],
            ),
          ),
          apiFetchedError: (responseError) => Center(
            key: const Key('error-key'),
            child: AppErrorWidget(
              noInternetConnection: responseError.isNoInternet,
              onRefreshPage: () {
                context.read<PublicApiCubit>().getAllApi();
              },
            ),
          ),
        );
      },
    );
  }
}
