import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_template/core/injector/injector.config.dart';

final GetIt injector = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies(String environment) =>
    injector.init(environment: environment);
