import 'package:bloc/bloc.dart';
import 'package:network_calling/domain/usecases/public_api/get_api_usecase.dart';

import 'state.dart';

class PublicApiCubit extends Cubit<PublicApiState> {
  PublicApiCubit({required this.getApiUseCase}) : super(PublicApiState());
  final GetApiUseCase getApiUseCase;

  Future<void> getAllApi() async {
    emit(ApiFetchLoading());
    try {
      final result = await getApiUseCase.getAllApi();
      emit(ApiFetchLoaded(publicApiEntity: result));
    } catch (e) {
      emit(ApiFetchError(errorMessage: e.toString()));
    }
  }
}
