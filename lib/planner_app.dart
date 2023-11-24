import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planner_project/src/infrastructures/routes/route_names.dart';
import 'package:planner_project/src/infrastructures/routes/route_pages.dart';

class PlannerApp extends StatelessWidget {
  const PlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        ...PlannerModulePages.routes,
      ],
      initialRoute: PlannerRouteNames.homePage.uri,
    );
  }
}
