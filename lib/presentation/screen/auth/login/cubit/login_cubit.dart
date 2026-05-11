import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:tsl_flutter_template/core/error/response_error.dart';
import 'package:tsl_flutter_template/core/state_status/base_status.dart';
import 'package:tsl_flutter_template/domain/entity/base/base_entity.dart';
import 'package:tsl_flutter_template/domain/use_cases/auth/login_use_case.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(const LoginState());

  final LoginUseCase _loginUseCase;

  final Logger _logger = Logger();

  Future<void> login(LoginEntity input) async {
    emit(state.copyWith(loginStatus: BaseStatus.loading()));

    try {
      await _loginUseCase.execute(input);
      emit(
        state.copyWith(loginStatus: BaseStatus.success(), loginEntity: input),
      );
    } catch (e) {
      _logger.e(e);
      emit(
        state.copyWith(loginStatus: BaseStatus.failure(ResponseError.from(e))),
      );
    }
  }
}
