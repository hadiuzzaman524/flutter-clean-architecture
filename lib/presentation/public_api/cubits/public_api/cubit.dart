import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:network_calling/domain/usecases/public_api/get_api_usecase.dart';

import 'state.dart';

@injectable
class PublicApiCubit extends Cubit<PublicApiState> {
  PublicApiCubit({required this.getApiUseCase}) : super(PublicApiState());
  final GetApiUseCase getApiUseCase;

  Future<void> getAllApi() async {
    emit(ApiFetchLoading());
    debugPrint('Api fetch loading');
    try {
      final result = await getApiUseCase.getAllApi();
      final entity = result.entries;
      emit(ApiFetchLoaded(entry: entity!));
      debugPrint('Api fetch loaded');
    } catch (e) {
      debugPrint('Api fetch error');
      emit(ApiFetchError(errorMessage: e.toString()));
    }
  }
}
