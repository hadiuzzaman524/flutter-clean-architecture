import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity;
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  InternetCubit(this._connectivity) : super(const InternetState.connected()) {
    _subscription = _connectivity.onConnectivityChanged.listen((statusList) {
      final hasConnection =
          statusList.isNotEmpty &&
          statusList.any((status) => status != ConnectivityResult.none);

      if (hasConnection) {
        emit(const InternetState.connected());
      } else {
        emit(const InternetState.disconnected());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
