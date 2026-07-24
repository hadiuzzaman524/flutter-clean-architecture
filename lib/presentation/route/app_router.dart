import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/presentation/route/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: WebViewRoute.page),
    AutoRoute(page: LogInRoute.page),
    AutoRoute(
      page: DashboardRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: WidgetsRoute.page),
        AutoRoute(page: ArchitectureRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
  ];
}
