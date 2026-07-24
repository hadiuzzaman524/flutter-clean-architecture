import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/l10n.dart';

/// One layer in the Clean Architecture diagram (outermost first).
class ArchitectureLayer {
  const ArchitectureLayer({
    required this.title,
    required this.path,
    required this.description,
    required this.connector,
  });

  final String title;

  /// Source path — a code identifier, kept literal (not localized).
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

  /// The concrete class / widget in the repo — a code identifier, kept
  /// literal (shown as a monospace chip, never translated).
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
List<ArchitectureLayer> architectureLayers(AppLocalizations l10n) => [
  ArchitectureLayer(
    title: l10n.archLayerPresentationTitle,
    path: 'lib/presentation',
    description: l10n.archLayerPresentationDesc,
    connector: l10n.archConnectorDependsOn,
  ),
  ArchitectureLayer(
    title: l10n.archLayerDomainTitle,
    path: 'lib/domain',
    description: l10n.archLayerDomainDesc,
    connector: l10n.archConnectorImplementedBy,
  ),
  ArchitectureLayer(
    title: l10n.archLayerDataTitle,
    path: 'lib/data',
    description: l10n.archLayerDataDesc,
    connector: '',
  ),
];

/// Every design pattern this template demonstrates, grouped GoF-style and
/// each tied to the real class / widget that implements it.
List<PatternCategory> architectureCategories(AppLocalizations l10n) => [
  PatternCategory(
    title: l10n.archCatCreational,
    patterns: [
      ArchitecturePattern(
        icon: Icons.copy_all_outlined,
        name: l10n.patternSingletonName,
        className: 'EnLightMode · get_it',
        description: l10n.patternSingletonDesc,
        demonstratedIn: l10n.patternSingletonSeen,
      ),
      ArchitecturePattern(
        icon: Icons.precision_manufacturing_outlined,
        name: l10n.patternFactoryName,
        className: 'AppText.titleLarge()',
        description: l10n.patternFactoryDesc,
        demonstratedIn: l10n.patternFactorySeen,
      ),
      ArchitecturePattern(
        icon: Icons.account_tree_outlined,
        name: l10n.patternAbstractFactoryName,
        className: 'DataSourceFactory',
        description: l10n.patternAbstractFactoryDesc,
        demonstratedIn: l10n.patternAbstractFactorySeen,
      ),
      ArchitecturePattern(
        icon: Icons.content_copy_outlined,
        name: l10n.patternPrototypeName,
        className: 'AppColors.copyWith()',
        description: l10n.patternPrototypeDesc,
        demonstratedIn: l10n.patternPrototypeSeen,
      ),
    ],
  ),
  PatternCategory(
    title: l10n.archCatStructural,
    patterns: [
      ArchitecturePattern(
        icon: Icons.swap_horiz_outlined,
        name: l10n.patternAdapterName,
        className: 'UserResponseMapper',
        description: l10n.patternAdapterDesc,
        demonstratedIn: l10n.patternAdapterSeen,
      ),
      ArchitecturePattern(
        icon: Icons.alt_route_outlined,
        name: l10n.patternBridgeName,
        className: 'BaseThemeInfo',
        description: l10n.patternBridgeDesc,
        demonstratedIn: l10n.patternBridgeSeen,
      ),
      ArchitecturePattern(
        icon: Icons.dashboard_customize_outlined,
        name: l10n.patternFacadeName,
        className: 'SecureStorageService',
        description: l10n.patternFacadeDesc,
        demonstratedIn: l10n.patternFacadeSeen,
      ),
      ArchitecturePattern(
        icon: Icons.shield_outlined,
        name: l10n.patternProxyName,
        className: 'UserSubscriptionProxyRepositoryImpl',
        description: l10n.patternProxyDesc,
        demonstratedIn: l10n.patternProxySeen,
      ),
      ArchitecturePattern(
        icon: Icons.layers_outlined,
        name: l10n.patternDecoratorName,
        className: 'UserCacheRepositoryImpl',
        description: l10n.patternDecoratorDesc,
        demonstratedIn: l10n.patternDecoratorSeen,
      ),
    ],
  ),
  PatternCategory(
    title: l10n.archCatBehavioral,
    patterns: [
      ArchitecturePattern(
        icon: Icons.bolt_outlined,
        name: l10n.patternObserverName,
        className: 'UserCubit · BaseStatus',
        description: l10n.patternObserverDesc,
        demonstratedIn: l10n.patternObserverSeen,
      ),
      ArchitecturePattern(
        icon: Icons.link_outlined,
        name: l10n.patternChainName,
        className: 'BackendErrorInterceptor',
        description: l10n.patternChainDesc,
        demonstratedIn: l10n.patternChainSeen,
      ),
    ],
  ),
  PatternCategory(
    title: l10n.archCatArchitectural,
    patterns: [
      ArchitecturePattern(
        icon: Icons.hub_outlined,
        name: l10n.patternDiName,
        className: 'injectable + get_it',
        description: l10n.patternDiDesc,
        demonstratedIn: l10n.patternDiSeen,
      ),
      ArchitecturePattern(
        icon: Icons.inventory_2_outlined,
        name: l10n.patternRepositoryName,
        className: 'UserRepository',
        description: l10n.patternRepositoryDesc,
        demonstratedIn: l10n.patternRepositorySeen,
      ),
    ],
  ),
];
