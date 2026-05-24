# Agent Working Agreement — NextSim (and projects modeled on it)

This document binds the AI assistant working in this repository. Read it fully before touching code.
When a request conflicts with this guide, ask before deviating.

Pair with [CLAUDE.md](./CLAUDE.md) (project setup, flavors, codegen commands, git hooks).

---

## 0. Operating principles

These override convenience.

1. **Clarify before coding.** If requirements are ambiguous, stop and use `AskUserQuestion`. Targets
   to clarify: data source (real API vs mock vs hardcoded), launch position in the navigation graph,
   lifecycle of expensive resources (videos, controllers, sockets), exact navigation behavior,
   whether to reuse existing types or introduce new ones. Do not implement blindly and "ask later."
2. **Match conventions on the first pass, not after correction.** Read at least one existing feature
   end-to-end before writing a new one. The reflex move is to grep for an analogous file and mirror
   its structure.
3. **No hallucinations.** Never invent APIs, library symbols, or URLs. If you reference a public
   CDN, verify it with `curl -I` first — a working URL last month may be 403 today. If you reference
   a class/function, grep for it in the repo first.
4. **Verify before claiming done.** Run `flutter analyze` on what you changed, run
   `dart run build_runner build --delete-conflicting-outputs` after any annotation change, and state
   explicitly what you did NOT verify (e.g. "I did not launch this on a device").
5. **Concise output.** End-of-turn summaries are 1–3 sentences. No filler, no apologies, no
   marketing language. Use markdown links to file:line for every code reference.

---

## 1. Layering

| Layer          | Folder              | Imports allowed                | Imports forbidden                |
|----------------|---------------------|--------------------------------|----------------------------------|
| `domain`       | `lib/domain/`       | Pure Dart, freezed annotation  | Flutter, retrofit, dio, isar     |
| `data`         | `lib/data/`         | `domain`, retrofit, dio, isar  | `presentation`                   |
| `presentation` | `lib/presentation/` | `domain` (entities, use cases) | `data` (use repositories via DI) |
| `core`         | `lib/core/`         | anything                       | nothing feature-specific         |

If you find yourself importing `package:flutter/...` from a `domain/` file — stop. Split the logic.

---

## 2. Naming (the rule I broke in this codebase first; do not break it again)

| Suffix        | Layer                                             | Identity                                                                         |
|---------------|---------------------------------------------------|----------------------------------------------------------------------------------|
| `XxxEntity`   | `domain/model/<feature>/`                         | What the app reasons about. No `@JsonKey`, no defaults for null safety.          |
| `XxxModel`    | `data/models/response_model/<feature>/`           | Wire-format DTO. `@JsonKey(name: ...)`, `@Default(...)` for resilience to nulls. |
| `XxxResponse` | `data/models/response_model/<feature>/`           | Top-level envelope: `{status, message, data}`.                                   |
| `toEntity()`  | `data/remapper/<feature>_response_to_entity.dart` | Extension method on the Model. One direction only: Model → Entity.               |

The repository implementation calls `model.toEntity()` before returning. Domain code never sees
`XxxModel`.

### Part-file aggregation (do not skip this step)

- Domain entities are `part of '../base/base_model.dart';` — add the
  `part '../<feature>/<file>.dart';` line to `lib/domain/model/base/base_model.dart`.
- Response DTOs are `part of '../base/base_response.dart';` — add to
  `lib/data/models/response_model/base/base_response.dart`.

Skipping this breaks codegen with no obvious error message.

---

## 3. UI conventions (the three hard rules)

### 3.1 No hardcoded colors

Forbidden anywhere in `lib/presentation/`:

- `Colors.white`, `Colors.black`, `Colors.transparent` (transparent has rare legitimate uses —
  `surfaceTintColor` etc; default no)
- `Color(0xFF...)`, `Color(0x66...)`
- `theme.colorScheme.X` (use the `AppColors` extension instead)

Required pattern:

```dart
import 'package:NextSim/presentation/theme/base/theme_extension.dart';

Container
(
color: context.colors.background);
Icon(Icons.add, color: context.colors.onSurface
);
```

For varying alpha on a base color: `context.colors.scrim.withValues(alpha: 0.4)`. Never add
`scrim60`, `scrim30` etc.

