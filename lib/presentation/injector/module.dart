import 'package:injectable/injectable.dart';

@module
abstract class EnvModule {
  final String remoteConfigUrl =
      'https://apps.technonext.com/hajitalk/remote_config/remote_config_stage.json';
}
