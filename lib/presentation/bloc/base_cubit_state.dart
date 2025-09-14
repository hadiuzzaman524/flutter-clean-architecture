import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsl_flutter_template/domain/model/failure_model.dart';

part 'base_cubit_state.freezed.dart';

enum UseCasePhase { initial, loading, success, failure }

@freezed
abstract class BaseCubitState<Params, Data>
    with _$BaseCubitState<Params, Data> {
  const factory BaseCubitState({
    required UseCasePhase phase,
    required bool paramsValid,
    required Params params,
    required Data data,
    required FailureModel failure,
  }) = _BaseCubitState<Params, Data>;

  /// Convenience constructor for an empty state
  factory BaseCubitState.empty({
    required Params params,
    required Data data,
    bool? paramsValid,
  }) => BaseCubitState(
    phase: UseCasePhase.initial,
    paramsValid: paramsValid ?? false,
    params: params,
    data: data,
    failure: FailureModel.generic(),
  );
}