**If the color you need isn't in `AppColors`:** extend the theme, don't inline. Steps, in order:

1. Add a `final Color xxx;` field to [`AppColors`](lib/presentation/theme/base/app_colors.dart).
2. Add it to the constructor (required), to `copyWith`, and to `lerp`.
3. Add a getter to both [`DarkColorTheme`](lib/presentation/theme/dark/dark_color_theme.dart) and [
   `LightColorTheme`](lib/presentation/theme/light/light_color_theme.dart).
4. Wire it into `getAppColors` in both themes.

Yes, all four steps. Skipping `lerp` or the light theme makes the type system unhappy.

### 3.2 No raw `Text` widgets

Forbidden:

```dart
Text
('Hello
'
, style: TextStyle(fontSize: 14, color: Colors.
white
)
)
```

Required:

```dart
AppText.bodyMediumBold
('Hello
'
, color:
context
.
colors
.
onSurface
)
```

Variants: `display{Large,Medium,Small}`, `headline{Large,Medium,Small}`,
`title{Large,Medium,Small}`, `label{Large,Medium,Small}`, `body{Large,Medium,Small}` — each with a
`Bold` suffix. Font size and weight come from the theme. Pick the variant that matches the intended
size; don't override `fontSize` to force a different size out of the same variant.

`style:` may be passed for non-size deltas only (letterSpacing, shadows, height). Never re-specify
size or color through `style:` — use the named params.

### 3.3 No raw spacing/sizing values

Forbidden in widgets:

- `EdgeInsets.all(16)`, `EdgeInsets.symmetric(horizontal: 16)`
- `SizedBox(height: 12)`
- `12.w`, `16.h`, `20.r`, `14.sp` written inline
- `BorderRadius.circular(16)` for known design tokens

Required:

```dart
import 'package:NextSim/core/constants/app_constant.dart';

Padding
(
padding: EdgeInsets.symmetric(
horizontal: AppConstant.horizontalGap16,
vertical: AppConstant.verticalGap12,
),
child: ...,
)
Gap(AppConstant.verticalGap8)
BorderRadius
.
circular
(
AppConstant
.
borderRadius16
)
```

Grid is multiples of 4: `horizontalGap{4,8,12,16,20,24,28,32}`,
`verticalGap{4,8,12,16,20,24,28,32,36,40,120}`, `borderRadius{4,8,12,16,20,24,40,50,100}`,
`iconSize{14,18,20,30,36}`.

If a design needs a value outside the grid, snap to the nearest constant. If snapping breaks the
design, **add a new constant** to [`AppConstant`](lib/core/constants/app_constant.dart) — do not
inline.

### 3.4 No hardcoded strings — always l10n

Every user-visible string (button labels, headings, hints, snackbar messages, dialog text,
accessibility labels) goes through `context.l10n.X`. No bare string literals in widgets, snackbar
calls, or dialog content.

Forbidden:

```dart
AppText.titleLargeBold
('Upload image
'
, color: context.colors.onSurface)
AppSnackBarHelper.show(
context
,
message
    :
'
Generation flow will be wired
up
next
.
'
)
```

Required:

```dart
import 'package:NextSim/l10n/l10n.dart';

AppText.titleLargeBold
(
context.l10n.uploadImage, color: context.colors.onSurface)
AppSnackBarHelper.show(context, message:
context
.
l10n
.
generationFlowNotWired
)
```

#### Adding a new string

1. Open [`lib/l10n/arb/app_en.arb`](lib/l10n/arb/app_en.arb).
2. Add a `camelCaseKey: "Visible string"` entry. Keep keys descriptive, not positional (
   `uploadImage`, not `screenTitle1`).
3. For parameterized strings, use ICU syntax + a metadata block:
   ```json
   "generateCoinDeduction": "Spend {amount} Coins",
   "@generateCoinDeduction": {
     "placeholders": { "amount": { "type": "int" } }
   }
   ```
4. Run codegen:
   ```sh
   flutter gen-l10n --arb-dir="lib/l10n/arb"
   ```
5. Use it: `context.l10n.uploadImage` or `context.l10n.generateCoinDeduction(amount)`.

#### Multi-locale arbs

When `app_es.arb` (or any other locale arb) exists, add the same key there with a translated value.
`flutter gen-l10n` will warn about untranslated keys but won't fail — those warnings are real
follow-up work, not noise. If you don't speak the target language, add the English value as a
placeholder and flag it in the PR description so a translator can fix it.

