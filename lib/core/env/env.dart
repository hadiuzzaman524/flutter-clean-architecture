import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/app/app.dart';

import '../injector/injector.dart';

abstract class Env {
  static late Env shared;
  abstract String name;
  abstract String baseUrl;
  bool initialized = false;

  Env() {
    shared = this;
    bootstrap(() => const App());
  }

  Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
    FlutterError.onError = (details) {
      log(details.exceptionAsString(), stackTrace: details.stack);
    };
    configureDependencies(name);

    Bloc.observer = const AppBlocObserver();

    runApp(await builder());
  }
}

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
