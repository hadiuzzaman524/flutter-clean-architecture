import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:flutter_template/core/error/response_error.dart';
import 'package:flutter_template/core/state_status/base_status.dart';
import 'package:flutter_template/domain/exceptions/subscription_required_exception.dart';
import 'package:flutter_template/domain/use_cases/user/get_subscription_status_use_case.dart';
import 'package:flutter_template/domain/use_cases/user/get_user_list_use_case.dart';
import 'package:flutter_template/domain/use_cases/user/set_subscription_status_use_case.dart';
import 'package:flutter_template/presentation/screen/home/cubits/user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit(
    this._getUserListUseCase,
    this._logger,
    GetSubscriptionStatusUseCase getSubscriptionStatusUseCase,
    this._setSubscriptionStatusUseCase,
  ) : super(UserState(isSubscribed: getSubscriptionStatusUseCase.execute()));

  final GetUserListUseCase _getUserListUseCase;
  final Logger _logger;
  final SetSubscriptionStatusUseCase _setSubscriptionStatusUseCase;

  Future<void> getUserList() async {
    try {
      emit(
        state.copyWith(
          status: const BaseStatus.loading(),
          isSubscriptionRequired: false,
        ),
      );
      final userList = await _getUserListUseCase.execute();
      emit(
        state.copyWith(userList: userList, status: const BaseStatus.success()),
      );
    } on SubscriptionRequiredException {
      emit(
        state.copyWith(
          status: const BaseStatus.initial(),
          isSubscriptionRequired: true,
        ),
      );
    } catch (e) {
      _logger.e(e);
      emit(state.copyWith(status: BaseStatus.failure(ResponseError.from(e))));
    }
  }

  Future<void> toggleSubscription(bool value) async {
    await _setSubscriptionStatusUseCase.execute(value);
    emit(state.copyWith(isSubscribed: value));
  }

  Future<void> subscribeAndRefresh() async {
    await toggleSubscription(true);
    await getUserList();
  }
}
