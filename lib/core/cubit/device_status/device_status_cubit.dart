import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_status_cubit.freezed.dart';
part 'device_status_state.dart';

class DeviceStatusCubit extends Cubit<DeviceStatusState> {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  DeviceStatusCubit() : super(DeviceStatusState.empty());
  late final AppLifecycleListener _listener;

  Future<void> init() async {
    _subscription = Connectivity().onConnectivityChanged.listen(
      _handleConnectionChange,
    );
    _listener = AppLifecycleListener(
      onResume: () async {
        var connection = await Connectivity().checkConnectivity();
        _handleConnectionChange(connection);
      },
    );
  }

  Future<void> _handleConnectionChange(List<ConnectivityResult> result) async {
    final mobileNetwork = result.contains(ConnectivityResult.mobile);
    final wifiNetwork = result.contains(ConnectivityResult.wifi);
    emit(
      state.copyWith(
        mobileNetwork: mobileNetwork,
        wifiNetwork: wifiNetwork,
        hasInternet: await _isInternetConnected(result),
      ),
    );
  }

  Future<bool> _isInternetConnected(List<ConnectivityResult> result) async {
    final mobileNetwork = result.contains(ConnectivityResult.mobile);
    final wifiNetwork = result.contains(ConnectivityResult.wifi);
    final ethernet = result.contains(ConnectivityResult.ethernet);
    if (!mobileNetwork && !wifiNetwork && !ethernet) return false;
    try {
      final response = await InternetAddress.lookup('google.com');
      return response.isNotEmpty && response.first.rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }

  @override
  Future<void> close() async {
    _subscription?.cancel();
    _listener.dispose();
    super.close();
  }
}
