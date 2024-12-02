import 'package:ecomeal/services/api/api_service.dart';
import 'package:ecomeal/services/recipes_service.dart';
import 'package:ecomeal/viewmodels/startup/startup_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.instance;

void registerServices() {
  locator.registerSingleton<ApiService>(ApiService());

  locator.registerFactory<RecipeService>(() => RecipeService());
}

void registerViewModels() {
   locator.registerFactory<StartupViewModel>(() => StartupViewModel());
}

void registerProviders() {
  throw UnimplementedError();
}

Future<void> setupLocator() async {
  // register logger for dev
  locator.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 100,
        colors: true,
      ),
    ),
  );

  registerServices();
  registerViewModels();
  // registerProviders();
  await locator.allReady();
}