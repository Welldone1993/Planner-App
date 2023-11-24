import 'package:planner_project/src/infrastructures/routes/route_paths.dart';

class Routes {
  final String uri;
  final String path;

  const Routes(this.uri, [final String? path]) : path = path ?? uri;
}

class PlannerRouteNames extends Routes {
  PlannerRouteNames(super.uri);

  /// home Page
  static const Routes homePage = Routes(
    RoutePaths.homePage,
    RoutePaths.homePage,
  );
}
