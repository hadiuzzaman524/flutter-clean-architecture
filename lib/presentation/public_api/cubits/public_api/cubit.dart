import 'package:bloc/bloc.dart';

import 'state.dart';

class PublicApiCubit extends Cubit<PublicApiState> {
  PublicApiCubit() : super(PublicApiState().init());
}
