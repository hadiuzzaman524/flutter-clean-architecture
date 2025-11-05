import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:tsl_flutter_template/presentation/injector/injector.config.dart';

final GetIt injector = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => injector.init();
