import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tsl_flutter_template/core/state_status/base_status.dart';
import 'package:tsl_flutter_template/domain/entity/base/base_entity.dart';

part 'user_state.freezed.dart';

@freezed
sealed class UserState with _$UserState {
  const factory UserState({
    @Default([]) List<UserEntity> userList,
    @Default(BaseStatus<UserState>.initial()) BaseStatus<UserState> status,
  }) = _UserState;
}
