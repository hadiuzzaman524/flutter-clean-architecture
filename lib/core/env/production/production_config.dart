import 'package:flutter_template/core/env/app_environment.dart';
import 'package:flutter_template/core/env/env.dart';

class ProductionConfig extends Env {
  @override
  String name = AppEnvironment.production;
  @override
  String baseUrl = 'https://jsonplaceholder.typicode.com';
}
