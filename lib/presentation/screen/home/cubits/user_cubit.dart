import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:tsl_flutter_template/core/error/response_error.dart';
import 'package:tsl_flutter_template/core/state_status/base_status.dart';
import 'package:tsl_flutter_template/domain/use_cases/user/get_user_list_use_case.dart';
import 'package:tsl_flutter_template/presentation/screen/home/cubits/user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit(this._getUserListUseCase, this._logger) : super(const UserState());

  final GetUserListUseCase _getUserListUseCase;
  final Logger _logger;

  Future<void> getUserList() async {
    try {
      emit(state.copyWith(status: const BaseStatus.loading()));
      final userList = await _getUserListUseCase.execute();
      emit(
        state.copyWith(
          userList: userList,
          status: const BaseStatus.success(),
        ),
      );
    } catch (e) {
      _logger.e(e);
      emit(state.copyWith(status: BaseStatus.failure(ResponseError.from(e))));
    }
  }
}
