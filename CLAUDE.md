# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

A Flutter Clean Architecture template (created via Very Good CLI). Requires Dart SDK `^3.11.0`.

## Commands

### Running (three flavors)
```bash
flutter run --flavor development --target lib/main_development.dart  # mocked data, no backend
flutter run --flavor staging     --target lib/main_staging.dart
flutter run --flavor production   --target lib/main_production.dart
```

### First-time setup
```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
./setup.sh   # installs git hooks (commit-msg + branch-name enforcement) and makes scripts executable
```

### Code generation (run after touching freezed/injectable/retrofit/json/asset code)
```bash
dart run build_runner build --delete-conflicting-outputs   # one-off
dart run build_runner watch --delete-conflicting-outputs   # continuous
```
Generated files (`*.g.dart`, `*.freezed.dart`, `injector.config.dart`, `*.gr.dart`, `assets.gen.dart`) are checked in and excluded from analysis. Do not hand-edit them.

### Testing
```bash
flutter test                                                  # all
flutter test test/presentation/user_cubit_test.dart           # single file
flutter test --plain-name "maps response models to entities"  # by name
flutter test --coverage                                       # writes coverage/lcov.info
```

### Lint
```bash
flutter analyze   # uses very_good_analysis via flutter_lints (see analysis_options.yaml)
```

### Localization
```bash
./l10n_generator.sh   # add ARB keys interactively (choose type "text"); access via context.l10n.<key>
```
ARB source: `lib/l10n/arb/app_en.arb` (template) + `app_es.arb`. Generated into `lib/l10n/gen/`.

### Scaffold a new feature
```bash
./create_feature.sh feature_name   # generates domain/data/presentation files following the layer conventions below
```

## Architecture

Clean Architecture with a strict inward dependency rule. Four top-level directories under `lib/`:

- **`domain/`** — business core, no Flutter/data dependencies. `entity/` (freezed models), `repository/` (abstract interfaces), `use_cases/` (one operation each, mixing in `BaseUseCase<Output>` or `BaseUseCaseWithParams<Output, Params>`).
- **`data/`** — implements domain contracts. `repository_impl/` implement `domain/repository` interfaces; `data_source/` talk to APIs (Retrofit) or mocks; `models/` are request/response DTOs; `remapper/` are extensions mapping DTOs ↔ domain entities.
- **`presentation/`** — UI via BLoC/Cubit. `app/`, `route/` (auto_route), `theme/`, `widgets/` (reusable), plus feature screens. Cubits emit freezed states wrapping a `BaseStatus`.
- **`core/`** — cross-cutting: `injector/` (DI), `env/` (flavors), `state_status/` (`BaseStatus`), `error/` (`ResponseError`), `helper/`, `extensions/`, `constants/`.

### Dependency injection (injectable + get_it)
- Global container is `injector` in [lib/core/injector/injector.dart](lib/core/injector/injector.dart). Registrations are generated into `injector.config.dart`.
- `configureDependencies(environmentName)` is called during bootstrap; the environment string gates which registrations activate.
- Annotate classes with `@singleton` / `@lazySingleton` / `@injectable` / `@Singleton(as: SomeInterface)`. Third-party/config objects are provided via `@module` classes in [lib/core/injector/module.dart](lib/core/injector/module.dart) (Dio, secure storage, logger).
- **After adding/removing any DI annotation, re-run build_runner** or the change won't take effect.

### Flavor-based data mocking (key pattern)
Data sources are obtained through an **Abstract Factory**, not injected directly, so flavor selects real vs. mocked data at DI time:
- `DataSourceFactory` interface → `createUserDataSource()`, `createAuthDataSource()`.
- [lib/data/data_source/base/factory/data_source_provider.dart](lib/data/data_source/base/factory/data_source_provider.dart) binds `MockDataSourceFactory` for `@Environment(development)` and `RemoteDataSourceFactory` for staging/production.
- Repository impls take `DataSourceFactory` in their constructor and call `factory.createXDataSource()` — they never know whether data is mocked.
- Each data source has an abstract interface (`user/user_data_source.dart`) plus `remote/` (Retrofit `@RestApi`) and `mock/` implementations.
- **Consequence:** the `development` flavor runs fully offline against mock data. Adding a data source means: interface + `remote/` + `mock/` impls, then wire both into `DataSourceProvider` and both factories.

Environment names live in one place: `AppEnvironment` ([lib/core/env/app_environment.dart](lib/core/env/app_environment.dart)) — used for both `@Environment(...)` annotations and config classes. Each flavor has a `main_<flavor>.dart` entry that instantiates its `Env` subclass ([lib/core/env/](lib/core/env/)), which sets `Env.shared` and bootstraps the app (`configureDependencies`, `Bloc.observer`, `runApp`).

### State handling
Cubit states are freezed classes holding a `BaseStatus` (`loading` / `success` / `failure(ResponseError)`). Cubits catch `DioException` and emit `BaseStatus.failure`. Backend errors flow through `BackendErrorInterceptor` → `ResponseError`.

## Testing conventions
`test/` mirrors `lib/` layer structure; each layer is tested in isolation by mocking the layer directly beneath it (`mocktail`). No real network/storage/DI is touched. When using `any()` with a custom type, `registerFallbackValue(...)` once in `setUpAll`. See README §6 for full patterns.

## Git conventions (enforced by hooks after `./setup.sh`)
- **Branches:** `feat/`, `fix/`, `refactor/`, or `chore/` prefix (except `main`/`develop`/`master`).
- **Commits:** Conventional Commits — `type: description` (≥3 chars). Types: `feat`, `fix`, `refactor`, `chore`, `docs`, `style`, `test`, `perf`, `ci`, `build`, `revert`, `wip`.
- CI (`.github/workflows/main.yaml`) runs on `main`: semantic-PR check, `very_good` Flutter build/test, and spell-check.
