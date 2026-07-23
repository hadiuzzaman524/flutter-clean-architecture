import 'package:flutter/material.dart';

/// One layer in the Clean Architecture diagram (outermost first).
class ArchitectureLayer {
  const ArchitectureLayer({
    required this.title,
    required this.path,
    required this.description,
    required this.connector,
  });

  final String title;
  final String path;
  final String description;

  /// Label for the connector drawn to the layer below.
  final String connector;
}

/// One design pattern, tied to the concrete class that implements it.
class ArchitecturePattern {
  const ArchitecturePattern({
    required this.icon,
    required this.name,
    required this.className,
    required this.description,
    required this.demonstratedIn,
  });

  final IconData icon;
  final String name;

  /// The concrete class / widget in the repo (shown as a monospace chip).
  final String className;
  final String description;
  final String demonstratedIn;
}

/// A GoF category grouping a set of [ArchitecturePattern]s.
class PatternCategory {
  const PatternCategory({required this.title, required this.patterns});

  final String title;
  final List<ArchitecturePattern> patterns;
}

/// The layers, ordered from outermost (Presentation) to innermost (Data impl).
const List<ArchitectureLayer> architectureLayers = [
  ArchitectureLayer(
    title: 'Presentation',
    path: 'lib/presentation',
    description: 'BLoC / Cubit, screens, theme tokens and reusable widgets.',
    connector: 'depends on',
  ),
  ArchitectureLayer(
    title: 'Domain',
    path: 'lib/domain',
    description: 'Entities, use-cases and repository interfaces. Pure Dart, '
        'no Flutter.',
    connector: 'implemented by',
  ),
  ArchitectureLayer(
    title: 'Data',
    path: 'lib/data',
    description: 'Repository implementations, data sources (mock + remote) '
        'and DTO remappers.',
    connector: '',
  ),
];

/// Every design pattern this template demonstrates, grouped GoF-style and
/// each tied to the real class / widget that implements it.
const List<PatternCategory> architectureCategories = [
  PatternCategory(
    title: 'Creational',
    patterns: [
      ArchitecturePattern(
        icon: Icons.copy_all_outlined,
        name: 'Singleton',
        className: 'EnLightMode · get_it',
        description: 'One shared instance for the whole app — get_it returns '
            'the same object, and theme modes cache themselves behind a '
            'factory constructor.',
        demonstratedIn: 'theme switching & the DI graph',
      ),
      ArchitecturePattern(
        icon: Icons.precision_manufacturing_outlined,
        name: 'Factory Method',
        className: 'AppText.titleLarge()',
        description: 'Named factory constructors build the right configured '
            'object without exposing the constructor — the whole typed text '
            'scale is factory methods.',
        demonstratedIn: 'every AppText.* in the UI',
      ),
      ArchitecturePattern(
        icon: Icons.account_tree_outlined,
        name: 'Abstract Factory',
        className: 'DataSourceFactory',
        description: 'Creates whole families of related data sources (user + '
            'auth). The flavor picks Mock vs Remote at DI time, so dev runs '
            'offline.',
        demonstratedIn: 'the Home user directory',
      ),
      ArchitecturePattern(
        icon: Icons.content_copy_outlined,
        name: 'Prototype',
        className: 'AppColors.copyWith()',
        description: 'Clone-and-modify: copyWith / lerp produce a new object '
            'from an existing one — how themes interpolate and entities update '
            'immutably.',
        demonstratedIn: 'theme transitions & state updates',
      ),
    ],
  ),
  PatternCategory(
    title: 'Structural',
    patterns: [
      ArchitecturePattern(
        icon: Icons.swap_horiz_outlined,
        name: 'Adapter',
        className: 'UserResponseMapper',
        description: 'Adapts the API’s UserResponseModel shape into the domain '
            'UserEntity the app expects, keeping the two independent.',
        demonstratedIn: 'the user-list mapping',
      ),
      ArchitecturePattern(
        icon: Icons.alt_route_outlined,
        name: 'Bridge',
        className: 'BaseThemeInfo',
        description: 'Separates the theme abstraction from its colour and text '
            'implementations, so each can vary independently.',
        demonstratedIn: 'the light / dark theme system',
      ),
      ArchitecturePattern(
        icon: Icons.dashboard_customize_outlined,
        name: 'Facade',
        className: 'SecureStorageService',
        description: 'A small, task-focused API over the sprawling '
            'FlutterSecureStorage — callers just get / set the access token.',
        demonstratedIn: 'login & session checks',
      ),
      ArchitecturePattern(
        icon: Icons.shield_outlined,
        name: 'Proxy',
        className: 'UserSubscriptionProxyRepositoryImpl',
        description: 'Stands in for the real repository and enforces access — '
            'throws SubscriptionRequiredException until the user subscribes.',
        demonstratedIn: 'the premium gate',
      ),
      ArchitecturePattern(
        icon: Icons.layers_outlined,
        name: 'Decorator',
        className: 'UserCacheRepositoryImpl',
        description: 'Wraps the remote repository and adds cache-first '
            'behaviour without changing its interface.',
        demonstratedIn: 'cached user loading',
      ),
    ],
  ),
  PatternCategory(
    title: 'Behavioral',
    patterns: [
      ArchitecturePattern(
        icon: Icons.bolt_outlined,
        name: 'Observer (BLoC)',
        className: 'UserCubit · BaseStatus',
        description: 'The UI subscribes to a stream of immutable states; the '
            'Cubit emits, BlocBuilder rebuilds. State in, UI out.',
        demonstratedIn: 'loading / success / error states',
      ),
      ArchitecturePattern(
        icon: Icons.link_outlined,
        name: 'Chain of Responsibility',
        className: 'BackendErrorInterceptor',
        description: 'A Dio interceptor in the request/response chain that '
            'translates raw backend errors into typed ResponseErrors.',
        demonstratedIn: 'every network error message',
      ),
    ],
  ),
  PatternCategory(
    title: 'Architectural',
    patterns: [
      ArchitecturePattern(
        icon: Icons.hub_outlined,
        name: 'Dependency Injection',
        className: 'injectable + get_it',
        description: 'Classes declare their dependencies; the container wires '
            'the graph and gates registrations per environment.',
        demonstratedIn: 'core/injector — app-wide',
      ),
      ArchitecturePattern(
        icon: Icons.inventory_2_outlined,
        name: 'Repository',
        className: 'UserRepository',
        description: 'A domain-owned interface hiding data origins — the UI '
            'never knows if data is mocked, cached, remote or gated.',
        demonstratedIn: 'all user-data access',
      ),
    ],
  ),
];
