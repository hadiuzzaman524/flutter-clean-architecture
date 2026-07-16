import 'package:flutter_template/core/env/app_environment.dart';
import 'package:flutter_template/core/env/env.dart';

class StagingConfig extends Env {
  @override
  String name = AppEnvironment.staging;
  @override
  String baseUrl = 'https://jsonplaceholder.typicode.com';
}
