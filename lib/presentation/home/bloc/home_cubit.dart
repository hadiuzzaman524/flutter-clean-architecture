import 'package:tsl_flutter_template/presentation/bloc/base_cubit.dart';
import 'package:tsl_flutter_template/presentation/bloc/base_cubit_state.dart';

class HomeCubit extends BaseCubit<String, String> {
  HomeCubit() : super(BaseCubitState.empty(params: '', data: ''));

  @override
  Future<String> callUseCase(String params) async {
    return params;
  }

  @override
  BaseCubitState<String, String> empty() {
    return BaseCubitState.empty(params: '', data: '');
  }
}