#### Exceptions

The only strings that may stay inline are:

- Brand/proper nouns that are intentionally not translated (e.g. `"NextSim"`, `"PRO"` if treated as
  a
  wordmark).
- Debug/log output never shown to a user (`Logger.shared.log("...")` is fine).
- Tests.

When in doubt, l10n it.

---

## 4. Feature folder structure

```
lib/presentation/screen/<feature>/
├── <feature>_screen.dart            # @RoutePage Screen wrapper (dispatches portrait/landscape)
├── <feature>_portrait_view.dart     # Page UI
├── <feature>_landscape_view.dart    # Optional; default fallback is portrait
├── cubits/
│   ├── <feature>_cubit.dart
│   └── <feature>_state.dart         # part of <feature>_cubit.dart
└── widgets/                         # widgets used ONLY by this feature
    └── <thing>.dart
```

Widgets shared across features live in `lib/presentation/screen/widgets/`. Never move a one-feature
widget to the shared folder "in case it's reused later."

### Screen wrapper pattern

```dart
@RoutePage()
class VideoTemplateScreen extends Screen {
  const VideoTemplateScreen({super.key});

  @override
  Widget buildMobilePortraitView(BuildContext context) =>
      const VideoTemplatePortraitView();
}
```

`Screen` ([widgets.dart](lib/presentation/screen/widgets/widgets.dart)) handles `ScreenUtilInit` and
dispatches between portrait/landscape/tablet variants.

---

## 5. State (Cubit + BaseStatus)

Every cubit is `@injectable`. Every state is a freezed sealed class with:

- A `status` field of `BaseStatus<TheStateType>`
- A private constructor `const XxxState._();` (required to expose derived getters)
- Default values via `@Default(...)` for all fields

```dart
@injectable()
class VideoTemplateCubit extends Cubit<VideoTemplateState> {
  VideoTemplateCubit(this._useCase) : super(const VideoTemplateState());
  final GetVideoTemplateSectionsUseCase _useCase;

  Future<void> loadSections() async {
    try {
      emit(state.copyWith(status: BaseStatus<VideoTemplateState>.loading()));
      final sections = await _useCase.execute();
      emit(state.copyWith(
        status: BaseStatus<VideoTemplateState>.success(),
        sections: sections,
      ));
    } on Object catch (e) {
      emit(state.copyWith(
        status: BaseStatus<VideoTemplateState>.failure(ResponseError.from(e)),
      ));
    }
  }
}
```

```dart
@freezed
sealed class VideoTemplateState with _$VideoTemplateState {
  const VideoTemplateState._();

  const factory VideoTemplateState({
    @Default(BaseStatus<VideoTemplateState>.initial()) BaseStatus<VideoTemplateState> status,
    @Default(<VideoTemplateSectionEntity>[]) List<VideoTemplateSectionEntity> sections,
  }) = _VideoTemplateState;

  // Derived getters belong on the state, not the cubit.
  VideoTemplateSectionEntity? get heroSection {
    ...
  }
}
```

### Reading status

Use the boolean getters on `BaseStatus`. Do **not** runtime-check the sealed subtype:

```dart
// good
if (state.status.isLoading) { ... }
if (state.status.isFailure) { ... }

// bad
if (state.status is Loading) { ... }
```

### Registration

- **App-wide** (cubit's data is needed from app launch, e.g. home feed): register in [`App` widget's
  `MultiBlocProvider`](lib/presentation/app/app.dart) with a cascade-triggered initial load:
  `(context) => injector()..loadX()`.
- **Feature-scoped** (cubit dies with the screen): provide it locally with
  `BlocProvider(create: (_) => injector(), child: ScreenBody())`.

Pick app-wide only if a sibling screen also needs the data. Default to feature-scoped.

---

## 6. Routing (auto_route)

All routes declared in [`app_router.dart`](lib/presentation/route/app_router.dart). The config
rewrites `XxxScreen` / `XxxPage` to `XxxRoute`.

### Adding a route

1. `@RoutePage()` on the screen class.
2. Add `AutoRoute(page: XxxRoute.page)` to `AppRouter.routes`.
3. Run codegen.
4. After codegen, restart the IDE analysis server if the IDE doesn't see the new route — this is an
   IDE cache issue, not an error.

