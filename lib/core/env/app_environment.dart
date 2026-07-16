/// Single source of truth for environment names.
///
/// Used both in `@Environment(...)` DI annotations and by the env config
/// classes, so the environment identifiers are never hardcoded as loose
/// strings. `static const` makes each value usable as an annotation argument.
abstract class AppEnvironment {
  const AppEnvironment._();

  static const String development = 'development';
  static const String staging = 'staging';
  static const String production = 'production';
}
