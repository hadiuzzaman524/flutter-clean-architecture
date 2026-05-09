part of 'signup_cubit.dart';

@freezed
sealed class SignupState with _$SignupState {
  const factory SignupState({
    @Default(BaseStatus.initial()) BaseStatus signupStatus,
    SignupEntity? signupEntity
  }) = _SignupState;
}
