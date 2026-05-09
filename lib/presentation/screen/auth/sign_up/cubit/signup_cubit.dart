import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:tsl_flutter_template/core/error/response_error.dart';
import 'package:tsl_flutter_template/core/state_status/base_status.dart';
import 'package:tsl_flutter_template/domain/entity/base/base_entity.dart';
import 'package:tsl_flutter_template/domain/use_cases/auth/signup_use_case.dart';

part 'signup_cubit.freezed.dart';
part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupUseCase) : super(const SignupState());

  final SignupUseCase _signupUseCase;

  final Logger _logger = Logger();

  Future<void> signup(SignupEntity input) async {
    emit(state.copyWith(signupStatus: BaseStatus.loading()));

    try {
      await _signupUseCase.execute(input);
      emit(
        state.copyWith(signupStatus: BaseStatus.success(), signupEntity: input),
      );
    } catch (e) {
      _logger.e(e);
      emit(
        state.copyWith(signupStatus: BaseStatus.failure(ResponseError.from(e))),
      );
    }
  }
}
