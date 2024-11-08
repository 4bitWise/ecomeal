import 'package:ecomeal/views/startup/startup_view.dart';
import 'package:flutter/material.dart';
//import 'package:ecomeal/lib/common/validation_view.dart';

import 'constants/routes.dart';

/// [AppRouter]
/// This the base router to handle routes
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.startup:
        return MaterialPageRoute(builder: (_) => const StartupView());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}