import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:network_calling/domain/common/response_error.dart';
import 'package:network_calling/domain/usecases/public_api/get_api_usecase.dart';
import 'package:network_calling/presentation/public_api/cubits/public_api/state.dart';

@injectable
class PublicApiCubit extends Cubit<PublicApiState> {
  PublicApiCubit({required GetApiUseCase getApiUseCase})
      : _getApiUseCase = getApiUseCase,
        super(const PublicApiState());
  final GetApiUseCase _getApiUseCase;

  Future<void> getAllApi() async {
    emit(const PublicApiState.apiFetchLoading());
    debugPrint('Api fetch loading');
    try {
      final result = await _getApiUseCase.run();

      emit(PublicApiState.apiFetchedLoaded(publicApiModelList: result));
      debugPrint('Api fetch loaded');
    } catch (e) {
      debugPrint('Api fetch error');
      emit(
        PublicApiState.apiFetchedError(responseError: ResponseError.from(e)),
      );
    }
  }
}
