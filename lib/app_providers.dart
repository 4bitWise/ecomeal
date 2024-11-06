import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'app_locator.dart';
// import 'providers/auth_provider.dart';
// import 'providers/locale_provider.dart';
// import 'providers/theme_provider.dart';

class AppProviders {
  AppProviders._();

  static final providers = <SingleChildWidget>[
    // ChangeNotifierProvider(create: (context) => locator<ThemeProvider>()),
    // ChangeNotifierProvider(create: (context) => locator<LocaleProvider>()),
    // ChangeNotifierProvider(create: (context) => locator<AuthProvider>()),
  ];
}