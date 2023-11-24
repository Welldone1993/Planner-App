import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:planner_project/src/infrastructures/routes/route_names.dart';

import '../../pages/home_page/commons/home_page_binding.dart';
import '../../pages/home_page/view/home_page_view.dart';

class PlannerModulePages {
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: PlannerRouteNames.homePage.path,
      page: HomePageView.new,
      binding: HomePageBinding(),
    ),
  ];
}
