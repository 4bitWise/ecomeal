import 'package:ecomeal/views/budget/budget_view.dart';
import 'package:ecomeal/views/home/home_view.dart';
import 'package:flutter/material.dart';

import 'constants/routes.dart';

/// [AppRouter]
/// This the base router to handle routes
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.budget:
        return MaterialPageRoute(builder: (_) => const BudgetView());
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
