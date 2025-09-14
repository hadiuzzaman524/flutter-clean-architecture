import 'package:bloc/bloc.dart';
import 'package:tsl_flutter_template/domain/model/failure_model.dart';
import 'package:tsl_flutter_template/presentation/bloc/base_cubit_state.dart';

abstract class BaseCubit<Params, Data>
    extends Cubit<BaseCubitState<Params, Data>> {
  BaseCubit(super.initialState);

  void updateParams({required Params params, required bool isValidParams}) {
    emit(state.copyWith(params: params, paramsValid: isValidParams));
  }

  void resetPhase() {
    emit(state.copyWith(phase: UseCasePhase.initial));
  }

  void resetState(BaseCubitState<Params, Data> newState) {
    emit(newState);
  }

  Future<void> call(Params? params) async {
    final parameter = params ?? state.params;
    try {
      emit(state.copyWith(phase: UseCasePhase.loading, params: parameter));
      final result = await callUseCase(parameter);
      emit(state.copyWith(phase: UseCasePhase.success, data: result));
    } on Exception catch (e) {
      //TODO: Need to map error response here
      emit(
        state.copyWith(
          phase: UseCasePhase.failure,
          failure: FailureModel(code: '200', message: e.toString()),
        ),
      );
    }
  }

  @override
  void emit(BaseCubitState<Params, Data> state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }

  Future<Data> callUseCase(Params params);

  BaseCubitState<Params, Data> empty();

  bool get isLoading => state.phase == UseCasePhase.loading;

  bool get isSuccess => state.phase == UseCasePhase.success;

  bool get isFailure => state.phase == UseCasePhase.failure;

}
