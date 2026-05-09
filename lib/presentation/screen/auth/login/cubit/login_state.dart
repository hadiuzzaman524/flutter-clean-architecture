part of 'login_cubit.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    @Default(BaseStatus.initial()) BaseStatus loginStatus,
    LoginEntity? loginEntity
  }) = _LoginState;
}