### Passing arguments

Auto_route serializes constructor args automatically:

```dart
@RoutePage()
class VideoTemplateGalleryScreen extends Screen {
  const VideoTemplateGalleryScreen({super.key, required this.section});

  final VideoTemplateSectionEntity section;
}

// at call site:
context.pushRoute
(
VideoTemplateGalleryRoute
(
section
:
section
)
);
```

### Navigation verbs

| Action            | Method                      |
|-------------------|-----------------------------|
| Push, keep stack  | `context.pushRoute(...)`    |
| Replace current   | `context.replaceRoute(...)` |
| Pop with fallback | `context.router.maybePop()` |

---

## 7. Dependency injection

Global instance is `injector` ([`injector.dart`](lib/core/injector/injector.dart)).

| Annotation                            | Lifetime                         | Use for                           |
|---------------------------------------|----------------------------------|-----------------------------------|
| `@injectable` / `@Injectable()`       | Factory (new instance per call)  | Cubits, transient services        |
| `@singleton`                          | Eager singleton                  | Use cases, stateless services     |
| `@LazySingleton()` / `@lazySingleton` | Lazy singleton                   | Heavy services, mock data sources |
| `@Singleton(as: SomeInterface)`       | Singleton bound to abstract type | Repository implementations        |

Repository pattern:

```dart
@Singleton(as: VideoTemplateRepository)
class VideoTemplateRepositoryImpl implements VideoTemplateRepository {
  ...
}
```

---

## 8. Code generation

Run after touching:

- Anything with `@freezed`, `@JsonSerializable`, or `fromJson`
- Retrofit data sources
- Isar entities (also register `Schema` in `Database.init`)
- `@injectable` annotations / new modules
- `@RoutePage` annotations or `AppRouter.routes`

```sh
dart run build_runner build --delete-conflicting-outputs
```

After editing `lib/l10n/arb/app_en.arb`:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

**Never** hand-edit `*.g.dart`, `*.freezed.dart`, `*.gr.dart`, `injector.config.dart`, or
`lib/l10n/gen/**`. Regenerate.

---

## 9. Networking

- New endpoints go in `lib/data/data_source/<feature>/` as `part` files of [
  `base_data_source.dart`](lib/data/data_source/base/base_data_source.dart). Do not create separate
  retrofit clients.
- Choose the base URL via `@Named(DioClientType.xxx) Dio dio` in the `@factoryMethod` constructor.
- Repository impl calls remote data source, applies `.toEntity()`, returns to domain.

For mock data sources while waiting on a backend, place under
`lib/data/data_source/<feature>/<feature>_mock_data_source.dart` with `@lazySingleton`. Repository
impl can swap remote↔mock without any layer above caring.

---

## 10. Persistence

- Local DB: `isar_community`. Register every new schema in `Database.init` ([
  `database.dart`](lib/data/data_source/database/database.dart)).
- KV: `shared_preferences`.
- Secrets / device IDs: `flutter_secure_storage`.

---

## 11. Performance patterns (videos, lists, expensive widgets)

For any feature with multiple concurrent expensive widgets in a scrollable list:

- Initialize the expensive resource (video controller, camera, etc.) **only when the widget is
  visibly on screen** (use `visibility_detector` package, threshold ≥ 0.4 visibleFraction).
- Debounce initialization (e.g. 250ms continuous visibility) so fast-scrolled items never start.
- Pause immediately on invisible; **dispose after a grace period** (e.g. 3 seconds) so quick
  back-swipes stay smooth but truly off-screen widgets release resources.
- Dispose in the widget's `dispose()` as well — `ListView.builder`'s cacheExtent will recycle
  widgets eventually.

Reference: [
`visibility_aware_video.dart`](lib/presentation/screen/video_template/widgets/visibility_aware_video.dart).

---

## 12. Failure modes I (the agent) am prone to. Avoid these.

Each is a real mistake made in this codebase. If you catch yourself doing one of these, stop and
reconsider.

1. **Inventing CDN URLs.** I used the Google `gtv-videos-bucket` sample MP4s assuming they were
   still public; they returned 403 across the board. Always `curl -I` a public URL before
   referencing it in code. Same applies to any third-party endpoint, asset CDN, or "well-known"
   public resource.
