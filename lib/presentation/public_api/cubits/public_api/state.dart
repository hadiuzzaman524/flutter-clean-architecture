import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network_calling/domain/entities/public_api/public_api_model.dart';

part 'state.freezed.dart';

@freezed
abstract class PublicApiState with _$PublicApiState {
  const factory PublicApiState() = _PublicApiState;

  const factory PublicApiState.apiFetchLoading() = _ApiFetchLoading;

  const factory PublicApiState.apiFetchedLoaded({
    required PublicApiModel publicApiModel,
  }) = _ApiFetchedLoaded;

  const factory PublicApiState.apiFetchedError({
    required String errorMsg,
  }) = _ApiFetchedError;
}

/*class ApiFetchLoading extends PublicApiState {
  ApiFetchLoading();
}

class ApiFetchLoaded extends PublicApiState {
  ApiFetchLoaded({required this.publicApiModel});
  final PublicApiModel publicApiModel;
}

class ApiFetchError extends PublicApiState {
  ApiFetchError({required this.errorMessage});
  final String errorMessage;
}*/
