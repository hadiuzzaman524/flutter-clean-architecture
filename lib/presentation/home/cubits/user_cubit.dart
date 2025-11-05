import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:tsl_flutter_template/domain/use_cases/user/get_user_list_use_case.dart';
import 'package:tsl_flutter_template/presentation/home/cubits/user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  UserCubit(this._getUserListUseCase) : super(const UserState());

  final GetUserListUseCase _getUserListUseCase;
  final logger = Logger();

  Future<void> getUserList() async {
    try {
      final userList = await _getUserListUseCase.execute();
      emit(state.copyWith(userList: userList));
    } catch (e) {
      logger.e(e);
    }
  }
}