2. **Suffix drift.** Domain types named `XxxModel` instead of `XxxEntity` because I copied the older
   parts of this codebase that predate the convention. The convention in `§2` is binding for new
   code regardless of what older files do.
3. **Color literals creeping in.** Especially `Color(0x66000000)` for scrim gradients. Convert to
   `context.colors.scrim.withValues(alpha: 0.4)` and extend the theme if the base color is missing.
4. **Inline font sizes inside `AppText.style:`.** If you find yourself writing
   `style: TextStyle(fontSize: 18.sp)` on top of an `AppText.titleLarge`, pick a different variant.
   The `style:` override is for letterSpacing / shadows only.
5. **Raw `.w/.h/.r/.sp`** sprinkled across widgets. Always go through `AppConstant`.
6. **Multiple underscores in ignored params.** Modern Dart prefers `(_, _) =>` not `(_, __) =>`. The
   analyzer will warn.
7. **Drawing shadows on `Ink` widgets.** `Ink` is for splash painting onto Material; shadows
   misbehave. For shadowed buttons/cards, wrap in `DecoratedBox` (or `Container`) for shadow,
   `ClipRRect` for shape, then `Material(type: MaterialType.transparency) + InkWell` for tap
   feedback.
8. **`FittedBox` inside complex `Stack` + `ClipRRect` chains.** For video cover-fit, prefer an
   explicit `LayoutBuilder + OverflowBox + SizedBox` that computes scale-to-cover dimensions from
   the box constraints. FittedBox can silently behave differently than expected when constraints
   chain through multiple wrappers.
9. **Claiming UI works without running it.** I can verify analyzer + codegen from the CLI; I cannot
   verify pixel layout without a device. State that limit explicitly in the end-of-turn summary.
10. **Asking permission for trivial decisions, or no permission for big ones.** Calibrate: ask
    before changing the launch route, the data contract, or introducing a new top-level dependency.
    Don't ask before renaming a private variable.
11. **Hardcoded user-facing strings.** I shipped `'Upload image'`, `'Create'`, and snackbar messages
    as bare string literals. Per `§3.4`, every user-visible string goes through `context.l10n.X` and
    a key in `app_en.arb`. New strings without arb entries break translation work downstream — fix
    them in the same PR, not later.
12. **Reaching for "not supported in this build" snackbars instead of doing the work.** When the
    user asks for a feature (e.g. camera capture) and the dependency is missing, the answer is
    usually "add the dependency" not "show a friendly disabled message." Only fall back to a stub
    when the user explicitly authorizes deferral.

---

## 13. End-of-task checklist

Before declaring a task complete:

- [ ] `flutter analyze` on touched files: zero errors, no new warnings introduced.
- [ ] `dart run build_runner build --delete-conflicting-outputs` completed if any annotation
  changed.
- [ ] No hardcoded colors / hex literals in widgets.
- [ ] No raw `Text` widgets.
- [ ] No raw `.w/.h/.r/.sp` inline; all spacing via `AppConstant`.
- [ ] No bare user-facing string literals; all strings via `context.l10n.X`. New keys added to
  `app_en.arb` and `flutter gen-l10n` rerun.
- [ ] Domain types end in `Entity`; data DTOs end in `Model`/`Response`; mapper named `toEntity()`.
- [ ] New freezed types registered in their `base_*.dart` aggregator.
- [ ] Cubit state uses `BaseStatus<>`; derived getters on state.
- [ ] Branch name matches `^(feat|fix|refactor|chore)/.+`.
- [ ] Commit follows Conventional Commits: `feat: ...`, `fix: ...`, etc.
- [ ] Summary states explicitly what is verified vs not verified (e.g. "compiles + analyzes clean; I
  did not launch the app").

---

## 14. Git workflow (enforced by hooks)

- Branch: `^(feat|fix|refactor|chore)/.+` (exceptions: `main`, `develop`, `master`)
- Commit: `^(feat|fix|refactor|chore|docs|style|test|perf|ci|build|revert): .{3,}$`
- PRs target `dev`. CI runs against `main`.
- Never `--no-verify` unless the user explicitly asks. Hook failures get fixed, not bypassed.
- Never amend a published commit. Create a new commit on top.
