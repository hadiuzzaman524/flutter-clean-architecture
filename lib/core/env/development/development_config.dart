import 'package:flutter_template/core/env/app_environment.dart';
import 'package:flutter_template/core/env/env.dart';

class DevelopmentConfig extends Env {
  @override
  String name = AppEnvironment.development;
  @override
  String baseUrl = 'https://jsonplaceholder.typicode.com';
}
