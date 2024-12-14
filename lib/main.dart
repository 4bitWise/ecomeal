import 'package:ecomeal/app_locator.dart';
// import 'package:ecomeal/app_providers.dart';
import 'package:ecomeal/app_router.dart';
import 'package:ecomeal/constants/routes.dart';
import 'package:ecomeal/constants/strings.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

Future globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
}

void main() async {
  await globalInitializer();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Debug oversized images
    // debugInvertOversizedImages = true;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      initialRoute: RoutePaths.budget,
      onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
    );
  }
}
