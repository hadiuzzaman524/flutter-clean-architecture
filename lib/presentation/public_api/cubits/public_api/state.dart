import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network_calling/domain/entities/api/api_entity.dart';

part 'state.freezed.dart';

@freezed
abstract class PublicApiState with _$PublicApiState {
  const factory PublicApiState() = _PublicApiState;

  const factory PublicApiState.apiFetchLoading() = _ApiFetchLoading;

  const factory PublicApiState.apiFetchedLoaded({
    required List<ApiEntity> publicApiModelList,
  }) = _ApiFetchedLoaded;

  const factory PublicApiState.apiFetchedError({
    required String errorMsg,
  }) = _ApiFetchedError;
}
